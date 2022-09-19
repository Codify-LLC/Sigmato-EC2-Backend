import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentAddressWidget extends StatefulWidget {
  const CurrentAddressWidget({Key? key}) : super(key: key);

  @override
  _CurrentAddressWidgetState createState() => _CurrentAddressWidgetState();
}

class _CurrentAddressWidgetState extends State<CurrentAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: 329,
        height: 388,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 40,
              fillColor: Color(0xFF00ADB5),
              icon: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 22,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 15),
              child: Text(
                'Current Address Added',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Seoge UI',
                      color: Color(0xFF263238),
                      fontSize: 20,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: Text(
                'Please share the address that you \nstayed before 31 May 2021',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Seoge UI',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Text(
                'Note: Past 3 years address details are required \nmandatorily even if it is outside UK ',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Seoge UI',
                      color: Color(0xFF66727B),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                      lineHeight: 2,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF13BBE6),
                        FlutterFlowTheme.of(context).primaryColor
                      ],
                      stops: [0, 1],
                      begin: AlignmentDirectional(1, 0),
                      end: AlignmentDirectional(-1, 0),
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Add Previous Address',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            color: Colors.white,
                            fontSize: 16,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
