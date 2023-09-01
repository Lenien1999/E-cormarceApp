class Banner {
  String title;
  String subtitle;
  String image;
  String description;

  Banner(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.description});
}

final List<Banner> bannerList = [
  Banner(
      title: "SALE",
      subtitle: "UPTO \n60% OFF",
      image: "assets/images/main.png",
      description: "Schools Collection"),
  Banner(
      title: "ELECTRONIC DAY",
      subtitle: "GET YOUR \nDREAM DEVICE",
      image: "assets/images/main.png",
      description: "40% OFF"),
  Banner(
      title: "APPAREL",
      subtitle: "UPGRADE \nYOUR STYLE",
      image: "assets/images/main.png",
      description: "Streatwear Collection"),
];
