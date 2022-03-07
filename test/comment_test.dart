import 'package:bloc_example_vexana_list/comment/feature/model/comment_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? manager;
  setUp(() {
    const String baseUrl = 'https://jsonplaceholder.typicode.com/comments';
    manager = NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: baseUrl));
  });
  test('Sample Test', () async {
    final response =
        await manager?.send<CommentModel, List<CommentModel>>('', parseModel: CommentModel(), method: RequestType.GET);

    expect(response, isNotNull);
  });
}
