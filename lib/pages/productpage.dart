import 'package:ecormanceapp/pages/productdetails.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';
import 'cartpage.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int cartCount = 0;
  TextStyle style = const TextStyle(
      color: Color(0xFF393F42), fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle substyle = const TextStyle(
      color: Color(0xFF939393), fontSize: 12, fontWeight: FontWeight.w400);
  bool isPressed = false;
  List<Products> cartItems = [];
  List<Products> displaySearchList = List.from(productList);
  List<bool> isSelectedList =
      List.generate(productList.length, (index) => false);

  void updateList(String value) {
    setState(() {
      displaySearchList = productList
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  String text = "";
  void addToCart(Products product, int index) {
    setState(() {
      cartItems.add(product);
      isSelectedList[index] = true;

      cartCount += 1;
    });
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (__) {
                    return CartPage(
                      cartItem: cartItems,
                    );
                  }));
                },
                icon: Badge(
                    label: Text(cartCount.toString()),
                    child: const Icon(Icons.shopping_cart_outlined)))
          ],
          centerTitle: true,
          title: Text(
            'Product',
            style: style,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 219, 214, 214)),
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                  controller: controller,
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                      suffixIcon: controller.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                controller.clear();
                                setState(() {});
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ))
                          : null,
                      hintText: 'Search here...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.text.isEmpty
                    ? const Text(
                        " ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF393F42),
                        ),
                      )
                    : Text(
                        ' Search Result for "${controller.text}"',
                        style: const TextStyle(
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
              height: 7,
            ),

            // ignore: unrelated_type_equality_checks
            if (displaySearchList.length == 0)
              const Center(
                child: Text(
                  "No Result Found",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            else
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: displaySearchList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12),
                    itemBuilder: ((context, index) {
                      final product = displaySearchList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (__) {
                            return ProductDetails(
                              product: product,
                            );
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 227, 227),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Image.asset(
                                    product.images,
                                    width: 170,
                                    height: 112,
                                    fit: BoxFit.cover,
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Color(0xFF393F42),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        product.price.toString(),
                                        style: const TextStyle(
                                            color: Color(0xFF393F42),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 11,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (!isSelectedList[index]) {
                                              addToCart(product, index);
                                            }
                                          },
                                          child: isSelectedList[index]
                                              ? GestureDetector(
                                                  onTap: () {
                                                    isPressed = false;
                                                  },
                                                  child: Container(
                                                    height: 31,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: const Color(
                                                          0xFF67C4A7),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 40),
                                                      child: Text(
                                                        "Added",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 31,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: const Color(
                                                          0xFF67C4A7)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 40),
                                                    child: Text(
                                                      "Add to cart",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xFFFFFFFF),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              )
          ],
        ),
      ),
    );
  }
}
