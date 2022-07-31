import 'package:flutter/material.dart';
import 'package:movie_apps_wildan/helper/base_config.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        color: secondaryColor,
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  image: NetworkImage(
                      'https://wallpaperaccess.com/full/1672447.jpg'),
                ),
                Positioned(
                    bottom: -60.0,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/a-/AOh14GjstphJIFJdz61QNgbR1BCLhflKBHhwjeCwOFXX4A=s288-p-rw-no'),
                    ))
              ],
            ),
            SizedBox(
              height: 60,
            ),
            ListTile(
              title: Center(
                  child: Text(
                "Muhammad Wildan Romiza",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              subtitle: Center(
                  child: Text("Native Developer",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal))),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.mail,
                color: Colors.black,
              ),
              label: Text(
                "Hire me",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            ListTile(
              title: Text(
                "About me",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "hi I am wildan, I am from malang city ajwa east, I am happy to make a simple application using java native",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
