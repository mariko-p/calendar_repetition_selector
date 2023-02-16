import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'repetition_label_model.dart';
export 'repetition_label_model.dart';

class RepetitionLabelWidget extends StatefulWidget {
  const RepetitionLabelWidget({
    Key? key,
    this.humanReadableText,
  }) : super(key: key);

  final String? humanReadableText;

  @override
  _RepetitionLabelWidgetState createState() => _RepetitionLabelWidgetState();
}

class _RepetitionLabelWidgetState extends State<RepetitionLabelWidget> {
  late RepetitionLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepetitionLabelModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
