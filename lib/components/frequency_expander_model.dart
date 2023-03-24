import '/components/frequency_cupertino_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrequencyExpanderModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for FrequencyCupertinoPicker component.
  late FrequencyCupertinoPickerModel frequencyCupertinoPickerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    frequencyCupertinoPickerModel =
        createModel(context, () => FrequencyCupertinoPickerModel());
  }

  void dispose() {
    frequencyCupertinoPickerModel.dispose();
  }

  /// Additional helper methods are added here.

}
