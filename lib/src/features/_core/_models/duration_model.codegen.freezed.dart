// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duration_model.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DurationModel _$DurationModelFromJson(Map<String, dynamic> json) {
  return _DurationModel.fromJson(json);
}

/// @nodoc
mixin _$DurationModel {
  double get seconds => throw _privateConstructorUsedError;

  /// Serializes this DurationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DurationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DurationModelCopyWith<DurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationModelCopyWith<$Res> {
  factory $DurationModelCopyWith(
          DurationModel value, $Res Function(DurationModel) then) =
      _$DurationModelCopyWithImpl<$Res, DurationModel>;
  @useResult
  $Res call({double seconds});
}

/// @nodoc
class _$DurationModelCopyWithImpl<$Res, $Val extends DurationModel>
    implements $DurationModelCopyWith<$Res> {
  _$DurationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DurationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_value.copyWith(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DurationModelImplCopyWith<$Res>
    implements $DurationModelCopyWith<$Res> {
  factory _$$DurationModelImplCopyWith(
          _$DurationModelImpl value, $Res Function(_$DurationModelImpl) then) =
      __$$DurationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double seconds});
}

/// @nodoc
class __$$DurationModelImplCopyWithImpl<$Res>
    extends _$DurationModelCopyWithImpl<$Res, _$DurationModelImpl>
    implements _$$DurationModelImplCopyWith<$Res> {
  __$$DurationModelImplCopyWithImpl(
      _$DurationModelImpl _value, $Res Function(_$DurationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DurationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
  }) {
    return _then(_$DurationModelImpl(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DurationModelImpl implements _DurationModel {
  const _$DurationModelImpl({required this.seconds});

  factory _$DurationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationModelImplFromJson(json);

  @override
  final double seconds;

  @override
  String toString() {
    return 'DurationModel(seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationModelImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  /// Create a copy of DurationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationModelImplCopyWith<_$DurationModelImpl> get copyWith =>
      __$$DurationModelImplCopyWithImpl<_$DurationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationModelImplToJson(
      this,
    );
  }
}

abstract class _DurationModel implements DurationModel {
  const factory _DurationModel({required final double seconds}) =
      _$DurationModelImpl;

  factory _DurationModel.fromJson(Map<String, dynamic> json) =
      _$DurationModelImpl.fromJson;

  @override
  double get seconds;

  /// Create a copy of DurationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DurationModelImplCopyWith<_$DurationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
