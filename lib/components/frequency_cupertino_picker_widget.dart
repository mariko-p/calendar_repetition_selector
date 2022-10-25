import 'package:custom_recurring_selectors/flutter_flow/custom_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrequencyCupertinoPickerWidget extends StatefulWidget {
  const FrequencyCupertinoPickerWidget({Key? key}) : super(key: key);

  @override
  _FrequencyCupertinoPickerWidgetState createState() =>
      _FrequencyCupertinoPickerWidgetState();
}

final items = generateFrequency();

class _FrequencyCupertinoPickerWidgetState
    extends State<FrequencyCupertinoPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 98,
        child: Center(
          child: CupertinoPicker(
              itemExtent: 40,
              children: items
                  .map((item) => Center(
                          child: Text(
                            item,
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
              }),
        ));
  }
}
