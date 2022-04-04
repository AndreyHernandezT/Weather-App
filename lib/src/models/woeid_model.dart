class Woeid {
  final String name;
  final String woeid;

  Woeid(
    this.name,
    this.woeid
  );

    factory Woeid.fromJson(Map<String, dynamic> json){
    return Woeid(
      json["title"],
      json["woeid"],
    );
  }
}

