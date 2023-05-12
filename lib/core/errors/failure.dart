import 'package:dio/dio.dart';

abstract class Failure{
  final String  errMessage;

  Failure(this.errMessage);
}
 class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError){
    switch(dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('connection timeout in ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout in ApiServer');
        
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout in ApiServer');
        
      case DioErrorType.badCertificate:
        return ServerFailure('BadCertificatein ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Your Request is canceled ');

      case DioErrorType.connectionError:
        return ServerFailure('connectionError');

      case DioErrorType.unknown:
        if(dioError.message!.contains('SocketExceptions')){
          return ServerFailure('No Internet Connection');
        }
       return ServerFailure('unexpected Error');
      default:
        return ServerFailure('Opps There was an error, Please try again');

    }
  }
  
  factory ServerFailure.fromResponse(int statusCode, dynamic response){
    if(statusCode==400 || statusCode==401 || statusCode==403){
      return ServerFailure(response['error']['message']);
    }else if(statusCode==404){
      return ServerFailure('Your request not found, please try later');
    }else if(statusCode==500){
      return ServerFailure('Internal Server error, please try later');
    }else{
      return ServerFailure('Opps There was an error, Please try again');
    }
  }
}