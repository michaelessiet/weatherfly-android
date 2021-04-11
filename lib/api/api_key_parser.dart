import 'dart:convert';
 
import 'package:flutter/services.dart';
import 'package:weatherfly/models/api_key_model.dart';

class KeyLoader {
  final String json_file_path;
  KeyLoader({this.json_file_path});

  Future<KeyModel> load() {
    return rootBundle.loadStructuredData(this.json_file_path, (jsonStr) async {
      final api_key = KeyModel.fromJson(jsonDecode(jsonStr));
      return api_key;
    });
  }
}