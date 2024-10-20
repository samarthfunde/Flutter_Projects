class SrcModel {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  SrcModel({
    required this.landscape,
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.tiny,
    required this.large2x,
  });

  factory SrcModel.fromJson(Map<String, dynamic> json) {
    return SrcModel(
      landscape: json['landscape'],
      original: json['original'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      tiny: json['tiny'],
      large2x: json['large2x'],
    );
  }
}

class PhotoModel {
  num? id;
  num? width;
  num? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  num? photographerId;
  String? avgColor;
  SrcModel? src;
  bool? liked;
  String? alt;

  PhotoModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: SrcModel.fromJson(json['src']),
      liked: json['liked'],
      alt: json['alt'],
    );
  }
}

class WallpaperDataModel {
  num? page;
  num? perPage;
  List<PhotoModel>? photos;
  num? totalResults;
  String? nextPage;

  WallpaperDataModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  factory WallpaperDataModel.fromJson(Map<String, dynamic> json) {
    List<PhotoModel> listPhotos = (json['photos'] as List)
        .map((eachMap) => PhotoModel.fromJson(eachMap))
        .toList();

    return WallpaperDataModel(
      page: json['page'],
      perPage: json['per_page'],
      photos: listPhotos,
      totalResults: json['total_results'],
      nextPage: json['next_page'],
    );
  }
}
