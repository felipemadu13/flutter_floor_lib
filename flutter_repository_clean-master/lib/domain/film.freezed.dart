// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'film.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Film {
  String get title => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String? get extract => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilmCopyWith<Film> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmCopyWith<$Res> {
  factory $FilmCopyWith(Film value, $Res Function(Film) then) =
      _$FilmCopyWithImpl<$Res, Film>;
  @useResult
  $Res call({String title, int year, String? extract, String? imgUrl});
}

/// @nodoc
class _$FilmCopyWithImpl<$Res, $Val extends Film>
    implements $FilmCopyWith<$Res> {
  _$FilmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? extract = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      extract: freezed == extract
          ? _value.extract
          : extract // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilmImplCopyWith<$Res> implements $FilmCopyWith<$Res> {
  factory _$$FilmImplCopyWith(
          _$FilmImpl value, $Res Function(_$FilmImpl) then) =
      __$$FilmImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int year, String? extract, String? imgUrl});
}

/// @nodoc
class __$$FilmImplCopyWithImpl<$Res>
    extends _$FilmCopyWithImpl<$Res, _$FilmImpl>
    implements _$$FilmImplCopyWith<$Res> {
  __$$FilmImplCopyWithImpl(_$FilmImpl _value, $Res Function(_$FilmImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? extract = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_$FilmImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      extract: freezed == extract
          ? _value.extract
          : extract // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilmImpl implements _Film {
  const _$FilmImpl(
      {required this.title, required this.year, this.extract, this.imgUrl});

  @override
  final String title;
  @override
  final int year;
  @override
  final String? extract;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'Film(title: $title, year: $year, extract: $extract, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilmImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.extract, extract) || other.extract == extract) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, year, extract, imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilmImplCopyWith<_$FilmImpl> get copyWith =>
      __$$FilmImplCopyWithImpl<_$FilmImpl>(this, _$identity);
}

abstract class _Film implements Film {
  const factory _Film(
      {required final String title,
      required final int year,
      final String? extract,
      final String? imgUrl}) = _$FilmImpl;

  @override
  String get title;
  @override
  int get year;
  @override
  String? get extract;
  @override
  String? get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$FilmImplCopyWith<_$FilmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
