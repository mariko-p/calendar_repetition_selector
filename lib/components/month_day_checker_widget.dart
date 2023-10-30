import '/components/month_day_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_checker_model.dart';
export 'month_day_checker_model.dart';

class MonthDayCheckerWidget extends StatefulWidget {
  const MonthDayCheckerWidget({Key? key}) : super(key: key);

  @override
  _MonthDayCheckerWidgetState createState() => _MonthDayCheckerWidgetState();
}

class _MonthDayCheckerWidgetState extends State<MonthDayCheckerWidget> {
  late MonthDayCheckerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayCheckerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key(
                            'Key2cb_${weekItemIndex}_of_${weekItem.length}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key(
                            'Keyasr_${weekItemIndex}_of_${weekItem.length}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key(
                            'Keyj3q_${weekItemIndex}_of_${weekItem.length}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key(
                            'Keylh0_${weekItemIndex}_of_${weekItem.length}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key(
                            'Keyq7l_${weekItemIndex}_of_${weekItem.length}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
