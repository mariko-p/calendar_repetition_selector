import '/components/month_checker_widget.dart';
import '/components/year_by_set_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'year_checker_combined_widget.dart' show YearCheckerCombinedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YearCheckerCombinedModel
    extends FlutterFlowModel<YearCheckerCombinedWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MonthChecker component.
  late MonthCheckerModel monthCheckerModel;
  // Model for YearBySetChecker component.
  late YearBySetCheckerModel yearBySetCheckerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    monthCheckerModel = createModel(context, () => MonthCheckerModel());
    yearBySetCheckerModel = createModel(context, () => YearBySetCheckerModel());
  }

  void dispose() {
    monthCheckerModel.dispose();
    yearBySetCheckerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
