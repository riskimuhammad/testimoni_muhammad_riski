class TestimonialsModel {
  int? limit;
  int? page;
  String? search;
  String? name;

  TestimonialsModel({this.limit, this.page, this.search, this.name});

  TestimonialsModel.fromJson(dynamic json) {
    limit = json["limit"];
    page = json["page"];
    search = json["search"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["limit"] = limit;
    data["page"] = page;
    data["search"] = search;
    data["name"] = name;
    return data;
  }
}
