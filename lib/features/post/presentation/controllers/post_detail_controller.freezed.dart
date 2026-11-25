// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDetailState {

 String get currentProfileId; PostEntity get post; List<CommentEntity> get comments;
/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDetailStateCopyWith<PostDetailState> get copyWith => _$PostDetailStateCopyWithImpl<PostDetailState>(this as PostDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PostDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailState&&(identical(other.currentProfileId, _this.currentProfileId) || other.currentProfileId == _this.currentProfileId)&&(identical(other.post, _this.post) || other.post == _this.post)&&const DeepCollectionEquality().equals(other.comments, _this.comments));
}


@override
int get hashCode {
  final _this = this as PostDetailState;
  return Object.hash(runtimeType,_this.currentProfileId,_this.post,const DeepCollectionEquality().hash(_this.comments));
}

@override
String toString() {
  final _this = this as PostDetailState;
  return 'PostDetailState(currentProfileId: ${_this.currentProfileId}, post: ${_this.post}, comments: ${_this.comments})';
}


}

/// @nodoc
abstract mixin class $PostDetailStateCopyWith<$Res>  {
  factory $PostDetailStateCopyWith(PostDetailState value, $Res Function(PostDetailState) _then) = _$PostDetailStateCopyWithImpl;
@useResult
$Res call({
 String currentProfileId, PostEntity post, List<CommentEntity> comments
});


$PostEntityCopyWith<$Res> get post;

}
/// @nodoc
class _$PostDetailStateCopyWithImpl<$Res>
    implements $PostDetailStateCopyWith<$Res> {
  _$PostDetailStateCopyWithImpl(this._self, this._then);

  final PostDetailState _self;
  final $Res Function(PostDetailState) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentProfileId = null,Object? post = null,Object? comments = null,}) {
  return _then(PostDetailState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostEntity,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,
  ));
}
/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostEntityCopyWith<$Res> get post {
  
  return $PostEntityCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostDetailState].
extension PostDetailStatePatterns on PostDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PostDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PostDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentProfileId,  PostEntity post,  List<CommentEntity> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDetailState() when $default != null:
return $default(_that.currentProfileId,_that.post,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentProfileId,  PostEntity post,  List<CommentEntity> comments)  $default,) {final _that = this;
switch (_that) {
case _PostDetailState():
return $default(_that.currentProfileId,_that.post,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentProfileId,  PostEntity post,  List<CommentEntity> comments)?  $default,) {final _that = this;
switch (_that) {
case _PostDetailState() when $default != null:
return $default(_that.currentProfileId,_that.post,_that.comments);case _:
  return null;

}
}

}

/// @nodoc


class _PostDetailState implements PostDetailState {
  const _PostDetailState({required this.currentProfileId, required this.post, required  List<CommentEntity> comments}): _comments = comments;
  

@override final  String currentProfileId;
@override final  PostEntity post;
 final  List<CommentEntity> _comments;
@override List<CommentEntity> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDetailStateCopyWith<_PostDetailState> get copyWith => __$PostDetailStateCopyWithImpl<_PostDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailState&&(identical(other.currentProfileId, currentProfileId) || other.currentProfileId == currentProfileId)&&(identical(other.post, post) || other.post == post)&&const DeepCollectionEquality().equals(other.comments, _comments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentProfileId,post,const DeepCollectionEquality().hash(_comments));
}

@override
String toString() {
    return 'PostDetailState(currentProfileId: $currentProfileId, post: $post, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$PostDetailStateCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory _$PostDetailStateCopyWith(_PostDetailState value, $Res Function(_PostDetailState) _then) = __$PostDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String currentProfileId, PostEntity post, List<CommentEntity> comments
});


@override $PostEntityCopyWith<$Res> get post;

}
/// @nodoc
class __$PostDetailStateCopyWithImpl<$Res>
    implements _$PostDetailStateCopyWith<$Res> {
  __$PostDetailStateCopyWithImpl(this._self, this._then);

  final _PostDetailState _self;
  final $Res Function(_PostDetailState) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentProfileId = null,Object? post = null,Object? comments = null,}) {
  return _then(_PostDetailState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostEntity,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,
  ));
}

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostEntityCopyWith<$Res> get post {
  
  return $PostEntityCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
