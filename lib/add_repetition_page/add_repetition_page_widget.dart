import '../main.dart';
import '/components/add_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_repetition_page_model.dart';
export 'add_repetition_page_model.dart';

class AddRepetitionPageWidget extends StatefulWidget {
  const AddRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _AddRepetitionPageWidgetState createState() =>
      _AddRepetitionPageWidgetState();
}

class _AddRepetitionPageWidgetState extends State<AddRepetitionPageWidget> {
  late AddRepetitionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddRepetitionPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        //Add padding from parent app.
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: wrapWithModel(
          child: AddRepetitionComponentWidget(
            rrule: FFAppState().vCurrentRRule,
            onRRuleChanged: (value) async {
              MyApp.onRRuleChanged?.call(value);
            },
            onSaveTapFromAddPage: (rrule) async {
              MyApp.onSaveTapFromAddPage?.call(rrule);
            },
            onCancelTapFromAddPage: () async {
              MyApp.onCancelTapFromAddPage?.call();
            },
            onSaveTapFromCustomPage: (rrule) async {
              MyApp.onSaveTapFromCustomPage?.call(rrule);
            },
          ),
          model: _model.addRepetitionComponentModel,
          updateCallback: (() => setState(() {})),
        ),
      ),
    );
  }
}
