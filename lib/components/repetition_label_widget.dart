import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'repetition_label_model.dart';
export 'repetition_label_model.dart';

class RepetitionLabelWidget extends StatefulWidget {
  const RepetitionLabelWidget({
    super.key,
    this.humanReadableText,
  });

  final String? humanReadableText;

  @override
  State<RepetitionLabelWidget> createState() => _RepetitionLabelWidgetState();
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Text(
        widget.humanReadableText!,
        textAlign: TextAlign.start,
        style: GoogleFonts.getFont(
          'Rubik',
          color: FlutterFlowTheme.of(context).secondaryText,
          fontWeight: FontWeight.normal,
          fontSize: 12.0,
          height: 1.5,
        ),
      ),
    );
  }
}
