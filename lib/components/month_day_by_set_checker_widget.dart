import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../flutter_flow/custom_functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDayBySetCheckerWidget extends StatefulWidget {
  const MonthDayBySetCheckerWidget(
      {Key? key, required this.bySetPosChanged, required this.byDayChanged})
      : super(key: key);

  final Future<dynamic> Function(BySetPositionStruct? bySetPos) bySetPosChanged;
  final Future<dynamic> Function(ByDayStruct? byDay) byDayChanged;

  @override
  _MonthDayBySetCheckerWidgetState createState() =>
      _MonthDayBySetCheckerWidgetState();
}

class _MonthDayBySetCheckerWidgetState
    extends State<MonthDayBySetCheckerWidget> {
  late List<BySetPositionStruct> bySetPositionItems;
  late List<ByDayStruct> byDayItems;

  @override
  void initState() {
    bySetPositionItems = getBySetPositionList();
    byDayItems = getByDayList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Center(
              child: CupertinoPicker(
                  itemExtent: 40,
                  children: bySetPositionItems
                      .map((item) => Center(
                              child: Text(
                            item.text ?? "",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                          )))
                      .toList(),
                  onSelectedItemChanged: (index) {
                    SystemSound.play(SystemSoundType.click);
                    HapticFeedback.lightImpact();

                    widget.bySetPosChanged(bySetPositionItems[index]);
                  }),
            )),
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Center(
              child: CupertinoPicker(
                  itemExtent: 40,
                  children: byDayItems
                      .map((item) => Center(
                              child: Text(
                            item.text ?? "",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                          )))
                      .toList(),
                  onSelectedItemChanged: (index) {
                    SystemSound.play(SystemSoundType.click);
                    HapticFeedback.lightImpact();

                    widget.byDayChanged(byDayItems[index]);
                  }),
            )),
      ]),
    );
  }
}
