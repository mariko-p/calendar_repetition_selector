import '/components/custom_repetition_component/custom_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'custom_repetition_page_widget.dart' show CustomRepetitionPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomRepetitionPageModel
    extends FlutterFlowModel<CustomRepetitionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CustomRepetitionComponent component.
  late CustomRepetitionComponentModel customRepetitionComponentModel;

  @override
  void initState(BuildContext context) {
    customRepetitionComponentModel =
        createModel(context, () => CustomRepetitionComponentModel());
  }

  @override
  void dispose() {
    customRepetitionComponentModel.dispose();
  }
}
