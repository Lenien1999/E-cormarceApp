import 'package:ecormanceapp/model/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Products product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Details Product",
          style: TextStyle(
              color: Color(0xFF393F42),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1 / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    widget.product.images,
                    fit: BoxFit.cover,
                    height: 286,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.title,
                            style: const TextStyle(
                                color: Color(0xFF393F42),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.product.price.toString(),
                            style: const TextStyle(
                                color: Color(0xFF393F42),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 219, 213, 213)),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                            icon: isSelected
                                ? Icon(
                                    Icons.favorite_border,
                                    color:
                                        isSelected ? Colors.grey : Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color:
                                        isSelected ? Colors.grey : Colors.red,
                                  )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: [
                  const Text(
                    "Choose the color",
                    style: TextStyle(
                        color: Color(0xFF939393),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildColorContainer(color: const Color(0xFFF5E3DF)),
                      buildColorContainer(
                        color: const Color(0xFFECECEC),
                      ),
                      buildColorContainer(color: const Color(0xFFE4F2DF)),
                      buildColorContainer(color: const Color(0xFFD5E0ED)),
                      buildColorContainer(color: const Color(0xFF3E3D40))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: ListTile(
                      leading: Image.asset("assets/images/rectangle.png"),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apple Store",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF393F42)),
                          ),
                          Text(
                            "Online 12 mins ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF939393)),
                          ),
                        ],
                      ),
                      trailing: Container(
                        height: 37,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, color: const Color(0xFFD9D9D9))),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFF393F42),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Description of Product",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF393F42),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: const TextStyle(
                        height: 2,
                        fontSize: 12,
                        color: Color(0xFF393F42),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 43),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45,
                    width: 167,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF67C4A7),
                    ),
                    child: const Center(
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 167,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: const Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Color(0xFF393F42),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildColorContainer({required Color color}) {
    return Card(
      elevation: 1,
      child: Container(
        height: 41,
        width: 61,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
