import '/components/interval_cupertino_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interval_expander_model.dart';
export 'interval_expander_model.dart';

//LOCAL_START
import '../backend/schema/structs/interval_struct.dart';
//LOCAL_END

class IntervalExpanderWidget extends StatefulWidget {
  const IntervalExpanderWidget(
      {super.key,
      required this.intController,
      required this.currentIntervals,
      required this.currentIntervalIndex,
      required this.onItemChanged});

  final Future<dynamic> Function(int index) onItemChanged;
  final ExpandableController intController;
  final List<IntervalStruct> currentIntervals;
  final int currentIntervalIndex;

  @override
  State<IntervalExpanderWidget> createState() => _IntervalExpanderWidgetState();
}

class _IntervalExpanderWidgetState extends State<IntervalExpanderWidget> {
  //LOCAL_START
  var isExpanded = false;
  //LOCAL_END
  late IntervalExpanderModel _model;

  //LOCAL_START
  void onExpansionChanged() {
    if (widget.intController.expanded) {
      setState(() {
        isExpanded = true;
      });
    } else {
      setState(() {
        isExpanded = false;
      });
    }
  }
  //LOCAL_END

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntervalExpanderModel());
    //LOCAL_START
    widget.intController.addListener(onExpansionChanged);
    //LOCAL_END

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: ExpandableNotifier(
        controller: widget.intController,
        // controller: _model.expandableController,
        child: ExpandablePanel(
          header: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 14.5, 10.0, 14.5),
                child: Container(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () => {widget.intController.toggle()},
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '2952w46f' /* With the interval */,
                          ),
                          style: GoogleFonts.getFont(
                            'Rubik',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            height: 1.5,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Text(
                                //LOCAL_START
                                widget
                                    .currentIntervals[
                                widget.currentIntervalIndex]
                                    .text ??
                                    "",
                                //LOCAL_END
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF7E8CA2),
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //LOCAL_START
              if (isExpanded)
                //LOCAL_END
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
                          .lineColor,
                    ),
                  ),
                ),
            ],
          ),
          collapsed: Container(),
          expanded: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 98,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: wrapWithModel(
                    model: _model.intervalCupertinoPickerModel,
                    updateCallback: () => setState(() {}),
                    //LOCAL_START
                    child: IntervalCupertinoPickerWidget(
                        items: widget.currentIntervals,
                        initialIndex: widget.currentIntervalIndex,
                        onItemChanged: (index) async {
                          widget.onItemChanged(index);
                        }),
                    //LOCAL_END
                  ),
                ),
              ),
            ],
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: false,
          ),
        ),
      ),
    );
  }
}
