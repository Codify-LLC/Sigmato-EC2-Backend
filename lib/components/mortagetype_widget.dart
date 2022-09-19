import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MortagetypeWidget extends StatefulWidget {
  const MortagetypeWidget({Key? key}) : super(key: key);

  @override
  _MortagetypeWidgetState createState() => _MortagetypeWidgetState();
}

class _MortagetypeWidgetState extends State<MortagetypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 225,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              'Please select your Mortgage Type',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Seoge UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Current Residence',
                  options: FFButtonOptions(
                    width: 136,
                    height: 50,
                    color: Color(0xFFEEF7FE),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Seoge UI',
                          color: Color(0xFF263238),
                          fontSize: 13,
                          useGoogleFonts: false,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Buy to let',
                  options: FFButtonOptions(
                    width: 112,
                    height: 50,
                    color: Color(0xFFEEF7FE),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Seoge UI',
                          color: Color(0xFF263238),
                          fontSize: 14,
                          useGoogleFonts: false,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 42,
              fillColor: Color(0xFFE0E0E0),
              icon: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
        ],
      ),
    );
  }
}
