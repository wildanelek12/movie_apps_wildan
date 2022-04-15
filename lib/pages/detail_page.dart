import 'package:flutter/material.dart';
import 'package:movie_apps_wildan/utils/style.dart';

Style style = new Style();

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: style.bg,
        appBar: AppBar(
          backgroundColor: style.bg,
          elevation: 0,
          title: Center(
              child: Text('Judul FIlm',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ))),
          leading: Icon(
            Icons.list,
            color: style.primary,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          width: size.width,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                      'https://www.wowkeren.com/images/events/ori/2013/07/03/despicable-me-2-13.jpg',
                      height: 300,
                      width: 200),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Column(
                      children: [
                        Icon(
                          Icons.movie,
                          color: style.primary,
                        ),
                        SizedBox(height: 10),
                        Text('Genre'),
                        SizedBox(height: 10),
                        Text('Comedy'),
                      ],
                    ),
                  ),
                  Text('asdsa'),
                  Text('asdsa'),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
