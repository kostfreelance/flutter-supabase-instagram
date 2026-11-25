import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/dtos/profile_dto.dart';
import 'package:fsi/core/providers/supabase_provider.dart';
import '../dtos/chat_dto.dart';
import '../dtos/chat_message_dto.dart';

part 'chat_api_service.g.dart';

@riverpod
ChatApiService chatApiService(Ref ref) =>
  ChatApiService(ref.watch(supabaseClientProvider));

class ChatApiService {
  final SupabaseClient _supabaseClient;

  ChatApiService(this._supabaseClient);

  Stream<List<ChatDto>> watchChats() {
    return _supabaseClient
      .from('chats')
      .stream(primaryKey: ['id'])
      .order('updated_at', ascending: false)
      .asyncMap((chatsData) async {
        if (chatsData.isEmpty) return [];
        final currentProfileId = _supabaseClient.auth.currentUser!.id;
        final chatIds = chatsData.map((c) => c['id'] as String).toList();
        final currentParticipantsData = await _supabaseClient
          .from('chat_participants')
          .select()
          .eq('profile_id', currentProfileId)
          .inFilter('chat_id', chatIds);
        final currentParticipants = <String, DateTime>{
          for (var e in currentParticipantsData)
            e['chat_id']: DateTime.parse(e['updated_at'] as String)
        };
        final chatDtos = <ChatDto>[];
        for (final chatData in chatsData) {
          final chatId = chatData['id'] as String;
          final otherProfileId = (List<String>.from(chatData['participant_ids'] as List))
            .firstWhere((e) => e != currentProfileId);
          final otherProfileData = await _supabaseClient
            .from('profiles')
            .select()
            .eq('id', otherProfileId)
            .single();
          final otherProfile = ProfileDto.fromJson(otherProfileData);
          final lastMessageData = await _supabaseClient
            .from('chat_messages')
            .select()
            .eq('chat_id', chatId)
            .order('created_at', ascending: false)
            .limit(1);
          final lastMessage = lastMessageData.isNotEmpty ?
            ChatMessageDto.fromJson(lastMessageData.first) : null;
          chatDtos.add(ChatDto(
            id: chatId,
            profile: otherProfile,
            lastChatMessage: lastMessage,
            hasUnread: lastMessage == null || (
              lastMessage.profileId != currentProfileId &&
              lastMessage.createdAt.isAfter(currentParticipants[chatId]!)
            )
          ));
        }
        return chatDtos;
      });
  }

  Future<String?> fetchChatId(String profileId) async {
    final chatData = await _supabaseClient
      .from('chats')
      .select()
      .contains('participant_ids', [_supabaseClient.auth.currentUser!.id, profileId]..sort())
      .maybeSingle();
    return chatData?['id'];
  }

  Future<String> addChat(String profileId) async {
    final chatData = await _supabaseClient
      .from('chats')
      .insert({'participant_ids': [_supabaseClient.auth.currentUser!.id, profileId]..sort()})
      .select()
      .single();
    final chatId = chatData['id'];
    await _supabaseClient.from('chat_participants').insert({
      'chat_id': chatId,
      'profile_id': _supabaseClient.auth.currentUser!.id
    });
    await _supabaseClient.from('chat_participants').insert({
      'chat_id': chatId,
      'profile_id': profileId
    });
    return chatId;
  }

  Future<void> deleteChat(String chatId) {
    return _supabaseClient
      .from('chats')
      .delete()
      .eq('id', chatId);
  }

  Stream<List<ChatMessageDto>> watchChatMessages({
    required String chatId,
    required int limit
  }) {
    return _supabaseClient
      .from('chat_messages')
      .stream(primaryKey: ['id'])
      .eq('chat_id', chatId)
      .order('created_at', ascending: false)
      .limit(limit)
      .asyncMap((chatMessagesData) async {
        if (chatMessagesData.isEmpty) return [];
        final now = DateTime.now().toUtc().toIso8601String();
        await _supabaseClient
          .from('chat_participants')
          .update({'updated_at': now})
          .eq('chat_id', chatId)
          .eq('profile_id', _supabaseClient.auth.currentUser!.id);
        await _supabaseClient
          .from('chats')
          .update({'updated_at': now})
          .eq('id', chatId);
        return chatMessagesData.map((e) => ChatMessageDto.fromJson(e)).toList();
      });
  }

  Future<List<ChatMessageDto>> fetchChatMessages({
    required String chatId,
    required int page,
    required int pageSize
  }) async {
    final from = page * pageSize;
    final to = from + pageSize - 1;
    final chatMessagesData = await _supabaseClient
      .from('chat_messages')
      .select()
      .eq('chat_id', chatId)
      .order('created_at', ascending: false)
      .range(from, to);
    return chatMessagesData.map((e) => ChatMessageDto.fromJson(e)).toList();
  }

  Future<void> addChatMessage({
    required String chatId,
    required String profileId,
    required String content
  }) async {
    await _supabaseClient.from('chat_messages').insert({
      'chat_id': chatId,
      'profile_id': _supabaseClient.auth.currentUser!.id,
      'content': content,
      'participant_ids': [_supabaseClient.auth.currentUser!.id, profileId]..sort()
    });
    return _supabaseClient
      .from('chats')
      .update({'updated_at': DateTime.now().toUtc().toIso8601String()})
      .eq('id', chatId);
  }
}