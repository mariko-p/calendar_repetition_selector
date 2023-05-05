import '/components/custom_repetition_component_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/repetition_label_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_repetition_component_model.dart';
export 'add_repetition_component_model.dart';

class AddRepetitionComponentWidget extends StatefulWidget {
  const AddRepetitionComponentWidget({Key? key}) : super(key: key);

  @override
  _AddRepetitionComponentWidgetState createState() =>
      _AddRepetitionComponentWidgetState();
}

class _AddRepetitionComponentWidgetState
    extends State<AddRepetitionComponentWidget> {
  late AddRepetitionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddRepetitionComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.headerCenteredNavBarModel,
          updateCallback: () => setState(() {}),
          child: HeaderCenteredNavBarWidget(
            title: FFLocalizations.of(context).getVariableText(
              enText: 'Add repetition',
              svText: 'Lägg till upprepning',
            ),
            isSaveVisible: true,
            isSaveEnabled: true,
            onSaveTap: () async {},
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 10.0),
          child: Builder(
            builder: (context) {
              final weekDays = functions
                  .getPredefinedRepetitionList()
                  .toList()
                  .take(7)
                  .toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: weekDays.length,
                itemBuilder: (context, weekDaysIndex) {
                  final weekDaysItem = weekDays[weekDaysIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().update(() {
                            FFAppState().vTmp = false;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 7.5, 20.0, 7.5),
                              child: Text(
                                valueOrDefault<String>(
                                  weekDaysItem.text,
                                  'Monday',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w300,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            if (weekDaysItem.isSelected ?? true)
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.5, 12.0, 10.5),
                                    child: Icon(
                                      FFIcons.kcheckbox,
                                      color: Color(0xFF9980DD),
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (weekDaysIndex != 5)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              21.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
          child: wrapWithModel(
            model: _model.repetitionLabelModel1,
            updateCallback: () => setState(() {}),
            child: RepetitionLabelWidget(
              humanReadableText: '[Pass parameter localy]',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().update(() {
                FFAppState().vTmp = false;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 7.5, 20.0, 7.5),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'pwpi343g' /* Custom */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w300,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x00000000),
                            context: context,
                            builder: (bottomSheetContext) {
                              return Padding(
                                padding: MediaQuery.of(bottomSheetContext)
                                    .viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  child: CustomRepetitionComponentWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: Stack(
                            children: [
                              if (FFAppState().vTmp)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 1.5, 0.0),
                                    child: Icon(
                                      FFIcons.kangleFullRight,
                                      color: Color(0xFF7E8CA2),
                                      size: 12.0,
                                    ),
                                  ),
                                ),
                              if (FFAppState().vTmp)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    FFIcons.kcheckbox,
                                    color: Color(0xFF9980DD),
                                    size: 15.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
          child: wrapWithModel(
            model: _model.repetitionLabelModel2,
            updateCallback: () => setState(() {}),
            child: RepetitionLabelWidget(
              humanReadableText: '[Pass parameter localy]',
            ),
          ),
        ),
      ],
    );
  }
}
