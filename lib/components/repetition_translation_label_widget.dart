import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'repetition_translation_label_model.dart';
export 'repetition_translation_label_model.dart';

class RepetitionTranslationLabelWidget extends StatefulWidget {
  const RepetitionTranslationLabelWidget({Key? key}) : super(key: key);

  @override
  _RepetitionTranslationLabelWidgetState createState() =>
      _RepetitionTranslationLabelWidgetState();
}

class _RepetitionTranslationLabelWidgetState
    extends State<RepetitionTranslationLabelWidget> {
  late RepetitionTranslationLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepetitionTranslationLabelModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ],
    );
  }
}
