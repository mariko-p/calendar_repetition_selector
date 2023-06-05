import '/components/custom_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_repetition_page_model.dart';
export 'custom_repetition_page_model.dart';

class CustomRepetitionPageWidget extends StatefulWidget {
  const CustomRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionPageWidgetState createState() =>
      _CustomRepetitionPageWidgetState();
}

class _CustomRepetitionPageWidgetState
    extends State<CustomRepetitionPageWidget> {
  late CustomRepetitionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var rrule = '';
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomRepetitionPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            child: CustomRepetitionComponentWidget(
              rrule: this.rrule,
              onRRuleChanged: (rrule) async {
                print("RRULE CHANGED: $rrule");
                print("RRULE INITIAL: ${this.rrule}");
              },
              onSaveTap: (rrule) async {
                print("RRULE SAVED FROM CUSTOM: $rrule");
                this.rrule = rrule ?? this.rrule;
              },
            ),
            model: _model.customRepetitionComponentModel,
            updateCallback: () => setState(() {}),
          ),
        ),
      ),
    );
  }
}
