import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/core/localization/app_localizations.dart';
import 'package:learen_3/core/localization/extensions.dart';
import 'package:learen_3/features/more/bloc_connec/bloc/connectivity_bloc.dart';
import 'package:learen_3/features/more/bloc_connec/bloc/connectivity_state.dart';
import 'package:learen_3/features/more/bloc_locale/bloc/locale_bloc.dart';
import 'package:learen_3/features/more/bloc_locale/bloc/locale_event.dart';
import 'package:learen_3/features/more/bloc_theme/bloc/theme_bloc.dart';
import 'package:learen_3/features/more/bloc_theme/bloc/theme_event.dart';
import 'package:learen_3/features/more/bloc_theme/bloc/theme_state.dart';

class AppLang extends StatefulWidget {
  const AppLang({super.key});

  @override
  State<AppLang> createState() => _AppLangState();
}

class _AppLangState extends State<AppLang> {
  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(title: Text(tr('settings'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // حالة الاتصال
            BlocBuilder<ConnectivityBloc, ConnectivityState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    state.isConnected ? Icons.wifi : Icons.wifi_off,
                    color: state.isConnected ? Colors.green : Colors.red,
                  ),
                  title: Text(
                    state.isConnected ? tr('connected') : tr('disconnected'),
                  ),
                );
              },
            ),

            const Divider(),

            // زر تغيير الثيم
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  title: Text(tr('dark_mode')),
                  value: state.isDark,
                  onChanged: (_) {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                );
              },
            ),

            const Divider(),

            // اختيار اللغة
            ListTile(
              title: Text(tr('change_language')),
              trailing: DropdownButton<String>(
                value: context.read<LocaleBloc>().state.locale?.languageCode,
                onChanged: (value) {
                  if (value != null) {
                    context.read<LocaleBloc>().add(ChangeLocale(value));
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('العربية'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
