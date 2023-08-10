import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iti_projects/api_test/model/PostModel.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool isLoading = false;
  List<PostModel> apiList = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: apiList.length,
              itemBuilder: (context, index) => Container(
                    height: 200,
                    width: 300,
                    margin: EdgeInsets.only(bottom: 20),
                    color: Colors.green.withOpacity(.5),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            apiList[index].title ?? "",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                          Text(
                            apiList[index].body ?? "",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )),
    );
  }

  Future fetchData() async {
    isLoading = true;
    setState(() {});

    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var client = http.Client();

    final response = await client.get(url);

    final myData = json.decode(response.body) as List;
    print(
        myData.toString()
    );

    //
    // for (var item in myData) {
    //   final post = PostModel.fromJson(item);
    //
    //   apiList.add(post);
    //
    // }

    apiList = myData.map((item) => PostModel.fromJson(item)).toList();

    // developer.log(apiList.toString());
    isLoading = false;
    setState(() {});
  }
}



