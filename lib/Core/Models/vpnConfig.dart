
import 'model.dart';

class VpnConfig extends Model {
  VpnConfig({
    this.name,
    this.username,
    this.password,
    this.flag,
    this.config,
  });

  String name;
  String username;
  String password;
  String config;
  String flag;

  factory VpnConfig.fromJson(Map<String, dynamic> json) => VpnConfig(
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        config: json["config"] == null ? null : json["config"], flag: '',
        // flag: json["flag"] == null ? null : json["flag"]
      );

  Map<String, dynamic> toJson() => {
        "name": name == "" ? null : name,
        "username": username == "" ? null : username,
        "password": password == "" ? null : password,
        "config": config == "" ? null : config,
        // "flag": flag == null ? null : flag,
      };
}
