class UserProfile {
  late String username;
  late String email;
  late String dob;
  late int balance;
  late String country;

  UserProfile(
      {required this.username,
      required this.email,
      required this.dob,
      required this.balance,
      required this.country});

  UserProfile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    dob = json['dob'];
    balance = json['balance'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['balance'] = this.balance;
    data['country'] = this.country;
    return data;
  }
}
