import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepetitionLabelWidget extends StatefulWidget {
  RepetitionLabelWidget({
    Key? key,
    this.humanReadableText,
  }) : super(key: key);

  String? humanReadableText;

  @override
  _RepetitionLabelWidgetState createState() => _RepetitionLabelWidgetState();
}

  class _RepetitionLabelWidgetState extends State<RepetitionLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(35, 5, 15, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            widget.humanReadableText!,
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Rubik',
                  color: Color(0xFF7E8CA2),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
