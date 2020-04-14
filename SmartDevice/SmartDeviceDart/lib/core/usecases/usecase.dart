import 'package:SmartDeviceDart/core/error/failures.dart';
import 'package:SmartDeviceDart/features/smart_device/application/usecases/smart_device_objects_usecase/abstracts_devices/smart_device_base_abstract.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class ReturnSmartDeviceObject extends UseCase {
  @override
  Future<Either<Failure, SmartDeviceBaseAbstract>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }


}