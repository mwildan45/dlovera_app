class User {
  String? status;
  String? token;
  String? username;
  String? namaLengkap;

  User({this.status, this.token, this.username, this.namaLengkap});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    username = json['username'];
    namaLengkap = json['nama_lengkap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['username'] = this.username;
    data['nama_lengkap'] = this.namaLengkap;
    return data;
  }
}
