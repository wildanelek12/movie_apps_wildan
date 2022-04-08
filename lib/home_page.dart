import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps_wildan/constants/constants_api.dart';
import 'package:movie_apps_wildan/cubit/animate_cubit.dart';
import 'package:movie_apps_wildan/cubit/comedy_cubit.dart';
import 'package:movie_apps_wildan/cubit/trending_cubit.dart';
import 'package:movie_apps_wildan/model/comedy_response_model.dart';
import 'package:movie_apps_wildan/model/trending_response_model.dart';
import 'package:movie_apps_wildan/utils/style.dart';

Style style = new Style();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrendingCubit? _trendingCubit;
  ComedyCubit? _comedyCubit;
  AnimateCubit? _animateCubit;

  @override
  void initState() {
    _trendingCubit = TrendingCubit();
    _trendingCubit!.getTrending();
    _comedyCubit = ComedyCubit();
    _comedyCubit!.getComedy();
    _animateCubit = AnimateCubit();
    _animateCubit!.getAnimate();
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
          title: Center(child: Text('Movie Apps by Wildan',style: TextStyle( fontWeight: FontWeight.w900,decoration: TextDecoration.underline))),
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
                  title: 'Trending',
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
                BlocBuilder(
                    bloc: _trendingCubit,
                    builder: (context, state) {
                      if (state is InitTrendingState) {
                        return Container(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator());
                      } else if (state is FailedTrendingState) {
                        return Text("Failed");
                      } else {
                        return Container(
                          width: size.width,
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            _trendingCubit!.trendingResponseModel == null
                            ? 0
                                : _trendingCubit!.trendingResponseModel!
                                .results!.length,
                            itemBuilder: (context, index) {
                            Results results = _trendingCubit!
                                .trendingResponseModel!.results![index];
                            {
                              return Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Stack(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        TMDB_BASE_IMAGE_URL +
                                            'original/' +results.backdropPath.toString(),
                                        width: 170,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: style.bg,
                                              borderRadius: BorderRadius
                                                  .circular(20)),
                                          child: Icon(Icons.favorite,
                                              color:
                                              (index % 2) == 0
                                                  ? style.accent
                                                  : style.primary,
                                              size: 15),
                                        )),
                                    Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Text(results.originalTitle.toString(),
                                            style: TextStyle(
                                                color: style.primary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900)))
                                  ]));
                            }}
                            )
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
                BlocBuilder(
                    bloc: _comedyCubit,
                    builder: (context, state) {
                      if (state is InitTrendingState) {
                        return Container(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator());
                      } else if (state is FailedTrendingState) {
                        return Text("Failed");
                      } else {
                        return Container(
                            width: size.width,
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                _comedyCubit!.comedyResponseModel == null
                                    ? 0
                                    : _comedyCubit!.comedyResponseModel!
                                    .results!.length,
                                itemBuilder: (context, index) {
                                  ResultsComedy results = _comedyCubit!
                                      .comedyResponseModel!.results![index];
                                  {
                                    return Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              TMDB_BASE_IMAGE_URL +
                                                  'original/' +results.backdropPath.toString(),
                                              width: 170,
                                              height: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    color: style.bg,
                                                    borderRadius: BorderRadius
                                                        .circular(20)),
                                                child: Icon(Icons.favorite,
                                                    color:
                                                    (index % 2) == 0
                                                        ? style.accent
                                                        : style.primary,
                                                    size: 15),
                                              )),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: Text(results.originalTitle.toString(),
                                                  style: TextStyle(
                                                      color: style.primary,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w900)))
                                        ]));
                                  }}
                            )
                        );
                      }
                    }),
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
                BlocBuilder(
                    bloc: _animateCubit,
                    builder: (context, state) {
                      if (state is InitTrendingState) {
                        return Container(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator());
                      } else if (state is FailedTrendingState) {
                        return Text("Failed");
                      } else {
                        return Container(
                            width: size.width,
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                _animateCubit!.comedyResponseModel == null
                                    ? 0
                                    : _animateCubit!.comedyResponseModel!
                                    .results!.length,
                                itemBuilder: (context, index) {
                                  ResultsComedy results = _animateCubit!
                                      .comedyResponseModel!.results![index];
                                  {
                                    return Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              TMDB_BASE_IMAGE_URL +
                                                  'original/' +results.backdropPath.toString(),
                                              width: 170,
                                              height: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    color: style.bg,
                                                    borderRadius: BorderRadius
                                                        .circular(20)),
                                                child: Icon(Icons.favorite,
                                                    color:
                                                    (index % 2) == 0
                                                        ? style.accent
                                                        : style.primary,
                                                    size: 15),
                                              )),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: Text(results.originalTitle.toString(),
                                                  style: TextStyle(
                                                      color: style.primary,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w900)))
                                        ]));
                                  }}
                            )
                        );
                      }
                    }),
              ],
            ),
          ),
        ));
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

