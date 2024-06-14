import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreentask extends StatefulWidget {
  const HomeScreentask({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
  @override
  State<HomeScreentask> createState() => _HomeScreenState();


class _HomeScreenState extends State<HomeScreentask> {
  List<dynamic> users=[];

  get email => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API Call"),
      ),
      body: ListView.builder(itemCount: users.length,
          itemBuilder: (context,index){
        final user =users[index];
        final email =user ['email'];

        return ListTile(
          leading: Text('$index +1'),
          title: Text(email.toString()),
        );
      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }
  void fetchUsers()async{
    print("fetchUsers");
    const url="https://randomuser.me/api/";
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    await http.get(uri);
    final body=response.body;
    final json=jsonDecode(body);
    setState(() {
      users=json['results'];
    });
    print('fetchUsers completed');

}}
