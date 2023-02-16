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

    return Column(
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
      ],
    );
  }
}
