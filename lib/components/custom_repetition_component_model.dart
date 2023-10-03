import '/components/frequency_expander_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/interval_expander_widget.dart';
import '/components/month_day_checker_combined_widget.dart';
import '/components/repetition_label_widget.dart';
import '/components/week_day_checker_widget.dart';
import '/components/year_checker_combined_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'custom_repetition_component_widget.dart'
    show CustomRepetitionComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomRepetitionComponentModel
    extends FlutterFlowModel<CustomRepetitionComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HeaderCenteredNavBar component.
  late HeaderCenteredNavBarModel headerCenteredNavBarModel;
  // Model for IntervalExpander component.
  late IntervalExpanderModel intervalExpanderModel;
  // Model for RepetitionLabel component.
  late RepetitionLabelModel repetitionLabelModel;
  // Model for WeekDayChecker component.
  late WeekDayCheckerModel weekDayCheckerModel;
  // Model for FrequencyExpander component.
  late FrequencyExpanderModel frequencyExpanderModel;
  // Model for MonthDayCheckerCombined component.
  late MonthDayCheckerCombinedModel monthDayCheckerCombinedModel;
  // Model for YearCheckerCombined component.
  late YearCheckerCombinedModel yearCheckerCombinedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerCenteredNavBarModel =
        createModel(context, () => HeaderCenteredNavBarModel());
    intervalExpanderModel = createModel(context, () => IntervalExpanderModel());
    repetitionLabelModel = createModel(context, () => RepetitionLabelModel());
    weekDayCheckerModel = createModel(context, () => WeekDayCheckerModel());
    frequencyExpanderModel =
        createModel(context, () => FrequencyExpanderModel());
    monthDayCheckerCombinedModel =
        createModel(context, () => MonthDayCheckerCombinedModel());
    yearCheckerCombinedModel =
        createModel(context, () => YearCheckerCombinedModel());
  }

  void dispose() {
    headerCenteredNavBarModel.dispose();
    intervalExpanderModel.dispose();
    repetitionLabelModel.dispose();
    weekDayCheckerModel.dispose();
    frequencyExpanderModel.dispose();
    monthDayCheckerCombinedModel.dispose();
    yearCheckerCombinedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
