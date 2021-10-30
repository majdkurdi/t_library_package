import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import './http_interceptor.dart';

const String baseUrl = 'http://10.0.2.2:8000/api';

final client = InterceptedClient.build(
  interceptors: [AuthorizationInterceptor()],
);

Future<http.Response> get(String endpoint,
    {Map<String, String>? headers, Map<String, dynamic>? params}) async {
  return await client.get('$baseUrl$endpoint'.toUri(),
      headers: headers, params: params);
}

Future<http.Response> post(String endpoint,
    {Map<String, String>? headers, Object? body}) async {
  print(body);
  print(jsonEncode(body));
  final heads = (headers ?? {})..addAll({"Content-Type": "application/json"});
  final res = await client.post(
    '$baseUrl$endpoint'.toUri(),
    headers: heads,
    body: jsonEncode(body),
  );

  return res;
}

Future<http.Response> delete(String endpoint,
    {Map<String, String>? headers, Object? body}) async {
  return await client.delete('$baseUrl$endpoint'.toUri(),
      headers: headers, body: body);
}

Future<http.Response> patch(String endpoint,
    {Map<String, String>? headers, Object? body}) async {
  return await client.patch('$baseUrl$endpoint'.toUri(),
      headers: headers, body: body);
}

Future<http.Response> put(String endpoint,
    {Map<String, String>? headers, Object? body}) async {
  return await client.put('$baseUrl$endpoint'.toUri(),
      headers: headers, body: body);
}
