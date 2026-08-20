import 'package:flutter/widgets.dart';

import '../../app/data/network/api_exception.dart';
import '../../l10n/l10n.dart';

/// What to tell the reader about a failed request, in their language.
///
/// This is the last piece of the same move the server made in A3 and the database made in V9:
/// the layer that knows *what* went wrong stops deciding *how to say it*. The network layer has
/// no BuildContext and therefore cannot know which of three languages to use — so it hands up
/// an identifier and this decides the words.
///
/// The order below is the whole design. A server that knows about a case wins; then the app's
/// own classification of a failure that never reached one; then the server's own sentence, in
/// whatever language it wrote it, for a code this build has not heard of; then a generic line.
/// Each step down is a step in how much is actually known.
String apiErrorMessage(BuildContext context, Object error) {
  final l10n = context.l10n;
  if (error is! ApiException) {
    // A bug in the app rather than a failure of the request. Its toString helps nobody.
    return l10n.errorGeneric;
  }

  final byCode = error.errorCode == null
      ? null
      : _byCode(context, error.errorCode!);
  if (byCode != null) return byCode;

  final byFailure = switch (error.failure) {
    ApiFailure.timeout => l10n.errorTimeout,
    ApiFailure.offline => l10n.errorOffline,
    ApiFailure.cancelled => l10n.errorCancelled,
    ApiFailure.badCertificate => l10n.errorBadCertificate,
    ApiFailure.unreadableResponse => l10n.errorUnreadableResponse,
    ApiFailure.unknown || null => null,
  };
  if (byFailure != null) return byFailure;

  // A code newer than this build. The server's own words are not in the reader's language,
  // and they are still better than "something went wrong" — they name the thing.
  final message = error.message;
  if (message != null && message.isNotEmpty) return message;

  return l10n.errorGeneric;
}

/// Null for a code this build does not know, so the caller can fall further back.
String? _byCode(BuildContext context, String code) {
  final l10n = context.l10n;
  return switch (code) {
    'WAREHOUSE_NOT_FOUND' => l10n.errorWarehouseNotFound,
    'DRIVER_NOT_FOUND' => l10n.errorDriverNotFound,
    'VEHICLE_NOT_FOUND' => l10n.errorVehicleNotFound,
    'DISTRIBUTION_NOT_FOUND' => l10n.errorDistributionNotFound,
    'COMMODITY_NOT_IN_WAREHOUSE' => l10n.errorCommodityNotInWarehouse,
    'COMMODITY_NOT_FOUND' => l10n.errorCommodityNotFound,
    'NOT_FOUND' => l10n.errorNotFound,
    'DRIVER_UNAVAILABLE' => l10n.errorDriverUnavailable,
    'VEHICLE_UNAVAILABLE' => l10n.errorVehicleUnavailable,
    'INSUFFICIENT_STOCK' => l10n.errorInsufficientStock,
    'ALREADY_EXISTS' => l10n.errorAlreadyExists,
    'QUANTITY_NOT_POSITIVE' => l10n.errorQuantityNotPositive,
    'VALIDATION_FAILED' => l10n.errorValidationFailed,
    'MALFORMED_REQUEST' => l10n.errorMalformedRequest,
    'BAD_REQUEST' => l10n.errorBadRequest,
    'CODE_REQUESTED_TOO_SOON' => l10n.errorCodeRequestedTooSoon,
    'CODE_ATTEMPTS_EXHAUSTED' => l10n.errorCodeAttemptsExhausted,
    'CODE_DELIVERY_FAILED' => l10n.errorCodeDeliveryFailed,
    // Shown only if the sign-out redirect somehow does not happen first; the client treats
    // a 401 as "the session is over" and leaves the screen before reading this.
    'AUTHENTICATION_REQUIRED' => l10n.errorAuthenticationRequired,
    'TOKEN_INVALID' => l10n.errorTokenInvalid,
    'ACCESS_DENIED' => l10n.errorAccessDenied,
    'METHOD_NOT_ALLOWED' => l10n.errorMethodNotAllowed,
    'INTERNAL_ERROR' => l10n.errorInternal,
    _ => null,
  };
}
