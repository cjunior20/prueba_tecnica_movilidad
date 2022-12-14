class CatBreedModel {
  String? idBreed;
  String? nameBreed;
  String? temperamentBreed;
  String? originBreed;
  String? countryCodeBreed;
  String? descriptionBreed;
  String? lifeSpanBreed;
  String? altsNamesBreed;
  String? referenceImgBreed;
  String? weightImperialBreed;
  String? weightMetricBreed;
  String? urlImageBreed;
  int? heightImageBreed;
  int? widthImageBreed;

  CatBreedModel({
    this.idBreed,
    this.nameBreed,
    this.temperamentBreed,
    this.originBreed,
    this.countryCodeBreed,
    this.descriptionBreed,
    this.lifeSpanBreed,
    this.altsNamesBreed,
    this.referenceImgBreed,
    this.weightImperialBreed,
    this.weightMetricBreed,
    this.urlImageBreed,
    this.heightImageBreed,
    this.widthImageBreed,
  });

  Map<String, dynamic> toJson() => {
        'idBreed': idBreed,
        'nameBreed': nameBreed,
        'temperamentBreed': temperamentBreed,
        'originBreed': originBreed,
        'countryCodeBreed': countryCodeBreed,
        'altsNamesBreed': altsNamesBreed,
        'referenceImgBreed': referenceImgBreed,
        'lifeSpanBreed': lifeSpanBreed,
        'descriptionBreed': descriptionBreed,
        'heightImageBreed': heightImageBreed,
        'widthImageBreed': widthImageBreed,
        'urlImageBreed': urlImageBreed,
        'weightImperialBreed': weightImperialBreed,
        'weightMetricBreed': weightMetricBreed,
      };

  factory CatBreedModel.fromJson(Map<String, dynamic> json) => CatBreedModel(
        idBreed: json["id"],
        nameBreed: json["name"],
        temperamentBreed: json["temperament"],
        originBreed: json["origin"],
        countryCodeBreed: json["country_codes"],
        altsNamesBreed: json["alt_names"],
        referenceImgBreed: json["reference_image_id"],
        lifeSpanBreed: json["life_span"],
        descriptionBreed: json["description"],
        heightImageBreed: json["image"]["height"] ?? '',
        widthImageBreed: json["image"]["width"] ?? '',
        urlImageBreed: json["image"]["url"] ?? '',
        weightImperialBreed: json["weight"]["imperial"] ?? '',
        weightMetricBreed: json["weight"]["metric"] ?? '',
      );
}
