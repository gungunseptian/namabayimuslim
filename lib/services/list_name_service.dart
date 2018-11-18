
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/list_name_model.dart';
import 'dart:io';

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Post>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}