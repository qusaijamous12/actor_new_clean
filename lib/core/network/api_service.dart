import 'package:dio/dio.dart';

abstract class ApiService{

  Future<Response> get ({required final String path,final Map<String,dynamic>? query});

  Future<Response> post ({required final String path,final Map<String,dynamic>? query,data});


}