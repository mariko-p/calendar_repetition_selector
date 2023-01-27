import '../components/add_repetition_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: AddRepetitionComponentWidget(),
        ),
      ),
    );
  }
}
