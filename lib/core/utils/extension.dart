import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../config/app_locale.dart';
import '../bloc/theme/theme_cubit.dart';

extension ConverStringToPersianForamt on String {
  String persian(BuildContext context) {
    ThemeState state = BlocProvider.of<ThemeCubit>(context).state;
    return state.locale == AppLocale.persian ? toPersianDigit() : this;
  }
}

extension ConvertNumToSizeBxo on num {
  SizedBox get height => SizedBox(height: toDouble()) ;
  SizedBox get width => SizedBox(width: toDouble()) ;
}
