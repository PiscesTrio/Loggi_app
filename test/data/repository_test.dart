import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/repository.dart';

/// 特征测试：钉死 demo 残留 Repository 的现状（为后续“清理 demo 模块”Slice 铺路）。
/// 删除该文件时本测试会变红 —— 提醒开发者“是我有意删的”，而非误删。
void main() {
  final repo = Repository();

  test('getComputers 返回固定的三台 Mac（demo 残留，钉死现状）', () async {
    final r = await repo.getComputers;
    expect(r, ['iMac', 'Mac mini', 'Mac Pro']);
  });

  test('getProducts 返回 2 条原始 JSON 字符串（第二条含已知格式 bug，钉死现状）', () async {
    final r = await repo.getProducts;
    expect(r.length, 2);
    // 钉死：第二条是非法 JSON（"name":A号仓库 缺引号）—— demo 残留，待清理 Slice 处理
    expect(r[1].contains('A号仓库'), isTrue);
  });
}
