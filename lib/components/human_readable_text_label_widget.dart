import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'human_readable_text_label_model.dart';
export 'human_readable_text_label_model.dart';

class HumanReadableTextLabelWidget extends StatefulWidget {
  const HumanReadableTextLabelWidget({
    Key? key,
    this.rrule,
    required this.defaultLabel,
    // LOCAL_START
    this.style,
    // LOCAL_END
  }) : super(key: key);

  final String? rrule;
  final String? defaultLabel;
  // LOCAL_START
  final TextStyle? style;
  // LOCAL_END

  @override
  _HumanReadableTextLabelWidgetState createState() =>
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
      // LOCAL_START
      final repetitionHumanReadableText =
          await functions.getActivityRepetitionAnyAsText(context, widget.rrule);
      setState(() {
        _model.label = repetitionHumanReadableText;
      });
      // LOCAL_END
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(35.0, 5.0, 15.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Text(
            _model.label != null && _model.label != ''
                ? _model.label!
                : widget.defaultLabel!,
            textAlign: TextAlign.start,
            // LOCAL_START
            style: widget.style,
            // LOCAL_END
          ),
        ),
      ),
    );
  }
}
