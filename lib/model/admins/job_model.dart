import 'package:top_jobs/model/admins/comment_model.dart';
import 'package:top_jobs/model/admins/grade_model.dart';

class JobModel {
  final Map<String, CommentModel> comment;
  final String companyImage;
  final Map<String, GradeModel> grade;
  final String jobName;
  final String jobTile;
  final String salary;
  final String shortLocation;
  final DateTime time;

  JobModel({
    this.comment = const {},
    required this.companyImage,
    this.grade = const {},
    required this.jobName,
    required this.jobTile,
    required this.salary,
    required this.shortLocation,
    required this.time,
  });

  JobModel copyWith({
    String? companyImage,
    String? jobName,
    String? jobTile,
    String? salary,
    String? shortLocation,
    DateTime? time,
  }) => JobModel(
    comment: comment,
    companyImage: companyImage ?? this.companyImage,
    grade: grade,
    jobName: jobName ?? this.jobName,
    jobTile: jobTile ?? this.jobTile,
    salary: salary ?? this.salary,
    shortLocation: shortLocation ?? this.shortLocation,
    time: time ?? this.time,
  );

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      JobModel(
        comment: json["comment"],
        companyImage: json["companyImage"],
        grade: json["grade"],
        jobName: json["jobName"],
        jobTile: json["jobTile"],
        salary: json["salary"],
        shortLocation: json["shortLocation"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "companyImage": companyImage,
    "grade": grade,
    "jobName": jobName,
    "jobTile": jobTile,
    "salary": salary,
    "shortLocation": shortLocation,
    "time":
        "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
  };
}
