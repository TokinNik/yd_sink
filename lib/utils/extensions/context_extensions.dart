import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/presentation/app/themes/theme.dart';

extension ContextExtensions on BuildContext {
  T bloc<T extends StateStreamableSource<Object?>>() {
    return BlocProvider.of<T>(this);
  }

  CustomTheme get colors {
    return Theme.of(this).extension<CustomTheme>()!;
  }
}
