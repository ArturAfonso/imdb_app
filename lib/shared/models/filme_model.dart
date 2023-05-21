class FilmModelStarList {
  String? id;
  String? name;

  FilmModelStarList({
    this.id,
    this.name,
  });
  FilmModelStarList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class FilmModelGenreList {
  String? key;
  String? value;

  FilmModelGenreList({
    this.key,
    this.value,
  });
  FilmModelGenreList.fromJson(Map<String, dynamic> json) {
    key = json['key']?.toString();
    value = json['value']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class FilmModel {
  String? id;
  String? image;
  String? title;
  String? description;
  String? runtimeStr;
  String? genres;
  List<FilmModelGenreList?>? genreList;
  String? plot;
  String? stars;
  List<FilmModelStarList?>? starList;

  FilmModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.runtimeStr,
    this.genres,
    this.genreList,
    this.plot,
    this.stars,
    this.starList,
  });
  FilmModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    image = json['image']?.toString();
    title = json['title']?.toString();
    description = json['description']?.toString();
    runtimeStr = json['runtimeStr']?.toString();
    genres = json['genres']?.toString();
    if (json['genreList'] != null) {
      final v = json['genreList'];
      final arr0 = <FilmModelGenreList>[];
      v.forEach((v) {
        arr0.add(FilmModelGenreList.fromJson(v));
      });
      genreList = arr0;
    }
    plot = json['plot']?.toString();
    stars = json['stars']?.toString();
    if (json['starList'] != null) {
      final v = json['starList'];
      final arr0 = <FilmModelStarList>[];
      v.forEach((v) {
        arr0.add(FilmModelStarList.fromJson(v));
      });
      starList = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['runtimeStr'] = runtimeStr;
    data['genres'] = genres;
    if (genreList != null) {
      final v = genreList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['genreList'] = arr0;
    }
    data['plot'] = plot;
    data['stars'] = stars;
    if (starList != null) {
      final v = starList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['starList'] = arr0;
    }
    return data;
  }
}
