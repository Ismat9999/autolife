class AutoServiceModel {
  String title = "";
  String subtitle = "";
  String location = "";

  AutoServiceModel(this.title, this.subtitle, this.location);

  AutoServiceModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        location = json['location'];


  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'location': location,
  };
}