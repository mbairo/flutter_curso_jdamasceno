class Post {
  int? _userId;
  int? _id;
  String? _title;
  String? _body;

  Post(this._userId, this._id, this._title, this._body);
  Map toJson() {
    return {
      "userId": this._userId,
      "id": this._id,
      "title": this._title,
      "body": this._body
    };
  }

  int? get userId => this._userId;
  set userId(int? userId) => this._userId = userId;

  int? get id => this._id;
  set id(int? id) => this._id = id;

  String? get title => this._title;
  set title(String? title) => this._title = title;

  String? get body => this._body;
  set body(String? body) => this._body = body;
}
