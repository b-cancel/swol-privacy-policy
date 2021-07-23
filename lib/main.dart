import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swol Privacy Policy',
      home: PrivacyPolicy(),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mdFileName = 'privacyPolicy.md';
    return Scaffold(
      appBar: AppBar(
        title: Text("Swol Privacy Policy"),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('assets/$mdFileName'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              physics: BouncingScrollPhysics(),
              data: snapshot.data.toString(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
