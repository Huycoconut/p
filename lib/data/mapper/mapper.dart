//to convert the response into a non nullable object (null)
import 'package:clean_architector_with_mvvm_getx/app/extensions.dart';
import 'package:clean_architector_with_mvvm_getx/data/responses/responses.dart';
import 'package:clean_architector_with_mvvm_getx/domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id?.orEmpty() ?? EMPTY, this?.name?.orEmpty() ?? EMPTY, this?.numOfNotifications?.orZero() ?? ZERO);
  }
}


extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.email?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY, this?.phone?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(  this!.contacts.toDomain(),this!.customer.toDomain(),);
  }
}