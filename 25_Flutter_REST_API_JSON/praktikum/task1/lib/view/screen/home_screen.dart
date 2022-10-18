import 'package:task1/model/user_model.dart';
import 'package:task1/view/screen/service.dart';
import 'package:task1/view/widget/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostModel? postModel;
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API JSON'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Name',
                  label: const Text('Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: jobController,
              decoration: InputDecoration(
                  hintText: 'Job',
                  label: const Text('Job'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Result', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          postModel != null ? ModelCard(postModel: postModel!) : const Text('No Data'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              // mainAxisSpacing: 7,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue),
                      onPressed: () async {
                        PostModel? result = await DataServices.getById(2);

                        if(result != null){
                          setState(() {
                            postModel = result;
                          });
                        }
                      },
                      child: const Text('Get')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue),
                      onPressed: () async {
                        PostModel? result = await DataServices.createUser(nameController.text, jobController.text);

                        if(result != null){
                          setState(() {
                            postModel = result;
                          });
                        }
                      },
                      child: const Text('Post')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue),
                      onPressed: () async {
                        PostModel? result = await DataServices.updateUser(nameController.text, jobController.text);

                        if(result != null){
                          setState(() {
                            postModel = result;
                          });
                        }
                      },
                      child: const Text('Put')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue),
                      onPressed: () async {
                        PostModel? result = await DataServices.deleteUser();

                        if(result != null){
                          setState(() {
                            postModel = result;
                          });
                        }
                      },
                      child: const Text('Delete')),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}