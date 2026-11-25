// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostListState {

 String get currentProfileId; List<PostEntity> get posts; bool get hasMore; bool get isSearchOpen;
/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListStateCopyWith<PostListState> get copyWith => _$PostListStateCopyWithImpl<PostListState>(this as PostListState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PostListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListState&&(identical(other.currentProfileId, _this.currentProfileId) || other.currentProfileId == _this.currentProfileId)&&const DeepCollectionEquality().equals(other.posts, _this.posts)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isSearchOpen, _this.isSearchOpen) || other.isSearchOpen == _this.isSearchOpen));
}


@override
int get hashCode {
  final _this = this as PostListState;
  return Object.hash(runtimeType,_this.currentProfileId,const DeepCollectionEquality().hash(_this.posts),_this.hasMore,_this.isSearchOpen);
}

@override
String toString() {
  final _this = this as PostListState;
  return 'PostListState(currentProfileId: ${_this.currentProfileId}, posts: ${_this.posts}, hasMore: ${_this.hasMore}, isSearchOpen: ${_this.isSearchOpen})';
}


}

/// @nodoc
abstract mixin class $PostListStateCopyWith<$Res>  {
  factory $PostListStateCopyWith(PostListState value, $Res Function(PostListState) _then) = _$PostListStateCopyWithImpl;
@useResult
$Res call({
 String currentProfileId, List<PostEntity> posts, bool hasMore, bool isSearchOpen
});




}
/// @nodoc
class _$PostListStateCopyWithImpl<$Res>
    implements $PostListStateCopyWith<$Res> {
  _$PostListStateCopyWithImpl(this._self, this._then);

  final PostListState _self;
  final $Res Function(PostListState) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentProfileId = null,Object? posts = null,Object? hasMore = null,Object? isSearchOpen = null,}) {
  return _then(PostListState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isSearchOpen: null == isSearchOpen ? _self.isSearchOpen : isSearchOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostListState].
extension PostListStatePatterns on PostListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostListState value)  $default,){
final _that = this;
switch (_that) {
case _PostListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostListState value)?  $default,){
final _that = this;
switch (_that) {
case _PostListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentProfileId,  List<PostEntity> posts,  bool hasMore,  bool isSearchOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostListState() when $default != null:
return $default(_that.currentProfileId,_that.posts,_that.hasMore,_that.isSearchOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentProfileId,  List<PostEntity> posts,  bool hasMore,  bool isSearchOpen)  $default,) {final _that = this;
switch (_that) {
case _PostListState():
return $default(_that.currentProfileId,_that.posts,_that.hasMore,_that.isSearchOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentProfileId,  List<PostEntity> posts,  bool hasMore,  bool isSearchOpen)?  $default,) {final _that = this;
switch (_that) {
case _PostListState() when $default != null:
return $default(_that.currentProfileId,_that.posts,_that.hasMore,_that.isSearchOpen);case _:
  return null;

}
}

}

/// @nodoc


class _PostListState implements PostListState {
  const _PostListState({required this.currentProfileId, required  List<PostEntity> posts, required this.hasMore, this.isSearchOpen = false}): _posts = posts;
  

@override final  String currentProfileId;
 final  List<PostEntity> _posts;
@override List<PostEntity> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override final  bool hasMore;
@override@JsonKey() final  bool isSearchOpen;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListStateCopyWith<_PostListState> get copyWith => __$PostListStateCopyWithImpl<_PostListState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListState&&(identical(other.currentProfileId, currentProfileId) || other.currentProfileId == currentProfileId)&&const DeepCollectionEquality().equals(other.posts, _posts)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isSearchOpen, isSearchOpen) || other.isSearchOpen == isSearchOpen));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentProfileId,const DeepCollectionEquality().hash(_posts),hasMore,isSearchOpen);
}

@override
String toString() {
    return 'PostListState(currentProfileId: $currentProfileId, posts: $posts, hasMore: $hasMore, isSearchOpen: $isSearchOpen)';
}


}

/// @nodoc
abstract mixin class _$PostListStateCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory _$PostListStateCopyWith(_PostListState value, $Res Function(_PostListState) _then) = __$PostListStateCopyWithImpl;
@override @useResult
$Res call({
 String currentProfileId, List<PostEntity> posts, bool hasMore, bool isSearchOpen
});




}
/// @nodoc
class __$PostListStateCopyWithImpl<$Res>
    implements _$PostListStateCopyWith<$Res> {
  __$PostListStateCopyWithImpl(this._self, this._then);

  final _PostListState _self;
  final $Res Function(_PostListState) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentProfileId = null,Object? posts = null,Object? hasMore = null,Object? isSearchOpen = null,}) {
  return _then(_PostListState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isSearchOpen: null == isSearchOpen ? _self.isSearchOpen : isSearchOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
