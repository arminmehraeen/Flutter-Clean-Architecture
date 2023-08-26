import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/bloc/app/app_cubit.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/screens/todos_screen.dart';

import 'app_theme.dart';
import 'custom_scroll_behavior.dart';
import 'locator.dart';

class AppMain extends StatelessWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AppCubit>()),
        BlocProvider(create: (_) => locator<TodoBloc>()),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          context.setLocale(state.locale);
          return MaterialApp(
              key: state.isRefreshApp ? UniqueKey() : null,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: "App Title",
              scrollBehavior: CustomScrollBehavior().copyWith(scrollbars: false),
              darkTheme: AppTheme.dark,
              theme: AppTheme.light,
              themeMode: state.themeMode,
              home: const TodosScreen());
        },
      ),
    );
  }
}
