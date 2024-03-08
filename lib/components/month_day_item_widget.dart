import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_item_model.dart';
export 'month_day_item_model.dart';

class MonthDayItemWidget extends StatefulWidget {
  const MonthDayItemWidget({
    super.key,
    this.monthDay,
  });

  final MonthDayStruct? monthDay;

  @override
  State<MonthDayItemWidget> createState() => _MonthDayItemWidgetState();
}

class _MonthDayItemWidgetState extends State<MonthDayItemWidget> {
  late MonthDayItemModel _model;

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
          Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                functions.combineColors(
                    FFAppState().cMonthDayCheckedColors.toList()),
                FlutterFlowTheme.of(context).secondaryText,
              ),
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: SelectionArea(
                  child: Text(
                widget.monthDay!.text,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
              )),
            ),
          ),
        if (widget.monthDay?.isChecked == false)
          Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: SelectionArea(
                  child: Text(
                widget.monthDay!.text,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
              )),
            ),
          ),
      ],
    );
  }
}
