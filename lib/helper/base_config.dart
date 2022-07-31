import 'package:flutter/material.dart';

const white = Color(0xFFfafafa);
const primaryColor = Color(0xFFda1a37);
const secondaryColor = Color(0xFF1a1a2c);
class Config{
static movieDetailUrl(int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId?api_key=79bde1fdca47c096ddc9f3ce1356f832&append_to_response=images';
}
