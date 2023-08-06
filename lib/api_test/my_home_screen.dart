import 'dart:convert';

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

  @override
  void initState() {
    getDateFromApi();
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
              itemCount: apiList?.length,
              itemBuilder: (context, index) => Container(
                    height: 200,
                    width: 300,
                    margin: EdgeInsets.only(bottom: 20),
                    color: Colors.green.withOpacity(.5),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(apiList?[index].title ?? "",style: TextStyle(
                            fontSize: 20,
                            color: Colors.red
                          ),),
                          Text(apiList?[index].body ?? "",style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                          ),),
                        ],
                      ),
                    ),
                  )),
    );
  }

  Future<void> getDateFromApi() async {
    isLoading = true;
    setState(() {});


    var client = http.Client();
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );


    var body = json.decode(response.body);

    for(var i in body){
      apiList.add(PostModel.fromJson(i));
    }

    // apiList = body.map((element) => PostModel.fromJson(element)).toList();

    print(response.body);

    isLoading = false;
    setState(() {});
  }
}

List<dynamic> apiList = [];
