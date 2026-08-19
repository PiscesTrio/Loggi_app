import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/data/api/login_log_vo.dart';
import '../../app/data/api/system_log_vo.dart';
import '../../app/data/repositories/log_repository.dart';

/// Login attempts.
class LoginLogNotifier extends AsyncNotifier<List<LoginLogVo>> {
  @override
  Future<List<LoginLogVo>> build() => ref.read(logRepositoryProvider).logins();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(logRepositoryProvider).logins(),
    );
  }
}

final loginLogProvider =
    AsyncNotifierProvider<LoginLogNotifier, List<LoginLogVo>>(
      LoginLogNotifier.new,
    );

/// Recorded operations.
class OperationLogNotifier extends AsyncNotifier<List<SystemLogVo>> {
  @override
  Future<List<SystemLogVo>> build() =>
      ref.read(logRepositoryProvider).operations();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(logRepositoryProvider).operations(),
    );
  }
}

final operationLogProvider =
    AsyncNotifierProvider<OperationLogNotifier, List<SystemLogVo>>(
      OperationLogNotifier.new,
    );
