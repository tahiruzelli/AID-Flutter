class AvatarModel {
  int? id;
  String? avatarUrl;
  String? createTime;

  AvatarModel({this.id, this.avatarUrl, this.createTime});

  AvatarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatarUrl = json['avatarUrl'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['avatarUrl'] = avatarUrl;
    data['createTime'] = createTime;
    return data;
  }
}
