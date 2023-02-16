import '../components/custom_repetition_component_widget.dart';
import '../components/header_centered_nav_bar_widget.dart';
import '../components/repetition_label_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRepetitionComponentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for HeaderCenteredNavBar component.
  late HeaderCenteredNavBarModel headerCenteredNavBarModel;
  // Model for RepetitionLabel component.
  late RepetitionLabelModel repetitionLabelModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerCenteredNavBarModel =
        createModel(context, () => HeaderCenteredNavBarModel());
    repetitionLabelModel = createModel(context, () => RepetitionLabelModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
