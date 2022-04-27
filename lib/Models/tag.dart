class Tag {
  int? id;
  String? name;
  String? createTime;

  Tag({this.id, this.name, this.createTime});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['createTime'] = createTime;
    return data;
  }
}
