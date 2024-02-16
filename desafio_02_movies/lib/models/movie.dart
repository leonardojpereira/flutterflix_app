class Movie {
  int id;
  String title;
  String backDropPath;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAvarage;

  Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAvarage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      backDropPath: json['backdrop_path'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAvarage: json['vote_average'].toDouble(),
    );
  }
}