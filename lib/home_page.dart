import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps_wildan/cubit/trending_cubit.dart';
import 'package:movie_apps_wildan/model/trending_response_model.dart';
import 'package:movie_apps_wildan/utils/style.dart';


Style style = new Style();
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrendingCubit? _trendingCubit;

  @override
  void initState() {
    _trendingCubit = TrendingCubit();
    _trendingCubit!.getTrending();
    super.initState();
  }
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
              mainAxisSize: MainAxisSize.max,
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
                  height: 60,
                ),
                BlocBuilder(
                    bloc: _trendingCubit,
                    builder: (context, state) {
                  if(state is InitTrendingState){
                    return Container(height : 100,width: 100,child: CircularProgressIndicator());
                  }else if(state is FailedTrendingState){
                    return Text("Failed");
                  }else{
                    return Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _trendingCubit!.trendingResponseModel == null ? 0 :_trendingCubit!.trendingResponseModel!.results!.length,
                          itemBuilder: (context, index) {
                            Results results = _trendingCubit!.trendingResponseModel!.results![index];
                        return Container(
                          child: Text(results.originalTitle??"Judul tidak diketahui",style: TextStyle(color: Colors.white),),
                        );

                      }),
                    );
                  }
                }),
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
                 //list nantinya
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
           //list nantinya
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
