import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';

@freezed
class Film with _$Film {
  const factory Film({
    required String title,
    required int year,
    String? extract,
    String? imgUrl,
  }) = _Film;
}