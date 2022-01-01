import 'package:http/http.dart';
import 'package:the_newes/Model/article.dart';
import 'package:the_newes/constants.dart';
import 'package:the_newes/Model/Networking.dart';

class NewsManger {
  List<Article> news = [];
  Networking net = Networking();

  Future<void> getNews() async {
    ApiResult result = ApiResult();
    result = await Networking().getData(getNewsURL);

    if (result.hasError == false) {
      for (var element in result.data['articles']) {
        if (element['urlToImage']!=null){ 
        Article article = Article
        (
          imageURL: element['urlToImage'] ?? "null",
          articleURL: element['url']?? "null",
          source: element['source']['name']?? "null",
          content: element['content']?? "null",
          text: element['description']?? "null",
          title: element['title']?? "null"
          
        );
        news.add(article);
       
        }
      }
    }
    else{
      print(result.failure.message);
    }
  }
}
