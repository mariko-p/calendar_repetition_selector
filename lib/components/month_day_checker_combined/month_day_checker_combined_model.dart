import '/components/month_day_by_set_checker/month_day_by_set_checker_widget.dart';
import '/components/month_day_checker/month_day_checker_widget.dart';
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

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for MonthDayChecker component.
  late MonthDayCheckerModel monthDayCheckerModel;
  // Model for MonthDayBySetChecker component.
  late MonthDayBySetCheckerModel monthDayBySetCheckerModel;

  @override
  void initState(BuildContext context) {
    monthDayCheckerModel = createModel(context, () => MonthDayCheckerModel());
    monthDayBySetCheckerModel =
        createModel(context, () => MonthDayBySetCheckerModel());
  }

  @override
  void dispose() {
    expandableExpandableController.dispose();
    monthDayCheckerModel.dispose();
    monthDayBySetCheckerModel.dispose();
  }
}
