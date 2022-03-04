/// status : true
/// message : "تم التسجيل بنجاح"
/// data : {"name":"Amir Mohammed","email":"amir8@senior.com","phone":"010102059","id":6727,"image":"https://student.valuxapps.com/storage/assets/defaults/user.jpg","token":"Xk7JWTpIg8uRZ7Hru7kQpujiWvfI1HUcjzIkqvKRXROnMSXksPDUOwgXHdEi3x7UCLxNcX"}

class EcommerceRegisterResponse {
  EcommerceRegisterResponse({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  EcommerceRegisterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// name : "Amir Mohammed"
/// email : "amir8@senior.com"
/// phone : "010102059"
/// id : 6727
/// image : "https://student.valuxapps.com/storage/assets/defaults/user.jpg"
/// token : "Xk7JWTpIg8uRZ7Hru7kQpujiWvfI1HUcjzIkqvKRXROnMSXksPDUOwgXHdEi3x7UCLxNcX"

class Data {
  Data({
      String? name, 
      String? email, 
      String? phone, 
      int? id, 
      String? image, 
      String? token,}){
    _name = name;
    _email = email;
    _phone = phone;
    _id = id;
    _image = image;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _id = json['id'];
    _image = json['image'];
    _token = json['token'];
  }
  String? _name;
  String? _email;
  String? _phone;
  int? _id;
  String? _image;
  String? _token;

  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  int? get id => _id;
  String? get image => _image;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['id'] = _id;
    map['image'] = _image;
    map['token'] = _token;
    return map;
  }

}