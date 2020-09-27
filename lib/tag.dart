import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:quotes/quote.dart';

class TagPage extends StatefulWidget {
  final String name;
  TagPage({this.name});
  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  List<Quote> quotes = [];

  getData() async {
    print("Getting data");
    String url = "http://quotes.toscrape.com/tag/${widget.name.toLowerCase()}/";
    var response = await http.get(url);
    dom.Document document = parser.parse(response.body);
    final quoteClass = document.getElementsByClassName("quote");
    setState(() {
      quotes = quoteClass
          .map((e) => Quote(
              text: e.getElementsByClassName("text")[0].innerHtml,
              author: e.getElementsByClassName("author")[0].innerHtml))
          .toList();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30.0),
                child: Text(
                  "${widget.name} quotes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: quotes.length,
                  itemBuilder: (BuildContext context, int index) =>
                      quotes[index].createQuote())
            ],
          ),
        ));
  }
}
