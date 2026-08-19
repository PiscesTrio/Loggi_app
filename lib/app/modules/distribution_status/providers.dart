import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/distribution_status.dart';
import '../../data/repositories/distribution_repository.dart';

/// The status timeline of one delivery, newest first.
///
/// Keyed by the order's id, so the screen asks for the timeline it needs rather than a
/// controller being told which order it is about after construction. The old version held
/// `Rx<Distribution> distribution` and the view assigned to it from `build`:
///
/// ```dart
/// controller.distribution(argument);   // in build()
/// ```
///
/// with the fetch happening in `onReady` — one frame later, reading
/// `distribution.value.id!`. It worked because the assignment happened to land first, and
/// it would have thrown on the `!` if it ever did not.
final distributionStatusProvider =
    FutureProvider.autoDispose.family<List<DistributionStatus>, String>(
  (ref, distributionId) async {
    final statuses =
        await ref.read(distributionRepositoryProvider).statusOf(distributionId);
    // Newest first. Sorted on a copy: the list came from the repository and sorting in
    // place would reorder whatever else happened to hold it.
    final sorted = [...statuses]
      ..sort((a, b) => (b.time ?? '').compareTo(a.time ?? ''));
    return sorted;
  },
);
