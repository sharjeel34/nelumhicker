import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/New/show_booksStudents.dart';
import 'package:nelumhicker/Roles/Admin.dart';

class add_book_info extends StatefulWidget {
  const add_book_info({super.key});

  @override
  State<add_book_info> createState() => _add_book_infoState();
}

class _add_book_infoState extends State<add_book_info> {
  var id_Controller = new TextEditingController();
  var Title_Controller = new TextEditingController();
  var AuthorController = new TextEditingController();
  // final DatabaseReference databaseRef = FirebaseDatabase.instance
  //     .ref(); // Define the database reference
  DatabaseReference booksRef = FirebaseDatabase.instance.ref().child('books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Book Information"),
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Controller(id: 'admin'),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Add Book information'),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text('Enter Book ID'),
                    SizedBox(height: 10,),
                    TextField(
                      controller: id_Controller,
                      decoration: InputDecoration(
                        hintText: 'Book ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Enter Book Title'),
                    SizedBox(height: 10,),
                    TextField(
                      controller: Title_Controller,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Enter Book Author Name'),
                    SizedBox(height: 10,),
                    TextField(
                      controller: AuthorController,
                      decoration: InputDecoration(
                        hintText: 'Book Author',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        if (id_Controller.text.isNotEmpty &&
                            Title_Controller.text.isNotEmpty &&
                            AuthorController.text.isNotEmpty) {
                          insert_Data(
                            id_Controller.text,
                            Title_Controller.text,
                            AuthorController.text,
                          );
                        }
                      },
                      child: Text('Add Book'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowData()),
                        );
                      },
                      child: Text('Go to Student Page'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void insert_Data(String id, String Title, String Author) {
    // Specify the correct database path where you want to store the data
    // Replace 'books' with your desired database path
 //   DatabaseReference booksRef = databaseRef.child('books');
    print('Saving data to Firebase');
    booksRef.push().set({
      'id': id,
      'Title': Title,
      'Author': Author,
    }).then((_) {
      print(Title);
      print('Data saved successfully');
      id_Controller.clear();
      Title_Controller.clear();
      AuthorController.clear();
    }).catchError((error) {
      print('Error saving data: $error');
    });
    // print('Saving data to Firebase');
    // // Push data to generate a unique key for each entry
    // booksRef.push().set({
    //   'id': id,
    //   'Title': Title,
    //   'Author': Author,
    // });
    //
    // // Clear the text fields after data is saved
    // id_Controller.clear();
    // Title_Controller.clear();
    // AuthorController.clear();
  }


}
