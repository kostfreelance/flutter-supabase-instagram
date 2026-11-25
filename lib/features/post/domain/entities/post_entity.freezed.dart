// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostEntity {


/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PostEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.fileUrl, _this.fileUrl) || other.fileUrl == _this.fileUrl)&&(identical(other.filePath, _this.filePath) || other.filePath == _this.filePath)&&(identical(other.thumbUrl, _this.thumbUrl) || other.thumbUrl == _this.thumbUrl)&&(identical(other.thumbPath, _this.thumbPath) || other.thumbPath == _this.thumbPath)&&(identical(other.caption, _this.caption) || other.caption == _this.caption)&&(identical(other.likeCount, _this.likeCount) || other.likeCount == _this.likeCount)&&(identical(other.commentCount, _this.commentCount) || other.commentCount == _this.commentCount)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.isLiked, _this.isLiked) || other.isLiked == _this.isLiked));
}


@override
int get hashCode {
  final _this = this as PostEntity;
  return Object.hash(runtimeType,_this.id,_this.profile,_this.fileUrl,_this.filePath,_this.thumbUrl,_this.thumbPath,_this.caption,_this.likeCount,_this.commentCount,_this.createdAt,_this.isLiked);
}

@override
String toString() {
  final _this = this as PostEntity;
  return 'PostEntity(id: ${_this.id}, profile: ${_this.profile}, fileUrl: ${_this.fileUrl}, filePath: ${_this.filePath}, thumbUrl: ${_this.thumbUrl}, thumbPath: ${_this.thumbPath}, caption: ${_this.caption}, likeCount: ${_this.likeCount}, commentCount: ${_this.commentCount}, createdAt: ${_this.createdAt}, isLiked: ${_this.isLiked})';
}


}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res>  {
  factory $PostEntityCopyWith(PostEntity value, $Res Function(PostEntity) _then) = _$PostEntityCopyWithImpl;
@useResult
$Res call({
 String id, ProfileEntity profile, String fileUrl, String filePath, String? thumbUrl, String? thumbPath, String caption, int likeCount, int commentCount, DateTime createdAt, bool isLiked
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$PostEntityCopyWithImpl<$Res>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._self, this._then);

  final PostEntity _self;
  final $Res Function(PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profile = null,Object? fileUrl = null,Object? filePath = null,Object? thumbUrl = freezed,Object? thumbPath = freezed,Object? caption = null,Object? likeCount = null,Object? commentCount = null,Object? createdAt = null,Object? isLiked = null,}) {
  return _then(PostEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,thumbUrl: freezed == thumbUrl ? _self.thumbUrl : thumbUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbPath: freezed == thumbPath ? _self.thumbPath : thumbPath // ignore: cast_nullable_to_non_nullable
as String?,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}



// dart format on
