import 'package:flutter/foundation.dart';
import 'package:movie_recommendation/features/movie_flow/genre/genre.dart';

import 'movie_entity.dart';

const _baseImageUrl = 'https://image.tmdb.org/t/p/original/';

@immutable
class Movie {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? posterPath;
  final String? backdropPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.posterPath,
    this.backdropPath,
  });

  factory Movie.fromEntity(MovieEntity entity, List<Genre> genres) {
    return Movie(
      title: entity.title,
      overview: entity.overview,
      voteAverage: entity.voteAverage,
      genres: genres.where((genre) => entity.genreIds.contains(genre.id)).toList(growable: false),
      releaseDate: entity.releaseDate,
      posterPath: entity.posterPath ?? _baseImageUrl + entity.posterPath! ,
      backdropPath: entity.backdropPath ?? _baseImageUrl + entity.backdropPath!,
    );
  }

  Movie.initial()
      : title = '',
        overview = '',
        voteAverage = 0,
        genres = [],
        releaseDate = '',
        posterPath = '',
        backdropPath = '';

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(', ');

  @override
  String toString() {
    return 'Movie(title: $title, overview: $overview, voteAverage: $voteAverage, genres: $genres, releaseDate: $releaseDate, posterPath: $posterPath, backdropPath: $backdropPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.title == title &&
        other.overview == overview &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        voteAverage.hashCode ^
        genres.hashCode ^
        releaseDate.hashCode;
  }
}
