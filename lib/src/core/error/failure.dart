import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final List<dynamic> _properties;

  const Failure([this._properties = const []]);

  @override
  List<Object?> get props => _properties;

}

class ServerFailure extends Failure {}

class PlatformFailure extends Failure {}

class GenericFailure extends Failure {}