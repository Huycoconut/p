import 'package:clean_architector_with_mvvm_getx/data/network/failure.dart';
import 'package:clean_architector_with_mvvm_getx/data/request/request.dart';
import 'package:clean_architector_with_mvvm_getx/domain/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
 Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);

}
