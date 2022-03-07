import 'package:vexana/vexana.dart';

import '../model/comment_model.dart';

abstract class ICommmentService {
  final INetworkManager manager;

  ICommmentService(this.manager);

  Future<List<CommentModel>?> fetchCommentDatas();
}

class CommentService extends ICommmentService {
  CommentService(INetworkManager manager) : super(manager);

  @override
  Future<List<CommentModel>?> fetchCommentDatas() async {
    final response = await manager.send<CommentModel, List<CommentModel>?>(NetworkPath.comment.rawValue(),
        parseModel: CommentModel(), method: RequestType.GET);

    return response.data ?? [];
  }
}

enum NetworkPath { comment }

extension NetworkPathExtension on NetworkPath {
  String rawValue() {
    switch (this) {
      case NetworkPath.comment:
        return '/comments';
      default:
        throw Exception('Routes Not Found'); //hatamesajı
    }
  }
}
