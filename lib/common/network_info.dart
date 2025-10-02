import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get internetConnection;
}

class NetworkInfoImpl extends NetworkInfo{
  final InternetConnectionChecker isConnected;
  NetworkInfoImpl(this.isConnected);
  @override
  Future<bool> get internetConnection => isConnected.hasConnection;

}