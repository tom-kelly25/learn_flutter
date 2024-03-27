import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title:Center(child: const Text('Posts')),
        ),
      
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context,index) {
          return Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                      ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts![index].title, 
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: 
                      TextStyle(fontSize: 24, 
                      fontWeight: FontWeight.bold),
                      ),
                       Text(
                        posts![index].body ?? '', 
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        ),
      ),
      );
  }
}