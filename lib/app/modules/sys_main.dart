import '../../l10n/l10n.dart';

import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import 'package:loggi_app/app/data/network/container_access.dart';
import 'package:flutter/material.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/router/routes.dart';
import 'package:loggi_app/app/auth/auth_provider.dart';

class SysMain extends StatelessWidget {
  const SysMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(
            context.l10n.settingsSystemSection,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                onTap: () async {
                  for (int i = 0; i < 10; i++) {
                    await Future.delayed(Duration(seconds: 1)).then((value) {
                      NbRequest().getAllProducts();
                    });
                  }
                },
                title: Text(context.l10n.settingsAccount),
                subtitle: Text(context.l10n.settingsAccountSubtitle),
              ),
              Divider(height: 1, indent: 16),
            ],
          ),
        ),
        ListTile(
          title: Text(
            context.l10n.settingsLogSection,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                onTap: () {
                  context.push(Routes.loginLog);
                },
                title: Text(context.l10n.titleLoginLog),
              ),
              Divider(height: 1, indent: 16),
              ListTile(
                onTap: () {
                  context.push(Routes.operationLog);
                },
                title: Text(context.l10n.titleOperationLog),
              ),
              Divider(height: 1, indent: 16),
            ],
          ),
        ),
        SizedBox(height: 50),
        OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                    context.l10n.settingsSignOutConfirm,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Read before the await: a BuildContext used after one may belong to an
                            // element that is already gone.
                            final signedOut = context.l10n.settingsSignedOut;
                            // Clears the credential, rather than overwriting it with
                            // the string "not logged in" — which stayed on the client
                            // as a header, so the next request went out as
                            // `Authorization: Bearer not logged in`.
                            await appContainer
                                .read(authProvider.notifier)
                                .signOut();
                            showTextToast(signedOut);
                            // offAllNamed, not offAndToNamed: the latter
                            // replaces only the top route, and the home
                            // shell it leaves behind keeps its GetX
                            // controllers alive. Logging back in then
                            // pushed a SECOND shell whose controllers had
                            // already run onInit, so nothing fetched and
                            // the screen came up empty. Clearing the whole
                            // stack disposes the bindings with it.
                            // Redirect takes it from here.
                          },
                          child: Text(context.l10n.actionConfirm),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(context.l10n.actionCancel),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Color.fromARGB(255, 221, 159, 159),
            ),
            foregroundColor: WidgetStatePropertyAll(
              Color.fromARGB(255, 230, 13, 13),
            ),
          ),
          child: Text(
            context.l10n.settingsSignOut,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 20,
              color: ChartPalette.slices[6],
            ),
          ),
        ),
      ],
    );
  }
}
