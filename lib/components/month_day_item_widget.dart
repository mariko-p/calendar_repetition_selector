import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_item_model.dart';
export 'month_day_item_model.dart';

class MonthDayItemWidget extends StatefulWidget {
  MonthDayItemWidget({
    Key? key,
    this.monthDay,
    required this.selectionChanged,
  }) : super(key: key);

  MonthDayStruct? monthDay;
  final Future<dynamic> Function(MonthDayStruct? monthDay) selectionChanged;

  @override
  _MonthDayItemWidgetState createState() => _MonthDayItemWidgetState();
}

class _MonthDayItemWidgetState extends State<MonthDayItemWidget> {
  late MonthDayItemModel _model;

  uncheckItem(int? index) {
    if (skipItem(index)) return;
    setState(() {
      var text = widget.monthDay?.text;
      var index = widget.monthDay?.index;
      var updatedMonthDay =
          createMonthDayStruct(text: text, index: index, isChecked: false);

      widget.monthDay = updatedMonthDay;
    });
    widget.selectionChanged(widget.monthDay);
  }

  checkItem(int? index) {
    if (skipItem(index)) return;
    setState(() {
      var text = widget.monthDay?.text;
      var index = widget.monthDay?.index;
      var updatedMonthDay =
          createMonthDayStruct(text: text, index: index, isChecked: true);

      widget.monthDay = updatedMonthDay;
    });
    widget.selectionChanged(widget.monthDay);
  }

  bool skipItem(int? index) {
    if (index == 31 || index == 32 || index == 33 || index == 34) {
      return true;
    }
    return false;
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (widget.monthDay?.isChecked == true)
          InkWell(
            onTap: (() {
              uncheckItem(widget.monthDay?.index);
            }),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xFF9980DD),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  valueOrDefault<String>(
                    widget.monthDay?.text,
                    '',
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
          ),
        if (widget.monthDay?.isChecked == false)
          InkWell(
            onTap: (() {
              checkItem(widget.monthDay?.index);
            }),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  valueOrDefault<String>(
                    widget.monthDay?.text,
                    '',
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
