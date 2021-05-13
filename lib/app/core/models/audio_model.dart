class AudioModel {
  int id;
  String date;
  String description;
  String autor;
  String path;

  AudioModel({this.id, this.date, this.description, this.autor, this.path});

  AudioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    description = json['description'];
    autor = json['autor'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['description'] = this.description;
    data['autor'] = this.autor;
    data['path'] = this.path;
    return data;
  }
}
