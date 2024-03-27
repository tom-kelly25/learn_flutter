import 'package:flutter/material.dart';
import 'package:flutter_training/models/post.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    //fetch data from APi
    getData();
  }

  getData()async{
    //posts = await
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Posts'),
        ),
      
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index) {
        return Container(
          child: Text('Hi'),
        );
      },
      ),
      );
  }
}