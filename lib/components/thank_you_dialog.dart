import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ThankYouDialog extends StatelessWidget {
  const ThankYouDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 329,
        // height: 460,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 329,
              // height: 397,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/thankyou.png",
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Thank You',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF263238),
                                      fontSize: 22,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 15),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xffEEF7FE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Image.asset(
                                    "assets/images/verified_icon.png"),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                'A mortgage advisor will contact you to go over your choices.',
                                textAlign: TextAlign.left,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 55,
                              width: 50,
                              child: Center(
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: Color(0xff263238).withOpacity(0.7),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              'Next Steps',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF263238),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xffEEF7FE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Image.asset("assets/images/trophy.png"),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                'Start by looking at and agree to the mortgage suggestions made specifically for you ',
                                textAlign: TextAlign.left,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 55,
                              width: 50,
                              child: Center(
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  dashColor: Color(0xff263238).withOpacity(0.7),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xffEEF7FE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Image.asset("assets/images/cup.png"),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                'Sit back & relax as we send your application to the bank of your choice.',
                                textAlign: TextAlign.left,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
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
