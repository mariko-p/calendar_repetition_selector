import '/components/month_day_by_set_checker_widget.dart';
import '/components/month_day_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'month_day_checker_combined_widget.dart'
    show MonthDayCheckerCombinedWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MonthDayCheckerCombinedModel
    extends FlutterFlowModel<MonthDayCheckerCombinedWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MonthDayChecker component.
  late MonthDayCheckerModel monthDayCheckerModel;
  // Model for MonthDayBySetChecker component.
  late MonthDayBySetCheckerModel monthDayBySetCheckerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    monthDayCheckerModel = createModel(context, () => MonthDayCheckerModel());
    monthDayBySetCheckerModel =
        createModel(context, () => MonthDayBySetCheckerModel());
  }

  void dispose() {
    monthDayCheckerModel.dispose();
    monthDayBySetCheckerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
