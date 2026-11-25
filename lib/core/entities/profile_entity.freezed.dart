// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {


/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfileEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.avatarPath, _this.avatarPath) || other.avatarPath == _this.avatarPath)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.followerCount, _this.followerCount) || other.followerCount == _this.followerCount)&&(identical(other.followingCount, _this.followingCount) || other.followingCount == _this.followingCount)&&(identical(other.postCount, _this.postCount) || other.postCount == _this.postCount));
}


@override
int get hashCode {
  final _this = this as ProfileEntity;
  return Object.hash(runtimeType,_this.id,_this.email,_this.username,_this.avatarPath,_this.avatarUrl,_this.followerCount,_this.followingCount,_this.postCount);
}

@override
String toString() {
  final _this = this as ProfileEntity;
  return 'ProfileEntity(id: ${_this.id}, email: ${_this.email}, username: ${_this.username}, avatarPath: ${_this.avatarPath}, avatarUrl: ${_this.avatarUrl}, followerCount: ${_this.followerCount}, followingCount: ${_this.followingCount}, postCount: ${_this.postCount})';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String email, String username, String? avatarPath, String? avatarUrl, int followerCount, int followingCount, int postCount
});




}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? username = null,Object? avatarPath = freezed,Object? avatarUrl = freezed,Object? followerCount = null,Object? followingCount = null,Object? postCount = null,}) {
  return _then(ProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



// dart format on
