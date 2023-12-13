//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_ui/api/shoppingapi.dart';
import 'package:online_ui/seeall1.dart';
import 'package:provider/provider.dart';

class onlineshop extends StatefulWidget {
  const onlineshop({super.key});

  @override
  State<onlineshop> createState() => _onlineshopState();
}

class _onlineshopState extends State<onlineshop> {
  @override
  void initState() {
    super.initState();
    Provider.of<Shoppingimg>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Shoppingimg>(context);
    List<Map<String, dynamic>> locations = [
      {"title": "men", "icon:": Icons.man_rounded},
      {"title": "women", "icon:": Icons.woman},
      {"title": "kids", "icon:": Icons.man_3_outlined},
      {"title": "shirts", "icon:": Icons.collections_rounded},
      {"title": "watch", "icon:": Icons.watch},
      {"title": "soap", "icon:": Icons.soap},
      {"title": "speaker", "icon:": Icons.speaker},
      {"title": "more", "icon:": Icons.person},
    ];
    List offer = ["Onam Sale", "50% Offer"];

    return Scaffold(
      appBar: AppBar(),
      body: productdata.isloading == true
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.grey[200],
                                  filled: true),
                            ),
                          )),
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.shopping_cart)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 180,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 150,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 5, offset: Offset(0, 3))
                                      ],
                                      color: const Color.fromARGB(
                                          255, 198, 223, 235),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, top: 15),
                                            child: Text(
                                              "summer sale",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 25),
                                            child: Text(
                                              "50% offer",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 50),
                                            child: Container(
                                              height: 25,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 221, 219, 219),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                child: Text("Buy now",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35),
                                        child: Container(
                                          height: 145,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      productdata
                                                          .imageUrl![index]
                                                          .image),
                                                  fit: BoxFit.fill)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "Top Categories",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 19),
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 198, 223, 235),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(
                                locations[index]["icon:"],
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Text(locations[index]["title"])
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Best Sellers",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const seeall()));
                            },
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 240,
                            width: double.infinity,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      width: 170,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 7,
                                              color: Colors.grey,
                                              offset: Offset(0, 5))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 120,
                                              //width: 150,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        productdata
                                                            .imageUrl![index]
                                                            .image),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            productdata.imageUrl![index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 12,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                productdata.imageUrl![index]
                                                    .rating.rate
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              Text(
                                                  "(${productdata.imageUrl![index].rating.count.toString()}Reviews)"),
                                            ],
                                          ),
                                          Text(
                                            "\$${productdata.imageUrl![index].price.toString()}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
