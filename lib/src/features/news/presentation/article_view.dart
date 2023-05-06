// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api



import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


//import '../widget.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  const ArticleView({super.key, required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool isLoading = true;
  InAppWebViewController? _webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.share,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: InAppWebView(
            onWebViewCreated: (InAppWebViewController controller){
              _webViewController = controller;
            },
            initialUrlRequest: URLRequest(url: Uri.parse(widget.postUrl)),
          )),
    );
  }
}


// WebViewWidget(
//           controller: webcontroller,

//           initialUrl:  widget.postUrl,
//           onWebViewCreated: (WebViewController webViewController){
//             _controller.complete(webViewController);
//           },
//         ),