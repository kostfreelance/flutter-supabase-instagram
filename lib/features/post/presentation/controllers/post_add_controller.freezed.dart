// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_add_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostAddState {

 bool get isValid;
/// Create a copy of PostAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostAddStateCopyWith<PostAddState> get copyWith => _$PostAddStateCopyWithImpl<PostAddState>(this as PostAddState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PostAddState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostAddState&&(identical(other.isValid, _this.isValid) || other.isValid == _this.isValid));
}


@override
int get hashCode {
  final _this = this as PostAddState;
  return Object.hash(runtimeType,_this.isValid);
}

@override
String toString() {
  final _this = this as PostAddState;
  return 'PostAddState(isValid: ${_this.isValid})';
}


}

/// @nodoc
abstract mixin class $PostAddStateCopyWith<$Res>  {
  factory $PostAddStateCopyWith(PostAddState value, $Res Function(PostAddState) _then) = _$PostAddStateCopyWithImpl;
@useResult
$Res call({
 bool isValid
});




}
/// @nodoc
class _$PostAddStateCopyWithImpl<$Res>
    implements $PostAddStateCopyWith<$Res> {
  _$PostAddStateCopyWithImpl(this._self, this._then);

  final PostAddState _self;
  final $Res Function(PostAddState) _then;

/// Create a copy of PostAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,}) {
  return _then(PostAddState(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostAddState].
extension PostAddStatePatterns on PostAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostAddState value)  $default,){
final _that = this;
switch (_that) {
case _PostAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostAddState value)?  $default,){
final _that = this;
switch (_that) {
case _PostAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostAddState() when $default != null:
return $default(_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isValid)  $default,) {final _that = this;
switch (_that) {
case _PostAddState():
return $default(_that.isValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _PostAddState() when $default != null:
return $default(_that.isValid);case _:
  return null;

}
}

}

/// @nodoc


class _PostAddState implements PostAddState {
  const _PostAddState({this.isValid = false});
  

@override@JsonKey() final  bool isValid;

/// Create a copy of PostAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostAddStateCopyWith<_PostAddState> get copyWith => __$PostAddStateCopyWithImpl<_PostAddState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostAddState&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isValid);
}

@override
String toString() {
    return 'PostAddState(isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$PostAddStateCopyWith<$Res> implements $PostAddStateCopyWith<$Res> {
  factory _$PostAddStateCopyWith(_PostAddState value, $Res Function(_PostAddState) _then) = __$PostAddStateCopyWithImpl;
@override @useResult
$Res call({
 bool isValid
});




}
/// @nodoc
class __$PostAddStateCopyWithImpl<$Res>
    implements _$PostAddStateCopyWith<$Res> {
  __$PostAddStateCopyWithImpl(this._self, this._then);

  final _PostAddState _self;
  final $Res Function(_PostAddState) _then;

/// Create a copy of PostAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,}) {
  return _then(_PostAddState(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
