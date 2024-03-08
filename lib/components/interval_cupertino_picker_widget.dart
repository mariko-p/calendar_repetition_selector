import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interval_cupertino_picker_model.dart';
export 'interval_cupertino_picker_model.dart';

class IntervalCupertinoPickerWidget extends StatefulWidget {
  const IntervalCupertinoPickerWidget({super.key});

  @override
  State<IntervalCupertinoPickerWidget> createState() =>
      _IntervalCupertinoPickerWidgetState();
}

class _IntervalCupertinoPickerWidgetState
    extends State<IntervalCupertinoPickerWidget> {
  late IntervalCupertinoPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntervalCupertinoPickerModel());
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
