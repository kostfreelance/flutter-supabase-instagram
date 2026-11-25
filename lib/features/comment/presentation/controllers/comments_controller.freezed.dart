// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentsState {

 List<CommentEntity> get comments; bool get hasMore; bool get isCommentValid;
/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsStateCopyWith<CommentsState> get copyWith => _$CommentsStateCopyWithImpl<CommentsState>(this as CommentsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CommentsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsState&&const DeepCollectionEquality().equals(other.comments, _this.comments)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isCommentValid, _this.isCommentValid) || other.isCommentValid == _this.isCommentValid));
}


@override
int get hashCode {
  final _this = this as CommentsState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.comments),_this.hasMore,_this.isCommentValid);
}

@override
String toString() {
  final _this = this as CommentsState;
  return 'CommentsState(comments: ${_this.comments}, hasMore: ${_this.hasMore}, isCommentValid: ${_this.isCommentValid})';
}


}

/// @nodoc
abstract mixin class $CommentsStateCopyWith<$Res>  {
  factory $CommentsStateCopyWith(CommentsState value, $Res Function(CommentsState) _then) = _$CommentsStateCopyWithImpl;
@useResult
$Res call({
 List<CommentEntity> comments, bool hasMore, bool isCommentValid
});




}
/// @nodoc
class _$CommentsStateCopyWithImpl<$Res>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._self, this._then);

  final CommentsState _self;
  final $Res Function(CommentsState) _then;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comments = null,Object? hasMore = null,Object? isCommentValid = null,}) {
  return _then(CommentsState(
comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCommentValid: null == isCommentValid ? _self.isCommentValid : isCommentValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentsState].
extension CommentsStatePatterns on CommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentsState value)  $default,){
final _that = this;
switch (_that) {
case _CommentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentsState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CommentEntity> comments,  bool hasMore,  bool isCommentValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
return $default(_that.comments,_that.hasMore,_that.isCommentValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CommentEntity> comments,  bool hasMore,  bool isCommentValid)  $default,) {final _that = this;
switch (_that) {
case _CommentsState():
return $default(_that.comments,_that.hasMore,_that.isCommentValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CommentEntity> comments,  bool hasMore,  bool isCommentValid)?  $default,) {final _that = this;
switch (_that) {
case _CommentsState() when $default != null:
return $default(_that.comments,_that.hasMore,_that.isCommentValid);case _:
  return null;

}
}

}

/// @nodoc


class _CommentsState implements CommentsState {
  const _CommentsState({required  List<CommentEntity> comments, required this.hasMore, this.isCommentValid = false}): _comments = comments;
  

 final  List<CommentEntity> _comments;
@override List<CommentEntity> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  bool hasMore;
@override@JsonKey() final  bool isCommentValid;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsStateCopyWith<_CommentsState> get copyWith => __$CommentsStateCopyWithImpl<_CommentsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentsState&&const DeepCollectionEquality().equals(other.comments, _comments)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isCommentValid, isCommentValid) || other.isCommentValid == isCommentValid));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments),hasMore,isCommentValid);
}

@override
String toString() {
    return 'CommentsState(comments: $comments, hasMore: $hasMore, isCommentValid: $isCommentValid)';
}


}

/// @nodoc
abstract mixin class _$CommentsStateCopyWith<$Res> implements $CommentsStateCopyWith<$Res> {
  factory _$CommentsStateCopyWith(_CommentsState value, $Res Function(_CommentsState) _then) = __$CommentsStateCopyWithImpl;
@override @useResult
$Res call({
 List<CommentEntity> comments, bool hasMore, bool isCommentValid
});




}
/// @nodoc
class __$CommentsStateCopyWithImpl<$Res>
    implements _$CommentsStateCopyWith<$Res> {
  __$CommentsStateCopyWithImpl(this._self, this._then);

  final _CommentsState _self;
  final $Res Function(_CommentsState) _then;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comments = null,Object? hasMore = null,Object? isCommentValid = null,}) {
  return _then(_CommentsState(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCommentValid: null == isCommentValid ? _self.isCommentValid : isCommentValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
