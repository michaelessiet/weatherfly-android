class KeyModel {
  final String apiKey;
  KeyModel({this.apiKey});

  factory KeyModel.fromJson(Map<String, dynamic> jsonMap) {
    return KeyModel(apiKey: jsonMap["api_key"]);
  }
}