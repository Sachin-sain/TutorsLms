
import 'dio/dio.dart';

class BaseNetworkClient {
  get getNetworkClient => WebUtil.createDio();
}
