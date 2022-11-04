import '../components/add_repetition_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRepetitionPageWidget extends StatefulWidget {
  const AddRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _AddRepetitionPageWidgetState createState() =>
      _AddRepetitionPageWidgetState();
}

class _AddRepetitionPageWidgetState extends State<AddRepetitionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AddRepetitionComponentWidget(
          ),
        ),
      ),
    );
  }
}
