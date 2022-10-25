import 'package:custom_recurring_selectors/flutter_flow/custom_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FrequencyCupertinoPickerWidget extends StatefulWidget {
  const FrequencyCupertinoPickerWidget({Key? key, required this.onItemChanged}) : super(key: key);

  final Future<dynamic> Function(int index) onItemChanged;

  @override
  _FrequencyCupertinoPickerWidgetState createState() =>
      _FrequencyCupertinoPickerWidgetState();
}
class _FrequencyCupertinoPickerWidgetState
    extends State<FrequencyCupertinoPickerWidget> {

  final items = generateFrequency();
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        child: Center(
          child: CupertinoPicker(
              itemExtent: 40,
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
                //widget.onItemChanged(index);
              }),
        ));
  }
}
