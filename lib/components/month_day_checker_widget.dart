import '../components/month_day_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDayCheckerWidget extends StatefulWidget {
  const MonthDayCheckerWidget({Key? key}) : super(key: key);

  @override
  _MonthDayCheckerWidgetState createState() => _MonthDayCheckerWidgetState();
}

class _MonthDayCheckerWidgetState extends State<MonthDayCheckerWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index! >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index! >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index! >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .where((e) => e.index! >= 0)
                    .toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekItem.length, (weekItemIndex) {
                    final weekItemItem = weekItem[weekItemIndex];
                    return MonthDayItemWidget(
                      key: Key('MonthDayItem_${weekItemIndex}'),
                      monthDay: weekItemItem,
                    );
                  }),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Builder(
                builder: (context) {
                  final weekItem = functions
                      .getMonthDayList()
                      .where((e) => e.index! >= 0)
                      .toList();
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 32,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
