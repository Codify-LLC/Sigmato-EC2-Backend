import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MortagetypeCopyWidget extends StatefulWidget {
  const MortagetypeCopyWidget({Key? key}) : super(key: key);

  @override
  _MortagetypeCopyWidgetState createState() => _MortagetypeCopyWidgetState();
}

class _MortagetypeCopyWidgetState extends State<MortagetypeCopyWidget> {
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
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Seoge UI',
                          color: Colors.white,
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
            child: Container(
              width: 42,
              height: 42,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/Untitled-6.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
