import 'package:freedom/components/add_address_widget2.dart';
import 'package:freedom/components/add_current_residence_dialog.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({Key? key}) : super(key: key);

  @override
  _PropertyTypeWidgetState createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 329,
        height: 225,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                'Please select your Property Type',
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
                      showDialog(
                        context: context,
                        builder: (_) {
                          return CurrentResidenceAddressDialog();
                        },
                      );
                    },
                    text: 'Current Residence',
                    options: FFButtonOptions(
                      width: 136,
                      height: 50,
                      color: Color(0xFFEEF7FE),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AddAddressWidget2();
                        },
                      );
                    },
                    text: 'Buy to let',
                    options: FFButtonOptions(
                      width: 112,
                      height: 50,
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
