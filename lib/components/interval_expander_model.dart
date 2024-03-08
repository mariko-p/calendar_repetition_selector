import '/components/interval_cupertino_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'interval_expander_widget.dart' show IntervalExpanderWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IntervalExpanderModel extends FlutterFlowModel<IntervalExpanderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Model for IntervalCupertinoPicker component.
  late IntervalCupertinoPickerModel intervalCupertinoPickerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    intervalCupertinoPickerModel =
        createModel(context, () => IntervalCupertinoPickerModel());
  }

  @override
  void dispose() {
    expandableController.dispose();
    intervalCupertinoPickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
