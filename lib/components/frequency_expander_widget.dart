import '../backend/schema/structs/frequency_struct.dart';
import '/components/frequency_cupertino_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'frequency_expander_model.dart';
export 'frequency_expander_model.dart';

class FrequencyExpanderWidget extends StatefulWidget {
  const FrequencyExpanderWidget(
      {super.key,
      required this.freqController,
      required this.currentFrequency,
      required this.onItemChanged});

  final Future<dynamic> Function(int index) onItemChanged;
  final ExpandableController freqController;
  final FrequencyStruct currentFrequency;

  @override
  State<FrequencyExpanderWidget> createState() =>
      _FrequencyExpanderWidgetState();
}

class _FrequencyExpanderWidgetState extends State<FrequencyExpanderWidget> {
  late FrequencyExpanderModel _model;

  //LOCAL_START
  int initialIndex = 0;
  //LOCAL_END

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrequencyExpanderModel());

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
        //LOCAL_START
        //initialExpanded: false,
        controller: widget.freqController,
        //LOCAL_END
        // controller: _model.expandableController,
        child: ExpandablePanel(
          header: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 14.5, 10.0, 14.5),
                child: InkWell(
                  onTap: () => {widget.freqController.toggle()},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'xmgwzs7h' /* Repetition type */,
                          ),
                          style: GoogleFonts.getFont(
                            'Rubik',
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            height: 1.5,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Text(
                              //LOCAL_START
                              widget.currentFrequency.text
                                  ?.toLowerCase() ??
                                  "",
                              //LOCAL_END
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: Color(0xFF7E8CA2),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                  ),
                  child: wrapWithModel(
                    model: _model.frequencyCupertinoPickerModel,
                    updateCallback: () => setState(() {}),
                    //LOCAL_START
                    child: FrequencyCupertinoPickerWidget(
                        initialIndex: this.initialIndex,
                        onItemChanged: (index) async {
                          widget.onItemChanged(index);
                        }),
                    //LOCAL_END
                  ),
                ),
              ),
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
