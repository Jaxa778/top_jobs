
class EdecationModel {
    final String degree;
    final String duration;
    final String educationName;

    EdecationModel({
        required this.degree,
        required this.duration,
        required this.educationName,
    });

    EdecationModel copyWith({
        String? degree,
        String? duration,
        String? educationName,
    }) => 
        EdecationModel(
            degree: degree ?? this.degree,
            duration: duration ?? this.duration,
            educationName: educationName ?? this.educationName,
        );

    factory EdecationModel.fromJson(Map<String, dynamic> json) => EdecationModel(
        degree: json["degree"],
        duration: json["duration"],
        educationName: json["educationName"],
    );

    Map<String, dynamic> toJson() => {
        "degree": degree,
        "duration": duration,
        "educationName": educationName,
    };
}
