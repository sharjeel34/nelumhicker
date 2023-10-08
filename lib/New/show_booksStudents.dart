import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/loginnew.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  Query Dbref = FirebaseDatabase.instance.ref().child('books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Books'),
      ),

      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: MediaQuery.of(context).size.width,height: 100,decoration: BoxDecoration(

              image: DecorationImage(fit: BoxFit.contain,image: AssetImage('assets/image/lib.jpg'))
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Smart Library', // Add your library information here
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: FirebaseAnimatedList(
              query: Dbref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                Map book = snapshot.value as Map;
                book['key'] = snapshot.key;
                return listItem(book: book);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem({required Map book}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book ID: ${book['id']}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Title: ${book['Title']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Author: ${book['Author']}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
