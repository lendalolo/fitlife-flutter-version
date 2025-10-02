
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
//192.168.43.243
const imageBaseUrl = 'http://192.168.43.243:8000/';
class ApiService {
  final _baseUrl = 'http://192.168.43.243:8000/api/';
  final Dio _dio;

  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint, String? token}) async {
    var response = await _dio.get('$_baseUrl$endPoint',options: Options(
      headers:{'Accept':'application/json','Content-Type':'application/json','Authorization':'Bearer$token'} ,
        receiveDataWhenStatusError: true,
        sendTimeout:const Duration(minutes:60*1000) , // 60 seconds
        receiveTimeout: const Duration(minutes:60*1000), ) ,);
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint, Map<String,dynamic>? query,String? token,Map<String,dynamic>? data}) async {
    var response = await _dio.post('$_baseUrl$endPoint',queryParameters:query,data:data ,options: Options(
        headers:{'Accept':'application/json','Content-Type':'application/json','Authorization':'Bearer$token'} ,
    receiveDataWhenStatusError: true,
   sendTimeout:const Duration(minutes:  60*1000) , // 60 seconds
    receiveTimeout: const Duration(minutes: 60*1000) ),);// 60 seconds) );
    return response.data;
  }

  Future<Map<String, dynamic>> OutLinkpost({required String endPoint, required Map<String,dynamic> query,String? token}) async {
    var response = await _dio.post('$endPoint',queryParameters:query,options: Options(
        headers:{'Accept':'application/json','Content-Type':'application/json','Authorization':'Bearer$token'} ,
        receiveDataWhenStatusError: true,
        sendTimeout:const Duration(minutes:  60*1000) , // 60 seconds
        receiveTimeout: const Duration(minutes: 60*1000) ),);// 60 seconds) );
    return response.data;
  }
  Future<List<dynamic>> OutLinkget({required String endPoint, String? token}) async {
    var response = await _dio.get(endPoint,options: Options(
      headers:{'Accept':'application/json','Content-Type':'application/json','Authorization':'Bearer$token'} ,
      receiveDataWhenStatusError: true,
      sendTimeout:const Duration(minutes:60*1000) , // 60 seconds
      receiveTimeout: const Duration(minutes:60*1000), ) ,);
    return response.data;
  }
//
// Future<Map<String, dynamic>?> posth({required String endPoint, required Map<String,dynamic> query}) async {
//   var response = await http.post(Uri.parse('$_baseUrl$endPoint'), body: query);
//     var responsebody = await jsonDecode(response.body);
//     return responsebody;}
}