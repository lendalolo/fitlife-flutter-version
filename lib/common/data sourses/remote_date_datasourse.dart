import '../api_servieses.dart';
import '../models/date_model.dart';

abstract class RemoteDateDatasourse{
  Future<LastTImeDataBaseUbdate> getLastTimeUpdated();
}
class RemoteDateDatasourseImpl extends RemoteDateDatasourse{
  final ApiService apiService;
  RemoteDateDatasourseImpl(this.apiService);
  @override
  Future<LastTImeDataBaseUbdate> getLastTimeUpdated() async {
    Map<String, dynamic> result = await  apiService.get(endPoint: 'getLastTimeUpdateDatabase');
   LastTImeDataBaseUbdate date = LastTImeDataBaseUbdate.fromJson(result);
   return date;
  }
}