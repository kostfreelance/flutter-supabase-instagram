// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_detail_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileDetailState {

 String get currentProfileId; ProfileEntity get profile; List<PostEntity> get posts; bool get isFollowing;
/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDetailStateCopyWith<ProfileDetailState> get copyWith => _$ProfileDetailStateCopyWithImpl<ProfileDetailState>(this as ProfileDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfileDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetailState&&(identical(other.currentProfileId, _this.currentProfileId) || other.currentProfileId == _this.currentProfileId)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&const DeepCollectionEquality().equals(other.posts, _this.posts)&&(identical(other.isFollowing, _this.isFollowing) || other.isFollowing == _this.isFollowing));
}


@override
int get hashCode {
  final _this = this as ProfileDetailState;
  return Object.hash(runtimeType,_this.currentProfileId,_this.profile,const DeepCollectionEquality().hash(_this.posts),_this.isFollowing);
}

@override
String toString() {
  final _this = this as ProfileDetailState;
  return 'ProfileDetailState(currentProfileId: ${_this.currentProfileId}, profile: ${_this.profile}, posts: ${_this.posts}, isFollowing: ${_this.isFollowing})';
}


}

/// @nodoc
abstract mixin class $ProfileDetailStateCopyWith<$Res>  {
  factory $ProfileDetailStateCopyWith(ProfileDetailState value, $Res Function(ProfileDetailState) _then) = _$ProfileDetailStateCopyWithImpl;
@useResult
$Res call({
 String currentProfileId, ProfileEntity profile, List<PostEntity> posts, bool isFollowing
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileDetailStateCopyWithImpl<$Res>
    implements $ProfileDetailStateCopyWith<$Res> {
  _$ProfileDetailStateCopyWithImpl(this._self, this._then);

  final ProfileDetailState _self;
  final $Res Function(ProfileDetailState) _then;

/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentProfileId = null,Object? profile = null,Object? posts = null,Object? isFollowing = null,}) {
  return _then(ProfileDetailState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileDetailState].
extension ProfileDetailStatePatterns on ProfileDetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentProfileId,  ProfileEntity profile,  List<PostEntity> posts,  bool isFollowing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
return $default(_that.currentProfileId,_that.profile,_that.posts,_that.isFollowing);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentProfileId,  ProfileEntity profile,  List<PostEntity> posts,  bool isFollowing)  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailState():
return $default(_that.currentProfileId,_that.profile,_that.posts,_that.isFollowing);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentProfileId,  ProfileEntity profile,  List<PostEntity> posts,  bool isFollowing)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailState() when $default != null:
return $default(_that.currentProfileId,_that.profile,_that.posts,_that.isFollowing);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileDetailState implements ProfileDetailState {
  const _ProfileDetailState({required this.currentProfileId, required this.profile, required  List<PostEntity> posts, required this.isFollowing}): _posts = posts;
  

@override final  String currentProfileId;
@override final  ProfileEntity profile;
 final  List<PostEntity> _posts;
@override List<PostEntity> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override final  bool isFollowing;

/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDetailStateCopyWith<_ProfileDetailState> get copyWith => __$ProfileDetailStateCopyWithImpl<_ProfileDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDetailState&&(identical(other.currentProfileId, currentProfileId) || other.currentProfileId == currentProfileId)&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other.posts, _posts)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentProfileId,profile,const DeepCollectionEquality().hash(_posts),isFollowing);
}

@override
String toString() {
    return 'ProfileDetailState(currentProfileId: $currentProfileId, profile: $profile, posts: $posts, isFollowing: $isFollowing)';
}


}

/// @nodoc
abstract mixin class _$ProfileDetailStateCopyWith<$Res> implements $ProfileDetailStateCopyWith<$Res> {
  factory _$ProfileDetailStateCopyWith(_ProfileDetailState value, $Res Function(_ProfileDetailState) _then) = __$ProfileDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String currentProfileId, ProfileEntity profile, List<PostEntity> posts, bool isFollowing
});


@override $ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class __$ProfileDetailStateCopyWithImpl<$Res>
    implements _$ProfileDetailStateCopyWith<$Res> {
  __$ProfileDetailStateCopyWithImpl(this._self, this._then);

  final _ProfileDetailState _self;
  final $Res Function(_ProfileDetailState) _then;

/// Create a copy of ProfileDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentProfileId = null,Object? profile = null,Object? posts = null,Object? isFollowing = null,}) {
  return _then(_ProfileDetailState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProfileDetailState
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
