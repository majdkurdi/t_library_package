import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_interceptor/http_interceptor.dart';
import '../notifiers/auth_notifier.dart';

final authProvider = Provider<AuthNotifier>((ref) => AuthNotifier());

class AuthorizationInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      final token = AuthNotifier().token;
      data.headers.addAll({'Authorization': 'Bearer $token'});
    } on Exception catch (e) {
      print(e);
    }
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
