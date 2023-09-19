import '/components/frequency_expander_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/interval_expander_widget.dart';
import '/components/month_day_checker_combined_widget.dart';
import '/components/repetition_label_widget.dart';
import '/components/week_day_checker_widget.dart';
import '/components/year_checker_combined_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRepetitionComponentModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isCustomSelected = false;

  ///  State fields for stateful widgets in this component.

  // Model for HeaderCenteredNavBar component.
  late HeaderCenteredNavBarModel headerCenteredNavBarModel;
  // Model for FrequencyExpander component.
  late FrequencyExpanderModel frequencyExpanderModel;
  // Model for IntervalExpander component.
  late IntervalExpanderModel intervalExpanderModel;
  // Model for WeekDayChecker component.
  late WeekDayCheckerModel weekDayCheckerModel;
  // Model for MonthDayCheckerCombined component.
  late MonthDayCheckerCombinedModel monthDayCheckerCombinedModel;
  // Model for YearCheckerCombined component.
  late YearCheckerCombinedModel yearCheckerCombinedModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Model for RepetitionLabel component.
  late RepetitionLabelModel repetitionLabelModel1;
  // Model for RepetitionLabel component.
  late RepetitionLabelModel repetitionLabelModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerCenteredNavBarModel =
        createModel(context, () => HeaderCenteredNavBarModel());
    frequencyExpanderModel =
        createModel(context, () => FrequencyExpanderModel());
    intervalExpanderModel = createModel(context, () => IntervalExpanderModel());
    weekDayCheckerModel = createModel(context, () => WeekDayCheckerModel());
    monthDayCheckerCombinedModel =
        createModel(context, () => MonthDayCheckerCombinedModel());
    yearCheckerCombinedModel =
        createModel(context, () => YearCheckerCombinedModel());
    repetitionLabelModel1 = createModel(context, () => RepetitionLabelModel());
    repetitionLabelModel2 = createModel(context, () => RepetitionLabelModel());
  }

  void dispose() {
    headerCenteredNavBarModel.dispose();
    frequencyExpanderModel.dispose();
    intervalExpanderModel.dispose();
    weekDayCheckerModel.dispose();
    monthDayCheckerCombinedModel.dispose();
    yearCheckerCombinedModel.dispose();
    repetitionLabelModel1.dispose();
    repetitionLabelModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
}
