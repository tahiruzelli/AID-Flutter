class Announcement {
  int? id;
  String? photoUrl;
  String? title;
  String? description;
  String? createTime;

  Announcement(
      {this.id, this.photoUrl, this.title, this.description, this.createTime});

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoUrl = json['photoUrl'];
    title = json['title'];
    description = json['description'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['photoUrl'] = photoUrl;
    data['title'] = title;
    data['description'] = description;
    data['createTime'] = createTime;
    return data;
  }
}
