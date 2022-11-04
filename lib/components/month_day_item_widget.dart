import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDayItemWidget extends StatefulWidget {
  const MonthDayItemWidget({
    Key? key,
    this.monthDay,
  }) : super(key: key);

  final MonthDayStruct? monthDay;

  @override
  _MonthDayItemWidgetState createState() => _MonthDayItemWidgetState();
}

class _MonthDayItemWidgetState extends State<MonthDayItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.monthDay?.isChecked == true)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF9980DD),
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: SelectionArea(
                  child: Text(
                widget.monthDay!.text!,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
              )),
            ),
          ),
        if (widget.monthDay?.isChecked == false)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: SelectionArea(
                  child: Text(
                widget.monthDay!.text!,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
              )),
            ),
          ),
      ],
    );
  }
}
