import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/comment_model.dart';

class AdminCommentDatasource {
  final String contact;
  final String companyId;
  final String jobId;

  AdminCommentDatasource({
    required this.contact,
    required this.companyId,
    required this.jobId,
  });

  Future<List<CommentModel>> getData() async {
    List<CommentModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/comment.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(CommentModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({required CommentModel commentModel}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/comment.json",
    );
    await http.post(url, body: commentModel.toJson());
  }

  Future<void> editData({
    required String id,
    required CommentModel soz,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/comment/$contact.json",
    );
    await http.patch(url, body: jsonEncode({"coment":soz}));
  }

  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/comment/$id.json",
    );
    await http.delete(url);
  }
}
