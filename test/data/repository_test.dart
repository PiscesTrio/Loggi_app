import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/repository.dart';

/// Characterization test: pins the leftover demo Repository's behavior (groundwork for the "clean up demo modules" slice).
/// Deleting the demo Repository turns this test red — a reminder the removal was deliberate, not accidental.
void main() {
  final repo = Repository();

  test('getComputers 返回固定的三台 Mac（demo 残留，钉死现状）', () async {
    final r = await repo.getComputers;
    expect(r, ['iMac', 'Mac mini', 'Mac Pro']);
  });

  test('getProducts 返回 2 条原始 JSON 字符串（第二条含已知格式 bug，钉死现状）', () async {
    final r = await repo.getProducts;
    expect(r.length, 2);
    // Pinned: entry 2 is invalid JSON — the value after "name": is unquoted (see the assertion below). Demo leftover, for the cleanup slice.
    expect(r[1].contains('A号仓库'), isTrue);
  });
}
