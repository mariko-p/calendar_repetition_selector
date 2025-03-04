import '/components/frequency_cupertino_picker/frequency_cupertino_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'frequency_expander_widget.dart' show FrequencyExpanderWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrequencyExpanderModel extends FlutterFlowModel<FrequencyExpanderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for FrequencyCupertinoPicker component.
  late FrequencyCupertinoPickerModel frequencyCupertinoPickerModel;

  @override
  void initState(BuildContext context) {
    frequencyCupertinoPickerModel =
        createModel(context, () => FrequencyCupertinoPickerModel());
    expandableExpandableController =
        ExpandableController(initialExpanded: false);
  }

  @override
  void dispose() {
    expandableExpandableController.dispose();
    frequencyCupertinoPickerModel.dispose();
  }
}
