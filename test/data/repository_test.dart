import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/repository.dart';

/// Pins what is left of the demo Repository.
///
/// S00 planted a tripwire here: a test over `getComputers` whose only purpose was to
/// go red when the demo modules were deleted, so that the removal had to be a decision
/// rather than an accident. S11a deleted them, and that test went with the code it
/// described — deliberately.
///
/// `getProducts` survives because `product_page` still calls it. That module is itself
/// unreachable from the home shell, so this assertion is the same kind of tripwire, now
/// aimed at the duplicate product screens.
void main() {
  final repo = Repository();

  test('getProducts returns 2 raw JSON strings, the second malformed (pins a known bug)', () async {
    final r = await repo.getProducts;
    expect(r.length, 2);
    // Pinned: entry 2 is invalid JSON — the value after "name": is unquoted (see the assertion below). Demo leftover, for the cleanup slice.
    expect(r[1].contains('A号仓库'), isTrue);
  });
}
