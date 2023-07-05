import 'package:flutter/widgets.dart';

double getSafePaddingTop() {
  var view = WidgetsBinding.instance.platformDispatcher.views.first;
  var paddingTop = MediaQueryData.fromView(view).padding.top;
  return paddingTop;
}
