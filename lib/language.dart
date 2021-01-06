class Language {
  final String languageCode;
  String firstName;
  String lastName;
  String dateOfBirth;
  String country;
  String state;
  String city;
  String pincode;
  String postalAddress;
  String emailId;
  String panCard;
  String voterId;
  String home;
  String scan;
  String profile;
  String notifications;
  String myDashBoard;

  Language.fromJson(Map<String, dynamic> json, this.languageCode) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    postalAddress = json['postalAddress'];
    emailId = json['emailId'];
    panCard = json['panCard'];
    voterId = json['voterId'];
    home = json['home'];
    scan = json['scan'];
    profile = json['profile'];
    notifications = json['notifications'];
    myDashBoard = json['myDashBoard'];
  }
}
