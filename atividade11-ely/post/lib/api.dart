import 'package:http/http.dart' as http;

class API {
  static Future getUsers(pageKey, pageSize) async {
    var uri =
        'https://jsonplaceholder.typicode.com/posts?_limit=$pageSize&_page=$pageKey';
    return await http.get(Uri.parse(uri));
  }
}

class API2 {
  static Future getUsers2() async {
    return await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));
  }
}