import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_functions_translations_map_model.dart';
export 'custom_functions_translations_map_model.dart';

class CustomFunctionsTranslationsMapWidget extends StatefulWidget {
  const CustomFunctionsTranslationsMapWidget({Key? key}) : super(key: key);

  @override
  _CustomFunctionsTranslationsMapWidgetState createState() =>
      _CustomFunctionsTranslationsMapWidgetState();
}

class _CustomFunctionsTranslationsMapWidgetState
    extends State<CustomFunctionsTranslationsMapWidget> {
  late CustomFunctionsTranslationsMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomFunctionsTranslationsMapModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'daxykqq2' /* The activity will repeat every... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'mfg5rhah' /* The activity will repeat every... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'vbn8qvxy' /* The activity will repeat every... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'zpky99wo' /* The activity will repeat every... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'vy44jrpj' /* The activity will repeat every... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'oyc9uml8' /* The activity will repeat  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gwyr9cx1' /* day */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2cpvzq7y' /* days */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lsowp12l' /* week */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3e5xfez2' /* weeks */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'hptgspwe' /* month */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ax9vtym8' /* months */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'rrpiidap' /* year */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'n4wmlxr5' /* years */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '1g631ksb' /* Monday */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'nzdgw5w6' /* Tuesday */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'clmax87t' /* Wednesday */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'n6lnn8xv' /* Thursday */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'qi8cotop' /* Friday */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3h99ug2f' /* Saturday */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ax1lx5sz' /* Sunday */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'd3l22vhu' /* January */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '9g3z94s7' /* February */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lnt22ld1' /* March */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '034u8g9a' /* April */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '6hls65tt' /* May */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'pej4ktvz' /* June */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '6betrjev' /* July */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '6qvjh0si' /* August */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'sgku9oc9' /* September */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '8sca82td' /* October */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'wqms1orj' /* November */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'd09m6bre' /* December */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
