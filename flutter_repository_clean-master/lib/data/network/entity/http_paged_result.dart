import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';
import '../../domain/movie.dart';

part 'http_paged_result.g.dart';

@JsonSerializable()
class HttpPagedResult {
  int first;
  dynamic prev;
  int next;
  int last;
  int pages;
  int items;
  List<Movie> data;

  HttpPagedResult({
    required this.first,
    required this.prev,
    required this.next,
    required this.last,
    required this.pages,
    required this.items,
    required this.data,
  });

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) => _$HttpPagedResultFromJson(json);
}

@JsonSerializable()
@Entity(tableName: 'movies')
class Movie {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final int year;
  final List<String> cast;
  final List<String> genres;
  final String? href;
  final String? extract;
  final String? thumbnail;
  final int? thumbnailWidth;
  final int? thumbnailHeight;

  Movie({
    this.id,
    required this.title,
    required this.year,
    required this.cast,
    required this.genres,
    this.href,
    this.extract,
    this.thumbnail,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return 'Movie{title: $title, year: $year}';
  }
}