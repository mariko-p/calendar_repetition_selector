import '/components/add_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_repetition_page_widget.dart' show AddRepetitionPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRepetitionPageModel extends FlutterFlowModel<AddRepetitionPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AddRepetitionComponent component.
  late AddRepetitionComponentModel addRepetitionComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addRepetitionComponentModel =
        createModel(context, () => AddRepetitionComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    addRepetitionComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
