import '../components/custom_repetition_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRepetitionPageWidget extends StatefulWidget {
  const CustomRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionPageWidgetState createState() =>
      _CustomRepetitionPageWidgetState();
}

class _CustomRepetitionPageWidgetState
    extends State<CustomRepetitionPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var rrule = '';
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomRepetitionComponentWidget(
            rrule: this.rrule,
            onRRuleChanged: (rrule) async {
              print ("RRULE CHANGED: $rrule");
              print ("RRULE INITIAL: ${this.rrule}");
            },
            onSaveTap: (rrule) async {
              print ("RRULE SAVED FROM CUSTOM: $rrule");
              this.rrule = rrule ?? this.rrule;
            },
          ),
        ),
      ),
    );
  }
}
