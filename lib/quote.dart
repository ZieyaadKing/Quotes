import 'package:flutter/material.dart';

class Quote {

  String text;
  String author;

  Quote({this.text, this.author});

  String toString() => "$text - $author";

  Widget createQuote() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Column(
            children: [
            Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0),
            Text(author, style: TextStyle(fontSize: 13))
          ]),
        ),
      ),
    );
  }
}