import 'package:flutter/material.dart';

import '../model/product.dart';
import 'productdetails.dart';

class BuildRecentproduct extends StatefulWidget {
  const BuildRecentproduct({
    super.key,
  });

  @override
  State<BuildRecentproduct> createState() => _BuildRecentproductState();
}

class _BuildRecentproductState extends State<BuildRecentproduct> {
  
  List<bool> cartproduct = List.generate(productList.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: productList.length.clamp(1, 6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 14, crossAxisSpacing: 14),
        itemBuilder: ((context, index) {
          final product = productList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (__) {
                return ProductDetails(
                  product: product,
                );
              }));
            },
            child: Container(
              decoration: BoxDecoration(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Container(
                              height: 31,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFF67C4A7),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 40),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400),
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
        }));
  }
}
