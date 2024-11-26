import 'package:clean_architector_with_mvvm_getx/data/network/app_api.dart';
import 'package:clean_architector_with_mvvm_getx/data/request/request.dart';
import 'package:clean_architector_with_mvvm_getx/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password, loginRequest.imei, loginRequest.deviceType);
  }
}
