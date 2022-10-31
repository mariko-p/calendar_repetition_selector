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
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .sublist(0, 7);
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
            Builder(
              builder: (context) {
                final weekItem = functions.getMonthDayList().sublist(7, 14);
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
            Builder(
              builder: (context) {
                final weekItem = functions.getMonthDayList().sublist(14, 21);
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
            Builder(
              builder: (context) {
                final weekItem = functions.getMonthDayList().sublist(21, 28);
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
            Builder(
              builder: (context) {
                final weekItem = functions.getMonthDayList().sublist(28, 35);
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
            ),],
        ),
      ),
    );
  }
}
