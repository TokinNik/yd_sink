import 'package:equatable/equatable.dart';

abstract class UseCase<RequestType, ReturnType> {
  Future<ReturnType> call(RequestType params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
