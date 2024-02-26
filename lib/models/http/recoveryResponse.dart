// To parse this JSON data, do
//
//     final recoveryResponse = recoveryResponseFromMap(jsonString);
import 'dart:convert';

class RecoveryResponse {
  RecoveryResponse({
    required this.usuarioStatus,
  });

  bool? usuarioStatus;

  factory RecoveryResponse.fromJson(String str) =>
      RecoveryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecoveryResponse.fromMap(Map<String, dynamic> json) =>
      RecoveryResponse(
        usuarioStatus: json["usuarioStatus"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuarioStatus,
      };
}
