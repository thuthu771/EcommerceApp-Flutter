import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_ui/cartprovider.dart';
import 'package:online_ui/gotocart.dart';
//import 'package:online_ui/shoppingmodel.dart';
import 'package:provider/provider.dart';

//import 'api/shoppingapi.dart';

class SingleProduct extends StatefulWidget {
  final String title;
  final int id;
  final String count;
  final String rating;
  final String image;
  final String price;

  final String description;

  const SingleProduct(
      {super.key,
      required this.title,
      required this.id,
      required this.count,
      required this.rating,
      required this.image,
      required this.price,
      required this.description});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.shopping_bag_rounded)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 7,
                              color: Colors.grey)
                        ],
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.outfit(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.rating,
                        style: GoogleFonts.outfit(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: GoogleFonts.outfit(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    widget.description,
                    style: GoogleFonts.outfit(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 10,
                // ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "price:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                //SizedBox(height: 1),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ("\$${widget.price}"),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    )),
                // SizedBox(
                // height: 10,
                //),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (cartData.cartitem.contains(widget.id)) {
                          cartData.removefromcart(widget.id);
                          if (kDebugMode) {
                            print(cartData.cartitem);
                          }
                          HapticFeedback.heavyImpact();
                        } else {
                          cartData.addtocart(widget.id);
                          if (kDebugMode) {
                            print(cartData.cartitem);
                          }
                        }
                        //Navigator.of(context).push(
                        // MaterialPageRoute(builder: (context) => Gotocart()));
                      },
                      child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          // color: Colors.grey,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                // SizedBox(
                // height: 5,
                //  ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Gotocart()));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      // color: Colors.grey,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Go to Cart",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
