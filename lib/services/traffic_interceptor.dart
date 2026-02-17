import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoiMG1pZWRvIiwiYSI6ImNsd3FzN3c4NjA1NmoyanB4cnNxeHUxM3IifQ.4KUXyoSzoh7anI71dkdeRw';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geomtries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'acces_token': accessToken
    });
    super.onRequest(options, handler);
  }
}
