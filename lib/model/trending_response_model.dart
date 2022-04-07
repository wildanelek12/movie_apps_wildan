class TrendingResponseModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TrendingResponseModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  TrendingResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  String? backdropPath;
  List<int>? genreIds;
  String? name;
  String? originalLanguage;
  String? posterPath;
  String? originalName;
  int? id;
  String? firstAirDate;
  String? overview;
  int? voteCount;
  double? voteAverage;
  double? popularity;
  String? mediaType;
  bool? video;
  String? releaseDate;
  bool? adult;
  String? title;
  String? originalTitle;

  Results(
      {this.backdropPath,
      this.genreIds,
      this.name,
      this.originalLanguage,
      this.posterPath,
      this.originalName,
      this.id,
      this.firstAirDate,
      this.overview,
      this.voteCount,
      this.voteAverage,
      this.popularity,
      this.mediaType,
      this.video,
      this.releaseDate,
      this.adult,
      this.title,
      this.originalTitle});

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    name = json['name'];
    originalLanguage = json['original_language'];
    posterPath = json['poster_path'];
    originalName = json['original_name'];
    id = json['id'];
    firstAirDate = json['first_air_date'];
    overview = json['overview'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];

    popularity = json['popularity'];
    mediaType = json['media_type'];
    video = json['video'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    title = json['title'];
    originalTitle = json['original_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['name'] = this.name;
    data['original_language'] = this.originalLanguage;
    data['poster_path'] = this.posterPath;
    data['original_name'] = this.originalName;
    data['id'] = this.id;
    data['first_air_date'] = this.firstAirDate;
    data['overview'] = this.overview;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['video'] = this.video;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['title'] = this.title;
    data['original_title'] = this.originalTitle;
    return data;
  }
}
