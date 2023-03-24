import '/components/month_day_by_set_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YearBySetCheckerModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for MonthDayBySetChecker component.
  late MonthDayBySetCheckerModel monthDayBySetCheckerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    monthDayBySetCheckerModel =
        createModel(context, () => MonthDayBySetCheckerModel());
  }

  void dispose() {
    monthDayBySetCheckerModel.dispose();
  }

  /// Additional helper methods are added here.

}
