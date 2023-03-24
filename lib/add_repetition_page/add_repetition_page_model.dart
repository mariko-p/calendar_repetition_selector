import '/components/add_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRepetitionPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for AddRepetitionComponent component.
  late AddRepetitionComponentModel addRepetitionComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addRepetitionComponentModel =
        createModel(context, () => AddRepetitionComponentModel());
  }

  void dispose() {
    addRepetitionComponentModel.dispose();
  }

  /// Additional helper methods are added here.

}
