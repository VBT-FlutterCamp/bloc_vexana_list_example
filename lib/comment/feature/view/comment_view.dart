import 'package:bloc_example_vexana_list/comment/core/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/widget/card_comment.dart';
import '../service/comment_service.dart';
import '../viewmodel/comment_viewmodel.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(CommentService(NetworkService.instance.networkManager)),
      child: BlocConsumer<CommentsCubit, CommentsState>(
        listener: (context, state) {
          if (state is CommentErrorState) {
            showModalBottomSheet(context: context, builder: (context) => Text('Error Message'));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.watch<CommentsCubit>().listCount.toString()),
            ),
            body: builBody(state),
          );
        },
      ),
    );
  }

  Widget builBody(CommentsState state) {
    if (state is CommentLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CommentComplete) {
      return ListView.builder(
          itemCount: state.items?.length,
          itemBuilder: (BuildContext context, int index) {
            return CommentCart(model: state.items?[index]);
          });
    } else {
      return Text('hata');
    }
  }
}
