import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/job_model.dart';

class AllJobsDatasource {
  Future<List<JobModel>> getData() async {
    List<JobModel> jobs = [];
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins.json",
    );
    final data = await http.get(uri);
    final decodedData = jsonDecode(data.body) as Map;
    
    
    final keys = decodedData.keys.toList();
    print(keys);
    for (var i in keys) {
      List jobs =
          (decodedData[i]["jobs"] as Map).keys.toList();
      for (var j in jobs) {
      print(decodedData[i]["jobs"][j]);

        jobs.add(
          JobModel.fromJson(decodedData[i]["jobs"][j]),
        );
      }
    }
    return jobs;
  }
}
