import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myproject/models/post_model.dart';
import 'package:http/http.dart' as http;

class DataHandeler {
  //fetch post
  Future<List<Post>> fetchhotelpost() async {
    List<Post> postlist = [];
    final url = Uri.parse(
        "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json");

    try {
      final response = await http.get(url, headers: {
        'Accept': '*/*',
        'Content-type': 'application/json',
      });

      Post postModel;
      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> values = [];
        values = data["data"];

        for (var element in values) {
          postModel = Post.fromJson(element);
          postlist.add(postModel);
        }
      } else {
        throw Exception('Failed to load');
      }
      return postlist;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return postlist;
    }
  }
}
