// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditState {

 String? get avatarUrl; String? get avatarFilePath; bool get isValid;
/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEditStateCopyWith<ProfileEditState> get copyWith => _$ProfileEditStateCopyWithImpl<ProfileEditState>(this as ProfileEditState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfileEditState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditState&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.avatarFilePath, _this.avatarFilePath) || other.avatarFilePath == _this.avatarFilePath)&&(identical(other.isValid, _this.isValid) || other.isValid == _this.isValid));
}


@override
int get hashCode {
  final _this = this as ProfileEditState;
  return Object.hash(runtimeType,_this.avatarUrl,_this.avatarFilePath,_this.isValid);
}

@override
String toString() {
  final _this = this as ProfileEditState;
  return 'ProfileEditState(avatarUrl: ${_this.avatarUrl}, avatarFilePath: ${_this.avatarFilePath}, isValid: ${_this.isValid})';
}


}

/// @nodoc
abstract mixin class $ProfileEditStateCopyWith<$Res>  {
  factory $ProfileEditStateCopyWith(ProfileEditState value, $Res Function(ProfileEditState) _then) = _$ProfileEditStateCopyWithImpl;
@useResult
$Res call({
 String? avatarUrl, String? avatarFilePath, bool isValid
});




}
/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._self, this._then);

  final ProfileEditState _self;
  final $Res Function(ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarUrl = freezed,Object? avatarFilePath = freezed,Object? isValid = null,}) {
  return _then(ProfileEditState(
avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarFilePath: freezed == avatarFilePath ? _self.avatarFilePath : avatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEditState].
extension ProfileEditStatePatterns on ProfileEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEditState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEditState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? avatarUrl,  String? avatarFilePath,  bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
return $default(_that.avatarUrl,_that.avatarFilePath,_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? avatarUrl,  String? avatarFilePath,  bool isValid)  $default,) {final _that = this;
switch (_that) {
case _ProfileEditState():
return $default(_that.avatarUrl,_that.avatarFilePath,_that.isValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? avatarUrl,  String? avatarFilePath,  bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
return $default(_that.avatarUrl,_that.avatarFilePath,_that.isValid);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEditState implements ProfileEditState {
  const _ProfileEditState({this.avatarUrl, this.avatarFilePath, this.isValid = false});
  

@override final  String? avatarUrl;
@override final  String? avatarFilePath;
@override@JsonKey() final  bool isValid;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEditStateCopyWith<_ProfileEditState> get copyWith => __$ProfileEditStateCopyWithImpl<_ProfileEditState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEditState&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarFilePath, avatarFilePath) || other.avatarFilePath == avatarFilePath)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode {
    return Object.hash(runtimeType,avatarUrl,avatarFilePath,isValid);
}

@override
String toString() {
    return 'ProfileEditState(avatarUrl: $avatarUrl, avatarFilePath: $avatarFilePath, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$ProfileEditStateCopyWith<$Res> implements $ProfileEditStateCopyWith<$Res> {
  factory _$ProfileEditStateCopyWith(_ProfileEditState value, $Res Function(_ProfileEditState) _then) = __$ProfileEditStateCopyWithImpl;
@override @useResult
$Res call({
 String? avatarUrl, String? avatarFilePath, bool isValid
});




}
/// @nodoc
class __$ProfileEditStateCopyWithImpl<$Res>
    implements _$ProfileEditStateCopyWith<$Res> {
  __$ProfileEditStateCopyWithImpl(this._self, this._then);

  final _ProfileEditState _self;
  final $Res Function(_ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarUrl = freezed,Object? avatarFilePath = freezed,Object? isValid = null,}) {
  return _then(_ProfileEditState(
avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarFilePath: freezed == avatarFilePath ? _self.avatarFilePath : avatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
