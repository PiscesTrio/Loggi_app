import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/login_log_vo.dart';
import '../api/page_vo_login_log_vo.dart';
import '../api/page_vo_system_log_vo.dart';
import '../api/system_log_vo.dart';
import '../network/api_client.dart';
import '../network/network_providers.dart';

class LogRepository {
  const LogRepository(this._client);

  final ApiClient _client;

  /// Login attempts, newest first.
  ///
  /// The page envelope is unwrapped here rather than in a screen. Both log screens used to
  /// take `PageVo…` and reach into `.items` themselves, which meant a screen knew that the
  /// endpoint pages — and neither of them offers a second page.
  Future<List<LoginLogVo>> logins({int page = 0, int size = 20}) async {
    final data = await _client.get<dynamic>(
      '/loginlog',
      query: {'page': page, 'size': size},
    );
    return _newestFirst(
      PageVoLoginLogVo.fromJson(data as Map<String, dynamic>).items ?? const [],
      (row) => row.date,
    );
  }

  /// Recorded operations, newest first.
  Future<List<SystemLogVo>> operations({int page = 0, int size = 20}) async {
    final data = await _client.get<dynamic>(
      '/systemlog',
      query: {'page': page, 'size': size},
    );
    return _newestFirst(
      PageVoSystemLogVo.fromJson(data as Map<String, dynamic>).items ?? const [],
      (row) => row.time,
    );
  }

  /// Sorted on a copy, by instant.
  ///
  /// The controllers this replaces sorted by comparing the timestamps as strings, which
  /// worked only because the server happened to send a format that sorts lexicographically.
  /// They are DateTime since S18 and this compares them as such.
  static List<T> _newestFirst<T>(List<T> rows, DateTime? Function(T) at) {
    final sorted = [...rows];
    sorted.sort((a, b) {
      final left = at(a);
      final right = at(b);
      if (left == null && right == null) return 0;
      if (left == null) return 1;
      if (right == null) return -1;
      return right.compareTo(left);
    });
    return sorted;
  }
}

final logRepositoryProvider = Provider<LogRepository>((ref) {
  return LogRepository(ref.watch(apiClientProvider));
});
