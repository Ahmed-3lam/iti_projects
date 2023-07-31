import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_projects/ecommerce/product_details/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              _buildCollection(title: "Popular Pack"),
              SizedBox(
                height: 20,
              ),
              _buildCollection(title: "Our New Item"),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCollection({
    required String title,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 220,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _productItem(),
          ),
        ),
      ],
    );
  }

  Widget _productItem() {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
          ),
        );
      },
      child: Container(
        height: 205,
        width: 184,
        margin: const EdgeInsets.only(right: 20,),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/product1.png",
              height: 90,
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  "Bundle Pack",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Container(
                  width: 140,
                  child: const Text(
                    "hggggggggkkkkkkkkkkkkkgggggggggg",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text(
                  "\$35",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "50.32",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: null,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 14,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset("assets/images/banner.png"),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CircleAvatar(
        backgroundColor: Colors.grey[100],
        radius: 20,
        child: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      titleSpacing: 40,
      title: const Row(
        children: [
          Icon(
            Icons.pin_drop,
            color: Colors.black,
            size: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Current Location",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    CupertinoIcons.down_arrow,
                    color: Colors.green,
                  )
                ],
              ),
              Text(
                "Chhatak,Syhlet",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          )
        ],
      ),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey[100],
          radius: 20,
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
