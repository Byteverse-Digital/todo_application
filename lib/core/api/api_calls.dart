import 'package:dio/dio.dart';
import 'package:todo_application/constants/api_constants.dart';
import 'package:todo_application/core/api/dio_exception.dart';

class ApiCalls {
  //* get method

  getData({required String endpoints}) async {
    try {
      final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl));
      final response = await dio.get(endpoints);
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }
  // send data
  sendData(
      {required String endpoints, required Map<String, dynamic> data}) async {
    try {
      final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl));
      final response = await dio.post(endpoints, data: data);
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }
}
