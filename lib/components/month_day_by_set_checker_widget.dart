import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../flutter_flow/custom_functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_by_set_checker_model.dart';
export 'month_day_by_set_checker_model.dart';

class MonthDayBySetCheckerWidget extends StatefulWidget {
  const MonthDayBySetCheckerWidget(
      {Key? key,
      required this.bySetPos,
      required this.byDay,
      required this.bySetPosChanged,
      required this.byDayChanged})
      : super(key: key);

  final BySetPositionStruct bySetPos;
  final ByDayStruct byDay;
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
  var positionIndex;
  var dayIndex;
  late MonthDayBySetCheckerModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayBySetCheckerModel());

    bySetPositionItems = getBySetPositionList();
    byDayItems = getByDayList();

    // Initialize initial positionIndex.
    positionIndex =
        bySetPositionItems.indexWhere((e) => e.value == widget.bySetPos.value);
    if (positionIndex == -1) {
      positionIndex = 0;
    }

    // Initialize initial dayIndex.
    dayIndex = byDayItems.indexWhere((e) => e.value == widget.byDay.value);
    if (dayIndex == -1) {
      dayIndex = 0;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Apply specific language.
      setState(() {  
        bySetPositionItems = getBySetPositionList(context);
        byDayItems = getByDayList(context);
      });
    });
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Center(
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: positionIndex),
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
                    positionIndex = index;

                    widget.bySetPosChanged(bySetPositionItems[index]);
                  }),
            )),
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Center(
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: dayIndex),
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
                    dayIndex = index;

                    widget.byDayChanged(byDayItems[index]);
                  }),
            )),
      ]),
    );
  }
}
