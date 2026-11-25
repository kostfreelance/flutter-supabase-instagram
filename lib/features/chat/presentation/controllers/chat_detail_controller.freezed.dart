// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_detail_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatDetailState {

 String get currentProfileId; ProfileEntity get profile; List<ChatMessageEntity> get chatMessages; bool get hasMore; bool get isMessageValid;
/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDetailStateCopyWith<ChatDetailState> get copyWith => _$ChatDetailStateCopyWithImpl<ChatDetailState>(this as ChatDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChatDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailState&&(identical(other.currentProfileId, _this.currentProfileId) || other.currentProfileId == _this.currentProfileId)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&const DeepCollectionEquality().equals(other.chatMessages, _this.chatMessages)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isMessageValid, _this.isMessageValid) || other.isMessageValid == _this.isMessageValid));
}


@override
int get hashCode {
  final _this = this as ChatDetailState;
  return Object.hash(runtimeType,_this.currentProfileId,_this.profile,const DeepCollectionEquality().hash(_this.chatMessages),_this.hasMore,_this.isMessageValid);
}

@override
String toString() {
  final _this = this as ChatDetailState;
  return 'ChatDetailState(currentProfileId: ${_this.currentProfileId}, profile: ${_this.profile}, chatMessages: ${_this.chatMessages}, hasMore: ${_this.hasMore}, isMessageValid: ${_this.isMessageValid})';
}


}

/// @nodoc
abstract mixin class $ChatDetailStateCopyWith<$Res>  {
  factory $ChatDetailStateCopyWith(ChatDetailState value, $Res Function(ChatDetailState) _then) = _$ChatDetailStateCopyWithImpl;
@useResult
$Res call({
 String currentProfileId, ProfileEntity profile, List<ChatMessageEntity> chatMessages, bool hasMore, bool isMessageValid
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$ChatDetailStateCopyWithImpl<$Res>
    implements $ChatDetailStateCopyWith<$Res> {
  _$ChatDetailStateCopyWithImpl(this._self, this._then);

  final ChatDetailState _self;
  final $Res Function(ChatDetailState) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentProfileId = null,Object? profile = null,Object? chatMessages = null,Object? hasMore = null,Object? isMessageValid = null,}) {
  return _then(ChatDetailState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,chatMessages: null == chatMessages ? _self.chatMessages : chatMessages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isMessageValid: null == isMessageValid ? _self.isMessageValid : isMessageValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatDetailState].
extension ChatDetailStatePatterns on ChatDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ChatDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentProfileId,  ProfileEntity profile,  List<ChatMessageEntity> chatMessages,  bool hasMore,  bool isMessageValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatDetailState() when $default != null:
return $default(_that.currentProfileId,_that.profile,_that.chatMessages,_that.hasMore,_that.isMessageValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentProfileId,  ProfileEntity profile,  List<ChatMessageEntity> chatMessages,  bool hasMore,  bool isMessageValid)  $default,) {final _that = this;
switch (_that) {
case _ChatDetailState():
return $default(_that.currentProfileId,_that.profile,_that.chatMessages,_that.hasMore,_that.isMessageValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentProfileId,  ProfileEntity profile,  List<ChatMessageEntity> chatMessages,  bool hasMore,  bool isMessageValid)?  $default,) {final _that = this;
switch (_that) {
case _ChatDetailState() when $default != null:
return $default(_that.currentProfileId,_that.profile,_that.chatMessages,_that.hasMore,_that.isMessageValid);case _:
  return null;

}
}

}

/// @nodoc


class _ChatDetailState implements ChatDetailState {
  const _ChatDetailState({required this.currentProfileId, required this.profile, required  List<ChatMessageEntity> chatMessages, required this.hasMore, this.isMessageValid = false}): _chatMessages = chatMessages;
  

@override final  String currentProfileId;
@override final  ProfileEntity profile;
 final  List<ChatMessageEntity> _chatMessages;
@override List<ChatMessageEntity> get chatMessages {
  if (_chatMessages is EqualUnmodifiableListView) return _chatMessages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chatMessages);
}

@override final  bool hasMore;
@override@JsonKey() final  bool isMessageValid;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDetailStateCopyWith<_ChatDetailState> get copyWith => __$ChatDetailStateCopyWithImpl<_ChatDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDetailState&&(identical(other.currentProfileId, currentProfileId) || other.currentProfileId == currentProfileId)&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other.chatMessages, _chatMessages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isMessageValid, isMessageValid) || other.isMessageValid == isMessageValid));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentProfileId,profile,const DeepCollectionEquality().hash(_chatMessages),hasMore,isMessageValid);
}

@override
String toString() {
    return 'ChatDetailState(currentProfileId: $currentProfileId, profile: $profile, chatMessages: $chatMessages, hasMore: $hasMore, isMessageValid: $isMessageValid)';
}


}

/// @nodoc
abstract mixin class _$ChatDetailStateCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory _$ChatDetailStateCopyWith(_ChatDetailState value, $Res Function(_ChatDetailState) _then) = __$ChatDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String currentProfileId, ProfileEntity profile, List<ChatMessageEntity> chatMessages, bool hasMore, bool isMessageValid
});


@override $ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class __$ChatDetailStateCopyWithImpl<$Res>
    implements _$ChatDetailStateCopyWith<$Res> {
  __$ChatDetailStateCopyWithImpl(this._self, this._then);

  final _ChatDetailState _self;
  final $Res Function(_ChatDetailState) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentProfileId = null,Object? profile = null,Object? chatMessages = null,Object? hasMore = null,Object? isMessageValid = null,}) {
  return _then(_ChatDetailState(
currentProfileId: null == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,chatMessages: null == chatMessages ? _self._chatMessages : chatMessages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isMessageValid: null == isMessageValid ? _self.isMessageValid : isMessageValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChatDetailState
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
