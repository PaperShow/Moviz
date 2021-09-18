import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:moviz/services/http_services.dart';

class MovieServive {
  final GetIt getIt = GetIt.instance;

  HTTPService? _http;

  MovieServive() {
    _http = getIt.get<HTTPService>();
  }
}
