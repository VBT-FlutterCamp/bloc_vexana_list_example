import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/comment_model.dart';
import '../service/comment_service.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this.commmentService) : super(CommentsInitial()) {
    fetchLisData(); //init()
  }

  ICommmentService commmentService;
  List<CommentModel>? model;
  int? listCount = 0;
  Future<void> fetchLisData() async {
    emit(CommentLoading());
    final model = await commmentService.fetchCommentDatas();
    listCount = model?.length;
    emit(CommentComplete(model));
  }
}

abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentLoading extends CommentsState {}

class CommentComplete extends CommentsState {
  final List<CommentModel>? items;

  CommentComplete(this.items);
}

class CommentErrorState extends CommentsState {}
