// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEntity {


/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatEntityCopyWith<ChatEntity> get copyWith => _$ChatEntityCopyWithImpl<ChatEntity>(this as ChatEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChatEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.lastChatMessage, _this.lastChatMessage) || other.lastChatMessage == _this.lastChatMessage)&&(identical(other.hasUnread, _this.hasUnread) || other.hasUnread == _this.hasUnread));
}


@override
int get hashCode {
  final _this = this as ChatEntity;
  return Object.hash(runtimeType,_this.id,_this.profile,_this.lastChatMessage,_this.hasUnread);
}

@override
String toString() {
  final _this = this as ChatEntity;
  return 'ChatEntity(id: ${_this.id}, profile: ${_this.profile}, lastChatMessage: ${_this.lastChatMessage}, hasUnread: ${_this.hasUnread})';
}


}

/// @nodoc
abstract mixin class $ChatEntityCopyWith<$Res>  {
  factory $ChatEntityCopyWith(ChatEntity value, $Res Function(ChatEntity) _then) = _$ChatEntityCopyWithImpl;
@useResult
$Res call({
 String id, ProfileEntity profile, ChatMessageEntity? lastChatMessage, bool hasUnread
});


$ProfileEntityCopyWith<$Res> get profile;$ChatMessageEntityCopyWith<$Res>? get lastChatMessage;

}
/// @nodoc
class _$ChatEntityCopyWithImpl<$Res>
    implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._self, this._then);

  final ChatEntity _self;
  final $Res Function(ChatEntity) _then;

/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profile = null,Object? lastChatMessage = freezed,Object? hasUnread = null,}) {
  return _then(ChatEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,lastChatMessage: freezed == lastChatMessage ? _self.lastChatMessage : lastChatMessage // ignore: cast_nullable_to_non_nullable
as ChatMessageEntity?,hasUnread: null == hasUnread ? _self.hasUnread : hasUnread // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageEntityCopyWith<$Res>? get lastChatMessage {
    if (_self.lastChatMessage == null) {
    return null;
  }

  return $ChatMessageEntityCopyWith<$Res>(_self.lastChatMessage!, (value) {
    return _then(_self.copyWith(lastChatMessage: value));
  });
}
}



// dart format on
