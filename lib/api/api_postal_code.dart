import 'package:dio/dio.dart';

getAddressFromApi(String postalCode) async {

  final String endpoint =
      'http://viacep.com.br/ws/74340290/json/';

  final Response response  = await Dio().get<Map>(endpoint);

  print(response.data);

}