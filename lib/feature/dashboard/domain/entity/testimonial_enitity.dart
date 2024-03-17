class TestimonialsEntity {
  String? id;
  String? createdAt;
  String? name;
  String? avatar;
  String? content;
  int? likes;
  bool? show;

  TestimonialsEntity(this.id, this.createdAt, this.name, this.avatar,
      this.content, this.likes);

  TestimonialsEntity.fromJson(dynamic json) {
    id = json["id"];
    show = json["show"];
    createdAt = json["createdAt"];
    name = json["name"];
    avatar = json["avatar"];
    content = json["content"];
    likes = json["likes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["createdAt"] = createdAt;
    data["name"] = name;
    data["avatar"] = avatar;
    data["content"] = content;
    data["likes"] = likes;
    data['show'] = show;
    return data;
  }
}
