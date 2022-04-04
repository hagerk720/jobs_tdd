import 'package:dartz/dartz.dart';

import 'package:jobs_tdd/features/apply/data/data_source/apply_data_source.dart';
import 'package:jobs_tdd/features/apply/domain/entities/apply_info.dart';

import '../../../../cores/errors/exceptions.dart';
import '../../../../cores/errors/failure.dart';
import '../../domain/repository/apply_repository.dart';


class ApplyRepositoryImp implements ApplyRepository {
  ApplyDataSource dataSource; 
  ApplyRepositoryImp({
    required this.dataSource,
  });
  
  @override
  Future<Either<Failure, String>> apply(ApplyInfo applyInfo) async {
    try {
      final data = await dataSource.apply(applyInfo.toModel(applyInfo));
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
