import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Product Name",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.left_chevron,
            color: Colors.black,
            size: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                      child: Image.asset("assets/images/product1.png")),
                 const Padding(
                   padding: EdgeInsets.all(12.0),
                   child: CircleAvatar(
                     backgroundColor: Colors.white,
                     radius: 20,
                     child: Icon(CupertinoIcons.heart,color: Colors.green,),
                   ),
                 )
                ],
              ),
              const SizedBox(height: 20,),
              const Text("Product Title",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 20,),
              const Text("Product Description",style: TextStyle(
                fontSize: 18,

              ),),
            ],
          ),
        ),
      ),
    );
  }
}
