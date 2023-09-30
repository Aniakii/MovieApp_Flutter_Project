// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingDataState {
  LoadingDataStatus get status => throw _privateConstructorUsedError;
  List<Movie> get allMovies => throw _privateConstructorUsedError;
  List<Genre> get allGenres => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadingDataStateCopyWith<LoadingDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingDataStateCopyWith<$Res> {
  factory $LoadingDataStateCopyWith(
          LoadingDataState value, $Res Function(LoadingDataState) then) =
      _$LoadingDataStateCopyWithImpl<$Res, LoadingDataState>;
  @useResult
  $Res call(
      {LoadingDataStatus status, List<Movie> allMovies, List<Genre> allGenres});
}

/// @nodoc
class _$LoadingDataStateCopyWithImpl<$Res, $Val extends LoadingDataState>
    implements $LoadingDataStateCopyWith<$Res> {
  _$LoadingDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allMovies = null,
    Object? allGenres = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingDataStatus,
      allMovies: null == allMovies
          ? _value.allMovies
          : allMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      allGenres: null == allGenres
          ? _value.allGenres
          : allGenres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingDataStateImplCopyWith<$Res>
    implements $LoadingDataStateCopyWith<$Res> {
  factory _$$LoadingDataStateImplCopyWith(_$LoadingDataStateImpl value,
          $Res Function(_$LoadingDataStateImpl) then) =
      __$$LoadingDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingDataStatus status, List<Movie> allMovies, List<Genre> allGenres});
}

/// @nodoc
class __$$LoadingDataStateImplCopyWithImpl<$Res>
    extends _$LoadingDataStateCopyWithImpl<$Res, _$LoadingDataStateImpl>
    implements _$$LoadingDataStateImplCopyWith<$Res> {
  __$$LoadingDataStateImplCopyWithImpl(_$LoadingDataStateImpl _value,
      $Res Function(_$LoadingDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allMovies = null,
    Object? allGenres = null,
  }) {
    return _then(_$LoadingDataStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingDataStatus,
      allMovies: null == allMovies
          ? _value._allMovies
          : allMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      allGenres: null == allGenres
          ? _value._allGenres
          : allGenres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc

class _$LoadingDataStateImpl implements _LoadingDataState {
  const _$LoadingDataStateImpl(
      {required this.status,
      required final List<Movie> allMovies,
      required final List<Genre> allGenres})
      : _allMovies = allMovies,
        _allGenres = allGenres;

  @override
  final LoadingDataStatus status;
  final List<Movie> _allMovies;
  @override
  List<Movie> get allMovies {
    if (_allMovies is EqualUnmodifiableListView) return _allMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allMovies);
  }

  final List<Genre> _allGenres;
  @override
  List<Genre> get allGenres {
    if (_allGenres is EqualUnmodifiableListView) return _allGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allGenres);
  }

  @override
  String toString() {
    return 'LoadingDataState(status: $status, allMovies: $allMovies, allGenres: $allGenres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingDataStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._allMovies, _allMovies) &&
            const DeepCollectionEquality()
                .equals(other._allGenres, _allGenres));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_allMovies),
      const DeepCollectionEquality().hash(_allGenres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingDataStateImplCopyWith<_$LoadingDataStateImpl> get copyWith =>
      __$$LoadingDataStateImplCopyWithImpl<_$LoadingDataStateImpl>(
          this, _$identity);
}

abstract class _LoadingDataState implements LoadingDataState {
  const factory _LoadingDataState(
      {required final LoadingDataStatus status,
      required final List<Movie> allMovies,
      required final List<Genre> allGenres}) = _$LoadingDataStateImpl;

  @override
  LoadingDataStatus get status;
  @override
  List<Movie> get allMovies;
  @override
  List<Genre> get allGenres;
  @override
  @JsonKey(ignore: true)
  _$$LoadingDataStateImplCopyWith<_$LoadingDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
