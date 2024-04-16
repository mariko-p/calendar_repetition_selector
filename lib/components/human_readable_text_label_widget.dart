import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'human_readable_text_label_model.dart';
export 'human_readable_text_label_model.dart';

class HumanReadableTextLabelWidget extends StatefulWidget {
  const HumanReadableTextLabelWidget({
    super.key,
    this.rrule,
    required this.defaultLabel,
  });

  final String? rrule;
  final String? defaultLabel;

  @override
  State<HumanReadableTextLabelWidget> createState() =>
      _HumanReadableTextLabelWidgetState();
}

class _HumanReadableTextLabelWidgetState
    extends State<HumanReadableTextLabelWidget> {
  late HumanReadableTextLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HumanReadableTextLabelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.label = functions.getActivityRepetitionAnyAsText(widget.rrule);
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(35.0, 5.0, 15.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Text(
            _model.label != null && _model.label != ''
                ? _model.label!
                : widget.defaultLabel!,
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Rubik',
                  color: Color(0xFF7E8CA2),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
