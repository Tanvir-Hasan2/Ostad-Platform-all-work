import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _updateTitleController = TextEditingController();
  final _updateDescriptionController = TextEditingController();
  List data = [];
  String baseUrl = 'https://api.nstack.in/v1/todos/';

  Future<void> postData(title, description) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "title": title,
          "description": description,
          "is_completed": false
        }));
    if (response.statusCode == 201) {
      print('added');
      Fluttertoast.showToast(msg: "The record has been successfully created.");
      _titleController.clear();
      _descriptionController.clear();
      getData();
    }
  }

  Future<void> getData() async {
    final respose = await http.get(Uri.parse(baseUrl));
    final json = jsonDecode(respose.body);
    final result = json['items'];
    setState(() {
      data = result;
    });
  }

  Future<void> deleteData(id) async {
    final response = await http.delete(Uri.parse('$baseUrl$id'));
    print(response.statusCode);
    getData();
    Fluttertoast.showToast(msg: "Deleted Successfully");
  }

  Future<void> updateData(id, title, description) async {
    final response = await http.put(Uri.parse('$baseUrl$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "title": title,
          "description": description,
          "is_completed": false
        }));
    if (response.statusCode == 200) {
      print('added');
      Fluttertoast.showToast(
          msg: "The record has been updated successfully created.");
      _updateTitleController.clear();
      _updateDescriptionController.clear();
      Navigator.pop(context);
      getData();
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text('Exam Week 3 Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "title"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "description"),
            ),
            ElevatedButton(
                onPressed: () => postData(
                    _titleController.text, _descriptionController.text),
                child: const Text('add new todo')),
            Expanded(
                child: RefreshIndicator(
              onRefresh: getData,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(data[index]['title']),
                      subtitle: Text(data[index]['description']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          backgroundColor: Colors.grey.shade300,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 250,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    controller:
                                                        _updateTitleController,
                                                    decoration: InputDecoration(
                                                        labelText: "title"),
                                                  ),
                                                  TextField(
                                                    controller:
                                                        _updateDescriptionController,
                                                    decoration: InputDecoration(
                                                        labelText: "description"),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () => updateData(
                                                          data[index]['_id'],
                                                          _updateTitleController
                                                              .text,
                                                          _updateDescriptionController
                                                              .text),
                                                      child: const Text(
                                                          'Update todo')),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(Icons.edit_outlined)),
                            IconButton(
                                onPressed: () => deleteData(data[index]['_id']),
                                icon: Icon(Icons.remove_circle_outline)),
                          ],
                        ),
                      ),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }
}
