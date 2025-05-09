import 'package:dio/dio.dart';
import 'package:todo_application/constants/api_constants.dart';

class ApiCalls {
  //* get method

  getData(
    {
      required String endpoints
    }
  ) async
  {
    try
    {
      final Dio dio = Dio(
      BaseOptions
      (
        baseUrl: ApiConstants.apiBaseUrl,
      ),
    );
    final response = await dio.get(endpoints);
    return response.data;
    } on DioException catch(e)
    {
      throw DioException(requestOptions: e.requestOptions);
    }
  }
}