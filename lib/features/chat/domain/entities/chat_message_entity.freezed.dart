// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMessageEntity {


/// Create a copy of ChatMessageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageEntityCopyWith<ChatMessageEntity> get copyWith => _$ChatMessageEntityCopyWithImpl<ChatMessageEntity>(this as ChatMessageEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChatMessageEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.profileId, _this.profileId) || other.profileId == _this.profileId)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as ChatMessageEntity;
  return Object.hash(runtimeType,_this.id,_this.profileId,_this.content,_this.createdAt);
}

@override
String toString() {
  final _this = this as ChatMessageEntity;
  return 'ChatMessageEntity(id: ${_this.id}, profileId: ${_this.profileId}, content: ${_this.content}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ChatMessageEntityCopyWith<$Res>  {
  factory $ChatMessageEntityCopyWith(ChatMessageEntity value, $Res Function(ChatMessageEntity) _then) = _$ChatMessageEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String content, DateTime createdAt
});




}
/// @nodoc
class _$ChatMessageEntityCopyWithImpl<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  _$ChatMessageEntityCopyWithImpl(this._self, this._then);

  final ChatMessageEntity _self;
  final $Res Function(ChatMessageEntity) _then;

/// Create a copy of ChatMessageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(ChatMessageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}



// dart format on
