import 'package:get_it/get_it.dart';
import 'package:moviz/models/app_config.dart';

class Movie {
  var name;
  var language;
  var isAdult;
  var description;
  var posterPath;
  var backcropPath;
  var rating;
  var releaseDate;

  Movie(
      {this.name,
      this.backcropPath,
      this.description,
      this.isAdult,
      this.language,
      this.posterPath,
      this.rating,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backcropPath: _json['backcrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }

  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${"https://image.tmdb.org/t/p/original"}${this.posterPath}';
  }
}
