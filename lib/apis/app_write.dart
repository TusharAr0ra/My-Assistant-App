import 'dart:developer';

import 'package:appwrite/appwrite.dart';

import '../helper/global.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('66b208a1000da437e59e')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'MyAssistantDatabase',
          collectionId: '66b20cd4000ff189d063',
          documentId: 'chatGptKey ');

      apiKey = d
          .data['apiKey']; //the name we have given the the api key is: "apiKey"
      log(apiKey);
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
