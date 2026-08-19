import '../../../l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/api_exception.dart';
import '../../theme/color_palette.dart';

/// Renders the three states a request can be in, so each screen does not invent its own.
///
/// The screens this replaces used `controller.obx(builder)` — one builder, for the success
/// case. Loading fell back to whatever GetX draws, and error was unreachable because the
/// controllers reported success even when the request had failed. What a user saw when the
/// server refused was an empty list, and what a developer saw was a `debugPrint` that never
/// reaches a device.
///
/// The error state shows the server's own message. That message survives the trip now: the
/// interceptor reads it from the envelope's `msg`, and the repository lets the exception
/// through instead of folding it into null.
class AsyncView<T> extends StatelessWidget {
  const AsyncView({
    super.key,
    required this.value,
    required this.builder,
    this.onRetry,
    this.emptyMessage,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  final VoidCallback? onRetry;

  /// Shown when the payload is an empty list. Distinguishing "nothing here" from "the
  /// request failed" is the whole point; leaving it null renders the list builder instead.
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _ErrorState(error: error, onRetry: onRetry),
      data: (data) {
        if (emptyMessage != null && data is List && data.isEmpty) {
          return _Message(text: emptyMessage!, icon: Icons.inbox_outlined);
        }
        return builder(data);
      },
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.error, this.onRetry});

  final Object error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    // ApiException carries what the server said. Anything else is a bug in the app, and
    // showing its toString to a user helps nobody.
    final message = error is ApiException
        ? (error as ApiException).message
        : context.l10n.errorGeneric;
    return _Message(
      text: message,
      icon: Icons.error_outline,
      action: onRetry == null
          ? null
          : TextButton(onPressed: onRetry, child: const Text('重试')),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.text, required this.icon, this.action});

  final String text;
  final IconData icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    // A ListView, not a Column: RefreshIndicator needs a scrollable child to accept a pull,
    // and an error state you cannot pull to retry is a dead end on a touch screen.
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        Icon(
          icon,
          size: 48,
          color: ColorPalette.nileBlue.withValues(alpha: 0.4),
        ),
        const SizedBox(height: 12),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: ColorPalette.nileBlue,
              ),
            ),
          ),
        ),
        if (action != null) Center(child: action!),
      ],
    );
  }
}
