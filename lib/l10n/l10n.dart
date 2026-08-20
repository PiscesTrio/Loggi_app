import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

/// `context.l10n.navBase` instead of `AppLocalizations.of(context).navBase`.
///
/// The generated accessor is verbose enough that call sites reach for a literal instead,
/// which is how a codebase ends up with an i18n pipeline and 145 hardcoded strings.
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
