import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntervalCupertinoPickerWidget extends StatefulWidget {
  const IntervalCupertinoPickerWidget({Key? key}) : super(key: key);

  @override
  _IntervalCupertinoPickerWidgetState createState() =>
      _IntervalCupertinoPickerWidgetState();
}

class _IntervalCupertinoPickerWidgetState
    extends State<IntervalCupertinoPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 98,
        child: CupertinoPicker(
            itemExtent: 21,
            children: [
              Center(
                  child: Text(
                "1 week",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
              )),
              Text("2 weeks",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
              Text("3 weeks",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
              Text("4 weeks",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
            ],
            onSelectedItemChanged: (index) {
              SystemSound.play(SystemSoundType.click);
              HapticFeedback.lightImpact();
            }));
  }
}
