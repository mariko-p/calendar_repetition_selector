import 'package:custom_recurring_selectors/backend/backend.dart';

import '../components/month_day_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDayCheckerWidget extends StatefulWidget {
  MonthDayCheckerWidget({Key? key, required this.selectionChanged}) : super(key: key);
  final Future<dynamic> Function(List<MonthDayStruct>? checkedItems) selectionChanged;

  

  @override
  _MonthDayCheckerWidgetState createState() => _MonthDayCheckerWidgetState();
}

class _MonthDayCheckerWidgetState extends State<MonthDayCheckerWidget> {
  final List<MonthDayStruct> checkedItems = List.empty(growable: true);
  void updateCheckedItems(MonthDayStruct updatedItem) {
    var foundIndex = checkedItems.indexWhere((element) => element.index == updatedItem.index);
    if (updatedItem.isChecked == true) {
      if (foundIndex == -1) {
        // Add item to list.
        checkedItems.add(updatedItem);
      }
    } else {
      // Remove item from list.
      if (foundIndex != -1) {
        checkedItems.removeAt(foundIndex);
      }
    }
    widget.selectionChanged(checkedItems);
  }

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
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: Builder(
                builder: (context) {
                  final weekItem = functions.getMonthDayList().sublist(0, 7);
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                        selectionChanged: (monthDay) async {
                          updateCheckedItems(monthDay!);
                        },
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
                  final weekItem = functions.getMonthDayList().sublist(7, 14);
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                        selectionChanged: (monthDay) async {
                          updateCheckedItems(monthDay!);
                        },
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
                  final weekItem = functions.getMonthDayList().sublist(14, 21);
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                        selectionChanged: (monthDay) async {
                          updateCheckedItems(monthDay!);
                        },
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
                  final weekItem = functions.getMonthDayList().sublist(21, 28);
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                        selectionChanged: (monthDay) async {
                          updateCheckedItems(monthDay!);
                        },
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
                  final weekItem = functions.getMonthDayList().sublist(28, 35);
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(weekItem.length, (weekItemIndex) {
                      final weekItemItem = weekItem[weekItemIndex];
                      return MonthDayItemWidget(
                        key: Key('MonthDayItem_${weekItemIndex}'),
                        monthDay: weekItemItem,
                        selectionChanged: (monthDay) async {
                          updateCheckedItems(monthDay!);
                        },
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
