import '/components/frequency_expander_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/interval_expander_widget.dart';
import '/components/month_day_checker_combined_widget.dart';
import '/components/radio_button_widget.dart';
import '/components/repetition_label_widget.dart';
import '/components/week_day_checker_widget.dart';
import '/components/year_checker_combined_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 18.0, 15.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '34ooc256' /* Suggestions */,
                        ),
                        style: GoogleFonts.getFont(
                          'Rubik',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 14.5, 10.0, 14.5),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 18.0, 0.0),
                                          child: Icon(
                                            Icons.settings_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            weekDaysItem.text,
                                            'Monday',
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                            height: 1.5,
                                          ),
                                        ),
                                        if (weekDaysItem.isSelected)
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.00, 0.00),
                                              child: Icon(
                                                FFIcons.kcheckbox,
                                                color: Color(0xFF9980DD),
                                                size: 18.0,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (weekDaysIndex != 5)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 0.0, 0.0),
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
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          18.0, 14.5, 10.0, 14.5),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().update(() {
                            FFAppState().vTmp = false;
                          });
                          if (_model.isCustomSelected) {
                            // Set Custom Selected to False
                            setState(() {
                              _model.isCustomSelected = false;
                            });
                          } else {
                            // Set Custom Selected to True
                            setState(() {
                              _model.isCustomSelected = true;
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 18.0, 0.0),
                              child: Icon(
                                FFIcons.krecurring,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pwpi343g' /* Custom */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            if (_model.isCustomSelected)
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.00, 0.00),
                                  child: Icon(
                                    FFIcons.kcheckbox,
                                    color: Color(0xFF9980DD),
                                    size: 18.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (_model.isCustomSelected)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EFFF),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.frequencyExpanderModel,
                              updateCallback: () => setState(() {}),
                              child: FrequencyExpanderWidget(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 14.5, 10.0, 14.5),
                            child: wrapWithModel(
                              model: _model.intervalExpanderModel,
                              updateCallback: () => setState(() {}),
                              child: IntervalExpanderWidget(),
                            ),
                          ),
                          if (FFAppState().vTmp)
                            wrapWithModel(
                              model: _model.weekDayCheckerModel,
                              updateCallback: () => setState(() {}),
                              child: WeekDayCheckerWidget(
                                weekDays: functions.getWeekDayList(),
                              ),
                            ),
                          if (FFAppState().vTmp)
                            wrapWithModel(
                              model: _model.monthDayCheckerCombinedModel,
                              updateCallback: () => setState(() {}),
                              child: MonthDayCheckerCombinedWidget(),
                            ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model.yearCheckerCombinedModel,
                              updateCallback: () => setState(() {}),
                              child: YearCheckerCombinedWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'kkyhmr7g' /* Repeat forever */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.repeatForeverEnabled =
                                              !_model.repeatForeverEnabled;
                                        });
                                      },
                                      child: wrapWithModel(
                                        model: _model.radioButtonModel1,
                                        updateCallback: () => setState(() {}),
                                        child: RadioButtonWidget(
                                          isDisabled:
                                              !_model.repeatForeverEnabled,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '9ed6988p' /* End repetition On */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController1 ??=
                                              FormFieldController<String>(null),
                                      options: <String>[],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue1 = val),
                                      width: 80.0,
                                      height: 28.0,
                                      textStyle: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                      ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'ymue1mm8' /* Today */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0.5,
                                      borderRadius: 5.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          11.0, 0.0, 6.0, 0.0),
                                      hidesUnderline: true,
                                      disabled: !_model.endRepetitionOnEnabled,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.endRepetitionOnEnabled =
                                              !_model.endRepetitionOnEnabled;
                                        });
                                      },
                                      child: wrapWithModel(
                                        model: _model.radioButtonModel2,
                                        updateCallback: () => setState(() {}),
                                        child: RadioButtonWidget(
                                          isDisabled:
                                              !_model.endRepetitionOnEnabled,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '6ts3zr1x' /* End repetition After */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                      options: <String>[],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue2 = val),
                                      width: 80.0,
                                      height: 28.0,
                                      textStyle: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                      ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '920vxph3' /* 1 */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0.5,
                                      borderRadius: 5.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          11.0, 0.0, 6.0, 0.0),
                                      hidesUnderline: true,
                                      disabled:
                                          !_model.endRepetitionAfterEnabled,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.endRepetitionAfterEnabled =
                                              !_model.endRepetitionAfterEnabled;
                                        });
                                      },
                                      child: wrapWithModel(
                                        model: _model.radioButtonModel3,
                                        updateCallback: () => setState(() {}),
                                        child: RadioButtonWidget(
                                          isDisabled:
                                              !_model.endRepetitionAfterEnabled,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '44hbrowg' /* Repeat on Done */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue1 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue1 = newValue!);
                                  },
                                  activeColor: Colors.transparent,
                                  checkColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'r0cj7rtk' /* Skip weekends */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue2 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue2 = newValue!);
                                  },
                                  activeColor: Colors.transparent,
                                  checkColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'g1o6r2kx' /* Do not show in Overdue activit... */,
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue3 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxValue3 = newValue!);
                                  },
                                  activeColor: Colors.transparent,
                                  checkColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'bwo20d1o' /* Summary: */,
                            ),
                            style: GoogleFonts.getFont(
                              'Rubik',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                      child: wrapWithModel(
                        model: _model.repetitionLabelModel1,
                        updateCallback: () => setState(() {}),
                        child: RepetitionLabelWidget(
                          humanReadableText: '[Pass parameter localy]',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                      child: wrapWithModel(
                        model: _model.repetitionLabelModel2,
                        updateCallback: () => setState(() {}),
                        child: RepetitionLabelWidget(
                          humanReadableText: '[Pass parameter localy]',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
