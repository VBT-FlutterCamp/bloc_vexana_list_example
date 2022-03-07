import 'package:flutter/material.dart';

import '../../feature/model/comment_model.dart';

class CommentCart extends StatelessWidget {
  final CommentModel? model;
  const CommentCart({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _elevationCard = 10;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Card(
        elevation: _elevationCard,
        child: ListTile(
          leading: Text(model?.id.toString() ?? ''),
          title: Text(model?.body ?? ''),
          subtitle: Text(model?.email ?? ''),
        ),
      ),
    );
  }
}
