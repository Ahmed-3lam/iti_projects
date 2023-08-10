import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/ecommerce/features/home/cubit/home_cubit.dart';
import 'package:iti_projects/ecommerce/features/home/model/ProductsModel.dart';
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
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final productsList =
                      context.read<HomeCubit>().productsModel.data?.data;

                  if (state is HomeProductsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return _buildCollection(
                      title: "Popular Pack", productsList: productsList);
                },
              ),
              SizedBox(
                height: 20,
              ),
              _buildCollection(
                title: "Our New Item",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCollection({
    required String title,
    List<MyProductData>? productsList,
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
        if (productsList != null)
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: productsList!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  _productItem(productsList[index]),
            ),
          ),
      ],
    );
  }

  Widget _productItem(
    MyProductData product,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              title: product.name!,
              description: product.description!,
              image: product.image!,
            ),
          ),
        );
      },
      child: Container(
        // height: 205,
        width: 184,

        margin: const EdgeInsets.only(
          right: 20,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              product.image ?? "",
              height: 90,
            ),
            Row(
              children: [
                Container(
                  width: 140,
                  child: Text(
                    product.name ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 140,
                  height: 50,
                  child: Text(
                    product.description ?? "",
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
            Row(
              children: [
                Text(
                  "EGP ${product.price!}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                if (product.discount != 0)
                  Text(
                    " ${product.discount!}",
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        if (state is HomeBannerLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(cubit.bannerModel.data?[3].image ?? "")),
        );
      },
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
