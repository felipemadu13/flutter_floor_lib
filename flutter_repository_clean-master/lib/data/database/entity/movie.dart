import 'package:floor/floor.dart';

@Entity(tableName: 'movies')
class Movie {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final int year;
  final String? imgUrl;
  final String? extract;

  Movie({this.id, required this.title, required this.year, this.imgUrl, this.extract});
}
