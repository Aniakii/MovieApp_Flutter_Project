// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllMoviesState {
  List<Movie> get allMovies => throw _privateConstructorUsedError;
  List<Genre> get allGenres => throw _privateConstructorUsedError;
  Genre? get selectedGenre => throw _privateConstructorUsedError;
  List<Movie> get filteredMovies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllMoviesStateCopyWith<AllMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllMoviesStateCopyWith<$Res> {
  factory $AllMoviesStateCopyWith(
          AllMoviesState value, $Res Function(AllMoviesState) then) =
      _$AllMoviesStateCopyWithImpl<$Res, AllMoviesState>;
  @useResult
  $Res call(
      {List<Movie> allMovies,
      List<Genre> allGenres,
      Genre? selectedGenre,
      List<Movie> filteredMovies});
}

/// @nodoc
class _$AllMoviesStateCopyWithImpl<$Res, $Val extends AllMoviesState>
    implements $AllMoviesStateCopyWith<$Res> {
  _$AllMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allMovies = null,
    Object? allGenres = null,
    Object? selectedGenre = freezed,
    Object? filteredMovies = null,
  }) {
    return _then(_value.copyWith(
      allMovies: null == allMovies
          ? _value.allMovies
          : allMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      allGenres: null == allGenres
          ? _value.allGenres
          : allGenres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      selectedGenre: freezed == selectedGenre
          ? _value.selectedGenre
          : selectedGenre // ignore: cast_nullable_to_non_nullable
              as Genre?,
      filteredMovies: null == filteredMovies
          ? _value.filteredMovies
          : filteredMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllMoviesStateImplCopyWith<$Res>
    implements $AllMoviesStateCopyWith<$Res> {
  factory _$$AllMoviesStateImplCopyWith(_$AllMoviesStateImpl value,
          $Res Function(_$AllMoviesStateImpl) then) =
      __$$AllMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie> allMovies,
      List<Genre> allGenres,
      Genre? selectedGenre,
      List<Movie> filteredMovies});
}

/// @nodoc
class __$$AllMoviesStateImplCopyWithImpl<$Res>
    extends _$AllMoviesStateCopyWithImpl<$Res, _$AllMoviesStateImpl>
    implements _$$AllMoviesStateImplCopyWith<$Res> {
  __$$AllMoviesStateImplCopyWithImpl(
      _$AllMoviesStateImpl _value, $Res Function(_$AllMoviesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allMovies = null,
    Object? allGenres = null,
    Object? selectedGenre = freezed,
    Object? filteredMovies = null,
  }) {
    return _then(_$AllMoviesStateImpl(
      allMovies: null == allMovies
          ? _value._allMovies
          : allMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      allGenres: null == allGenres
          ? _value._allGenres
          : allGenres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      selectedGenre: freezed == selectedGenre
          ? _value.selectedGenre
          : selectedGenre // ignore: cast_nullable_to_non_nullable
              as Genre?,
      filteredMovies: null == filteredMovies
          ? _value._filteredMovies
          : filteredMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$AllMoviesStateImpl implements _AllMoviesState {
  const _$AllMoviesStateImpl(
      {required final List<Movie> allMovies,
      required final List<Genre> allGenres,
      required this.selectedGenre,
      required final List<Movie> filteredMovies})
      : _allMovies = allMovies,
        _allGenres = allGenres,
        _filteredMovies = filteredMovies;

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
  final Genre? selectedGenre;
  final List<Movie> _filteredMovies;
  @override
  List<Movie> get filteredMovies {
    if (_filteredMovies is EqualUnmodifiableListView) return _filteredMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredMovies);
  }

  @override
  String toString() {
    return 'AllMoviesState(allMovies: $allMovies, allGenres: $allGenres, selectedGenre: $selectedGenre, filteredMovies: $filteredMovies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllMoviesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allMovies, _allMovies) &&
            const DeepCollectionEquality()
                .equals(other._allGenres, _allGenres) &&
            (identical(other.selectedGenre, selectedGenre) ||
                other.selectedGenre == selectedGenre) &&
            const DeepCollectionEquality()
                .equals(other._filteredMovies, _filteredMovies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allMovies),
      const DeepCollectionEquality().hash(_allGenres),
      selectedGenre,
      const DeepCollectionEquality().hash(_filteredMovies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllMoviesStateImplCopyWith<_$AllMoviesStateImpl> get copyWith =>
      __$$AllMoviesStateImplCopyWithImpl<_$AllMoviesStateImpl>(
          this, _$identity);
}

abstract class _AllMoviesState implements AllMoviesState {
  const factory _AllMoviesState(
      {required final List<Movie> allMovies,
      required final List<Genre> allGenres,
      required final Genre? selectedGenre,
      required final List<Movie> filteredMovies}) = _$AllMoviesStateImpl;

  @override
  List<Movie> get allMovies;
  @override
  List<Genre> get allGenres;
  @override
  Genre? get selectedGenre;
  @override
  List<Movie> get filteredMovies;
  @override
  @JsonKey(ignore: true)
  _$$AllMoviesStateImplCopyWith<_$AllMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
