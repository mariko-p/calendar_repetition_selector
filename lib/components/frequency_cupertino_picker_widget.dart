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

var items = 

class _FrequencyCupertinoPickerWidgetState
    extends State<FrequencyCupertinoPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 98,
        child: CupertinoPicker(
            itemExtent: 40,
            children: [
              Text(
                "Every day",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Text("Every week",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
              Text("Every month",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      )),
              Text("Every year",
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
