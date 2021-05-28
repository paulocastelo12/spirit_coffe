class UserModel {
  int id;
  String name;
  dynamic phone;
  String currentdate;
  String datebirthday;
  String gender;

  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.currentdate,
      this.datebirthday,
      this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    currentdate = json['currentdate'];
    datebirthday = json['datebirthday'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['currentdate'] = this.currentdate;
    data['datebirthday'] = this.datebirthday;
    data['gender'] = this.gender;
    return data;
  }
}
