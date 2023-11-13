import '/components/month_day_by_set_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'year_by_set_checker_widget.dart' show YearBySetCheckerWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YearBySetCheckerModel extends FlutterFlowModel<YearBySetCheckerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Model for MonthDayBySetChecker component.
  late MonthDayBySetCheckerModel monthDayBySetCheckerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    monthDayBySetCheckerModel =
        createModel(context, () => MonthDayBySetCheckerModel());
  }

  void dispose() {
    expandableController.dispose();
    monthDayBySetCheckerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
