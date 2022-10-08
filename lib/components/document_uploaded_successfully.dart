import 'package:flutter/material.dart';
import 'package:freedom/flutter_flow/flutter_flow_icon_button.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';

class DocumentUploadedSuccessfully extends StatelessWidget {
  const DocumentUploadedSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 329,
        height: 460,
        // decoration: BoxDecoration(
        //   color: FlutterFlowTheme.of(context).secondaryBackground,
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 329,
              height: 397,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/done.png",
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 15),
                    child: Text(
                      'Documents Uploaded \nSuccessfully',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            color: Color(0xFF263238),
                            fontSize: 20,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 43,
              fillColor: Colors.white,
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 26,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
