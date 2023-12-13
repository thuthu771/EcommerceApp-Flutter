import 'package:flutter/material.dart';
import 'package:online_ui/api/shoppingapi.dart';
import 'package:online_ui/cartprovider.dart';
//import 'package:online_ui/shoppingmodel.dart';
import 'package:provider/provider.dart';

class Gotocart extends StatefulWidget {
  const Gotocart({super.key});

  @override
  State<Gotocart> createState() => _GotocartState();
}

class _GotocartState extends State<Gotocart> {
  bool isloading = true;
  @override
  void initState() {
    // isloading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<cart>(context, listen: true);
    final productdata = Provider.of<Shoppingimg>(context, listen: true);

    cartdata.productDatas = productdata;
    Provider.of<cart>(context, listen: false).totalpr();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: cartdata.cartitem.length,
              itemBuilder: (context, index) {
                final productID = cartdata.cartitem[index];
                final productsn =
                    productdata.imageUrl!.firstWhere((p) => p.id == productID);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 7,
                              color: Colors.grey),
                        ]),
                    height: 150,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(productsn.image))),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productsn.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("size")),
                                Text(
                                  "\$${productsn.price.toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Cuopon code",
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.black,
                            ),
                            child: const Center(
                              child: Text("Apply",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("amount:"),
                          const Text("shipping Fee:"),
                          Text("Total Amount:${cartdata.totalPrice}"),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2.0,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
