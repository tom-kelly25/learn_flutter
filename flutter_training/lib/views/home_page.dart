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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Posts'),
        ),
      
      body: ListView.builder(itemBuilder: (context,index) {
        return Container(
          child: Text('Hi'),
        );
      },
      ),
      );
  }
}