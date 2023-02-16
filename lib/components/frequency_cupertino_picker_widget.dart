import 'package:custom_recurring_selectors/flutter_flow/custom_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'frequency_cupertino_picker_model.dart';
export 'frequency_cupertino_picker_model.dart';

class FrequencyCupertinoPickerWidget extends StatefulWidget {
  FrequencyCupertinoPickerWidget(
      {Key? key, required this.onItemChanged, this.initialIndex = 0})
      : super(key: key);

  int initialIndex;
  final Future<dynamic> Function(int index) onItemChanged;

  @override
  _FrequencyCupertinoPickerWidgetState createState() =>
      _FrequencyCupertinoPickerWidgetState();
}

class _FrequencyCupertinoPickerWidgetState
    extends State<FrequencyCupertinoPickerWidget> {
  final items = generateFrequency();
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
    context.watch<FFAppState>();
    return Container(
        height: 130,
        child: Center(
          child: CupertinoPicker(
              itemExtent: 40,
              scrollController:
                  FixedExtentScrollController(initialItem: widget.initialIndex),
              children: items
                  .map((item) => Center(
                          child: Text(
                        item.text ?? "",
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Rubik',
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                      )))
                  .toList(),
              onSelectedItemChanged: (index) {
                SystemSound.play(SystemSoundType.click);
                HapticFeedback.lightImpact();
                widget.onItemChanged(index);
              }),
        ));
  }
}
