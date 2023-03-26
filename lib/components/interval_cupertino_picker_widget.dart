import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../backend/schema/structs/interval_struct.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'interval_cupertino_picker_model.dart';
export 'interval_cupertino_picker_model.dart';

class IntervalCupertinoPickerWidget extends StatefulWidget {
  IntervalCupertinoPickerWidget(
      {Key? key,
      required this.items,
      required this.onItemChanged,
      this.initialIndex = 0})
      : super(key: key);

  int initialIndex;
  final List<IntervalStruct> items;
  final Future<dynamic> Function(int index) onItemChanged;

  @override
  _IntervalCupertinoPickerWidgetState createState() =>
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
    context.watch<FFAppState>();
    return Container(
        height: 130,
        child: CupertinoPicker(
            itemExtent: 40,
            scrollController:
                FixedExtentScrollController(initialItem: widget.initialIndex),
            children: widget.items
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
            }));
  }
}
