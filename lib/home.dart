import 'package:flutter/material.dart';
import 'package:quotes/tag.dart';

class HomePage extends StatelessWidget {
  final List<String> catogories = ["Love", "Inspiration", "Life", "Humor"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(children: [
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              "Quotes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        SizedBox(height: 20.0),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: catogories
              .map((category) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TagPage(name: category))),
                    child: Container(
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ))
              .toList(),
        )
      ]),
    ));
  }
}
