import 'package:custom_recurring_selectors/main.dart';

import '../components/add_repetition_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRepetitionPageWidget extends StatefulWidget {
  const AddRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _AddRepetitionPageWidgetState createState() =>
      _AddRepetitionPageWidgetState();
}

class _AddRepetitionPageWidgetState extends State<AddRepetitionPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        //Add padding from parent app.
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
      ),
    );
  }
}
