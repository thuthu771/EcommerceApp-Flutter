import 'package:flutter/material.dart';
import 'package:online_ui/api/shoppingapi.dart';
import 'package:online_ui/singlepro.dart';
import 'package:provider/provider.dart';

class seeall extends StatefulWidget {
  const seeall({super.key});

  @override
  State<seeall> createState() => _seeallState();
}

class _seeallState extends State<seeall> {
  @override
  void initState() {
    super.initState();
    Provider.of<Shoppingimg>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Shoppingimg>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(),
        body: productdata.isloading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SingleProduct(
                          title: productdata.imageUrl![index].title,
                          rating: productdata.imageUrl![index].rating.rate
                              .toString(),
                          description: productdata.imageUrl![index].description,
                          id: productdata.imageUrl![index].id,
                          count: productdata.imageUrl![index].rating.count
                              .toString(),
                          image: productdata.imageUrl![index].image,
                          price: productdata.imageUrl![index].price.toString(),
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          productdata.imageUrl![index].image,
                                        ),
                                        fit: BoxFit.contain),
                                    color: Colors.white),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
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
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        productdata.imageUrl![index].rating.rate
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w100),
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
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
