class UserAccount{
  final String username;
  final  String email;
  final String password;
  
  UserAccount({this.email='',this.password='',this.username='',});
  Map<String, dynamic> toJson(){
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
  static UserAccount fromJson(Map<String,dynamic> json){
    return UserAccount(
      email: json['email'],
      password: json['password'],
      username: json['username'],
    );
  }
}