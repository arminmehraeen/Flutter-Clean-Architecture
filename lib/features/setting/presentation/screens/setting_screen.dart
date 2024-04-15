import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:flutter_clean_architecture/core/widgets/default_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/bloc/theme/theme_cubit.dart';
import '../../../../core/utils/app_helper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(label: "تنظیمات") ,
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () => context.read<ThemeCubit>().changeLocale() ,
              title: const Text("زبان برنامه") ,
              subtitle: Text(convertLocaleStateToString(context.read<ThemeCubit>().state.locale)),
              leading: const Icon(Icons.language),
            ) ,
            ListTile(
              onTap: () => context.read<ThemeCubit>().changeTheme() ,
              title: const Text("پوسته برنامه") ,
              subtitle: Text(convertThemeStateToString(context.read<ThemeCubit>().state.themeMode)),
              leading: const Icon(Icons.color_lens_outlined),
            ) ,
          ],
        ),
      )
    );
  }
}
