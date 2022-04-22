
class User {
    int? albumId;
    int? id;
    String? title;
    String? url;
    String? thumbnailUrl;

    User({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

    User.fromJson(Map<String, dynamic> json) {
        this.albumId = json["albumId"];
        this.id = json["id"];
        this.title = json["title"];
        this.url = json["url"];
        this.thumbnailUrl = json["thumbnailUrl"];
    }

  get name => null;

  get username => null;

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["albumId"] = this.albumId;
        data["id"] = this.id;
        data["title"] = this.title;
        data["url"] = this.url;
        data["thumbnailUrl"] = this.thumbnailUrl;
        return data;
    }
}