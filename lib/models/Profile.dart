class Profile {
  final String name, image;
  final bool isActive;

  Profile({this.name = "", this.image = "", this.isActive = true});
}

List profileData = [
  Profile(name: 'Ali Asar', image: "assets/images/bill.jpg", isActive: true),
];
