class UserDetails {
  String name;
  String surname;
  String username;
  String email;
  String dob;
  String phoneNumber;
  String imagePath;

  UserDetails({
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    required this.dob,
    required this.phoneNumber,
    required this.imagePath,
  });

  // update email
  void updateEmail(String newEmail) {
    email = newEmail;
  }
}
