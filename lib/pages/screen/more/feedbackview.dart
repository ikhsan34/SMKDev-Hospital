import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedbackView extends StatefulWidget {

  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: WebView(
        initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLScxFdrCxDqe2_pCQBoDk1QHGK85L4hX3-kdpc25Tyh7vJrc8Q/viewform',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}