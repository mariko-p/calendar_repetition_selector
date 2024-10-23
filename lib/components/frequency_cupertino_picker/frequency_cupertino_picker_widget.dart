import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'frequency_cupertino_picker_model.dart';
export 'frequency_cupertino_picker_model.dart';

class FrequencyCupertinoPickerWidget extends StatefulWidget {
  const FrequencyCupertinoPickerWidget({super.key});

  @override
  State<FrequencyCupertinoPickerWidget> createState() =>
      _FrequencyCupertinoPickerWidgetState();
}

class _FrequencyCupertinoPickerWidgetState
    extends State<FrequencyCupertinoPickerWidget> {
  late FrequencyCupertinoPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrequencyCupertinoPickerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
