import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleInWeb extends StatefulWidget {
  final String url;
  const ArticleInWeb({required this.url, Key? key}) : super(key: key);

  @override
  _ArticleInWebState createState() => _ArticleInWebState();
}

class _ArticleInWebState extends State<ArticleInWeb> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "THE",
              style: TextStyle(color: Colors.grey[200]),
            ),
            Text(
              "NEWS",
              style: TextStyle(color: Colors.blue[700]),
            )
          ],
        ),

        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ) ,
      body: Container(  
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
      child: WebView(
        initialUrl: widget.url,
        onWebViewCreated: ((WebViewController webViewController)
        {
          _completer.complete(webViewController);
        }
        ),

      ),
    ),
    );
  }
}
