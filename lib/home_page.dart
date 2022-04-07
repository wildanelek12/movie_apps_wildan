import 'package:flutter/material.dart';
import 'package:movie_apps_wildan/utils/style.dart';


Style style = new Style();
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: style.bg,
      appBar: AppBar(
        backgroundColor: style.bg,
        elevation: 0,
        leading: Icon(
          Icons.list,
          color: style.primary,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CategorySeparator(
                  title: 'New Releases',
                ),
                Text(
                  'Catch the latest movies',
                  style: TextStyle(
                      color: style.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
      
                SizedBox(
                  height: 40,
                ),
                CategorySeparator(
                  title: 'Comedy movies',
                ),
                Text(
                  'Catch the latest movies',
                  style: TextStyle(
                      color: style.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
               
                SizedBox(
                  height: 40,
                ),
                CategorySeparator(
                  title: 'Animated movies',
                ),
                Text(
                  'Catch the latest movies',
                  style: TextStyle(
                      color: style.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
         
              ],
            ),
          ),
        )
        );
    
  }

  
}
class CategorySeparator extends StatelessWidget {
  final String title;

  CategorySeparator({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: style.primary, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          'View all',
          style: TextStyle(
              color: style.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
