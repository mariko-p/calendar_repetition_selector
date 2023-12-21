import '/backend/schema/structs/index.dart';
import '../backend/schema/structs/month_day_struct.dart';
import '/components/month_day_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_checker_model.dart';
export 'month_day_checker_model.dart';

class MonthDayCheckerWidget extends StatefulWidget {
  MonthDayCheckerWidget(
      {Key? key, required this.days, required this.selectionChanged})
      : super(key: key);

  final List<MonthDayStruct> days;
  final Future<dynamic> Function(List<MonthDayStruct>? checkedItems)
      selectionChanged;

  @override
  _MonthDayCheckerWidgetState createState() => _MonthDayCheckerWidgetState();
}

class _MonthDayCheckerWidgetState extends State<MonthDayCheckerWidget> {
  final List<MonthDayStruct> checkedItems = List.empty(growable: true);
  late MonthDayCheckerModel _model;

  void updateCheckedItems(MonthDayStruct updatedItem) {
    var foundIndex = checkedItems
        .indexWhere((element) => element.index == updatedItem.index);

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
    widget.days[updatedItem.index!] = updatedItem;
    widget.selectionChanged(checkedItems);
  }

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

  Builder rowBuilder(int startIndex, int endIndex) {
    return Builder(
      builder: (context) {
        var weekDays = widget.days.sublist(startIndex, endIndex);
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(weekDays.length, (weekDayIndex) {
            var weekDay = weekDays[weekDayIndex];

            return MonthDayItemWidget(
              key: Key('MonthDayItem_$weekDayIndex'),
              monthDay: weekDay,
              selectionChanged: (monthDay) async {
                updateCheckedItems(monthDay!);
              },
            );
          }),
        );
      },
    );
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: rowBuilder(0, 7),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: rowBuilder(7, 14),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: rowBuilder(14, 21),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: rowBuilder(21, 28),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: rowBuilder(28, 35),
            ),
          ],
        ),
      ),
    );
  }
}
