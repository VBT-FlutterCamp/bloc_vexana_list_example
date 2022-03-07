import 'package:flutter/material.dart';

import 'comment/feature/view/comment_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Material App', home: CommentView());
  }
}
