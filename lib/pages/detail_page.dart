import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps_wildan/cubit/detail_cubit.dart';
import 'package:movie_apps_wildan/helper/base_config.dart';
import 'package:movie_apps_wildan/model/detail_response_model.dart';

import '../constants/constants_api.dart';

class DetailMoviePage extends StatefulWidget {
  int id_detail_movie;

  DetailMoviePage({Key? key, required this.id_detail_movie}) : super(key: key);
  @override
  _DetailMoviePageState createState() =>
      _DetailMoviePageState(id_movie: id_detail_movie);
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  int id_movie;
  _DetailMoviePageState({required this.id_movie});
  DetailCubit? _detailCubit;
  @override
  void initState() {
    _detailCubit = DetailCubit();
    _detailCubit!.getDetail(id_movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Detail Movie",
          style: TextStyle(
            color: white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: secondaryColor,
      extendBodyBehindAppBar: true,
      body: BlocBuilder(
        bloc: _detailCubit,
        builder: (context, state) {
          if (state is DetailInitial) {
            return Center(
              child: Container(
                  height: 100, width: 100, child: CircularProgressIndicator()),
            );
          } else if (state is DetailFailed) {
            return Text("Failed");
          } else {
            DetailResponseModel detailResponseModel = _detailCubit!.detailResponseModel!;
            return SingleChildScrollView(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                           TMDB_BASE_IMAGE_URL +
                                                  'original/' +
                                                  detailResponseModel.backdropPath
                                                      .toString(),
                                          
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            secondaryColor,
                            secondaryColor.withOpacity(0.8),
                            secondaryColor.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailResponseModel.originalTitle!,
                              style: TextStyle(
                                color: white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${detailResponseModel.releaseDate},  ${detailResponseModel.runtime} Minute",
                              style: TextStyle(
                                color: white.withOpacity(0.7),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  detailResponseModel.voteAverage.toString(),
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(width: 5),
                                ...List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: (index <
                                            (detailResponseModel.voteAverage! / 2.0).floor())
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Overview",
                      style: TextStyle(
                        color: white.withOpacity(0.7),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      detailResponseModel.overview.toString(),
                      style: TextStyle(
                        color: white.withOpacity(0.7),
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
