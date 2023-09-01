import 'package:ecormanceapp/model/product.dart';
import 'package:ecormanceapp/pages/productpage.dart';
import 'package:flutter/material.dart';

import '../model/banner.dart';

import 'recentproduct.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int badgeCount = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (__) {
                  //   return const CartPage();
                  // }));
                },
                icon: Badge(
                    label: Text(badgeCount.toString()),
                    child: const Icon(Icons.shopping_cart_outlined))),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_outlined))
          ],
          title: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery address",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Salatiga City, Central Java",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                //
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 219, 214, 214)),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Search here...',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none)),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.only(top: 10, left: 12, bottom: 9),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    for (var banner in bannerList)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 144,
                        width: 304,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFEE1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    banner.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Color(0xFFE97639)),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    banner.subtitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25,
                                        color: Color(0xFF000000)),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    "School Collection",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Color(0xFF000000)),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Image.asset(banner.image)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF393F42),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCategory(
                      color: const Color(0xFFEDF7FF),
                      images: "assets/images/fashion4.png",
                      title: "Apparel"),
                  buildCategory(
                      color: const Color(0xFFEDF7FF),
                      images: "assets/images/fashion3.png",
                      title: "School"),
                  buildCategory(
                      color: const Color(0xFFFFEDDD),
                      images: "assets/images/fashion2.png",
                      title: "Sports"),
                  buildCategory(
                      color: const Color(0xFFFFEEED),
                      images: "assets/images/fashion1.png",
                      title: "Electronic"),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (__) {
                        return const ProductPage();
                      }));
                    },
                    child: buildCategory(
                        color: const Color(0xFFE9FFF8),
                        images: "assets/images/Category.png",
                        title: "All"),
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent product",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF393F42),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xFFF0F2F1),
                          width: 1,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: Row(
                        children: [
                          const Text(
                            "Filter",
                            style: TextStyle(
                              color: Color(0xFF393F42),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset("assets/images/Filter.png")
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Expanded(child: BuildRecentproduct())
            ],
          ),
        ),
      ),
    );
  }

  // Color buldColor(int index) {
  buildCategory(
      {required String images, required String title, required Color color}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Image.asset(
            images,
            width: 55,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF939393),
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
