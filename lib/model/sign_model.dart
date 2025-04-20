class SignModel {
    final String contact;
    final String password;

    SignModel({
        required this.contact,
        required this.password,
    });

    SignModel copyWith({
        String? contact,
        String? password,
    }) => 
        SignModel(
            contact: contact ?? this.contact,
            password: password ?? this.password,
        );

    factory SignModel.fromJson(Map<String, dynamic> json) => SignModel(
        contact: json["contact"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "contact": contact,
        "password": password,
    };
}