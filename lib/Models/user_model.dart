class User {
  int? id;
  String? name;
  String? email;
  String? password;
  int? avatarId;
  double? balance;
  double? totalGain;
  double? totalVideoEditetTime;
  String? createDate;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.avatarId,
      this.balance,
      this.totalGain,
      this.totalVideoEditetTime,
      this.createDate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    avatarId = json['avatarId'];
    balance = double.parse(json['balance'].toString());
    totalGain = double.parse(json['totalGain'].toString());
    totalVideoEditetTime = double.parse(json['totalVideoEditetTime'].toString());
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['avatarId'] = avatarId;
    data['balance'] = balance;
    data['totalGain'] = totalGain;
    data['totalVideoEditetTime'] = totalVideoEditetTime;
    data['createDate'] = createDate;
    return data;
  }
}
