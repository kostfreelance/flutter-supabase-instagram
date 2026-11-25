import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/entities/chat_entity.dart';

part 'chat_list_controller.g.dart';

@riverpod
class ChatListController extends _$ChatListController {
  String _searchQuery = '';

  @override
  Stream<List<ChatEntity>> build() {
    final chatsStream = ref.watch(chatRepositoryProvider).watchChats();
    if (_searchQuery.isEmpty) {
      return chatsStream;
    }
    return chatsStream.map((chats) =>
      chats.where((e) => 
        e.profile.username.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList()
    );
  }

  void updateSearchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    ref.invalidateSelf();
  }

  Future<void> onDeletePressed(String chatId) {
    return ref.read(chatRepositoryProvider).deleteChat(chatId);
  }
}