import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=cd20be03366c46d4a375ddb8f6927549";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );

          news.add(articleModel);
        }
      });
    }

  }
}
class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=cd20be03366c46d4a375ddb8f6927549";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );

          news.add(articleModel);
        }
      });
    }

  }
}