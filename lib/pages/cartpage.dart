import 'package:ecormanceapp/model/product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Products> cartItem;
  const CartPage({super.key, required this.cartItem});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextStyle style = const TextStyle(
      color: Color(0xFF393F42), fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle substyle = const TextStyle(
      color: Color(0xFF939393), fontSize: 12, fontWeight: FontWeight.w400);
  bool checkboxvalue = false;
  double totalprice = 0;

  void gettotalprice() {
    double total = 0;
    for (var item in widget.cartItem) {
      total += item.price * item.quantity;
    }
    setState(() {
      totalprice = total;
    });
  }

  @override
  void initState() {
    gettotalprice();
    super.initState();
    checkboxValues = List.generate(widget.cartItem.length, (index) => false);
  }

  List<bool> checkboxValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
          title: Text(
            'Your Cart',
            style: style,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xFFF0F2F1))),
            child: Row(
              children: [
                Text(
                  "Delivery to",
                  style: style.copyWith(fontSize: 12),
                ),
                Row(
                  children: [
                    const Text(
                      "Salatiga City, Central Java",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 1.2 / 2,
              child: ListView.builder(
                itemCount: widget.cartItem.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final cartproduct = widget.cartItem[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.greenAccent,
                              value: checkboxValues[index],
                              onChanged: (value) {
                                setState(() {
                                  checkboxValues[index] = value!;
                                  cartproduct.isSelected = value;
                                });
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                cartproduct.images,
                                height: 76,
                                width: 82,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartproduct.title,
                                    style: style,
                                  ),
                                  Text(
                                    "Varient:  ${cartproduct.variant}",
                                    style: substyle,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "\$ ${cartproduct.price}",
                                    style: style,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 221, 219, 219),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (cartproduct.quantity > 1) {
                                        cartproduct.quantity -= 1;
                                        gettotalprice();
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.remove,
                                      size: 16,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                cartproduct.quantity.toString(),
                                style: style,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 221, 219, 219),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      setState(() {
                                        cartproduct.quantity += 1;
                                        gettotalprice();
                                      });
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 221, 219, 219),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.cartItem.remove(cartproduct);
                                      gettotalprice();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.delete,
                                      size: 16,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 137,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 21, horizontal: 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: style,
                            ),
                            Text(
                              "\$${totalprice.toStringAsFixed(2)}",
                              style: style,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: widget.cartItem
                                    .any((product) => product.isSelected)
                                ? const Color(0xFF67C4A7)
                                : const Color(0xFFF0F2F1),
                          ),
                          child: Center(
                            child: Text(
                              "Continue for payment",
                              style: style.copyWith(
                                color: widget.cartItem
                                        .any((product) => product.isSelected)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
