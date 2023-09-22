import '/components/custom_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomRepetitionPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CustomRepetitionComponent component.
  late CustomRepetitionComponentModel customRepetitionComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customRepetitionComponentModel =
        createModel(context, () => CustomRepetitionComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customRepetitionComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
