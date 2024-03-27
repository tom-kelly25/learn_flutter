import 'package:flutter/material.dart';
import 'package:flutter_training/models/post.dart';
import 'package:flutter_training/services/remote_service.dart';

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
    posts = await RemoteService().getPosts();
    if (posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Posts'),
        ),
      
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context,index) {
          return Container(
            child: Text(posts![index].title),
          );
        },
        ),
      ),
      );
  }
}