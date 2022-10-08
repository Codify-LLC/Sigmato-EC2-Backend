import 'package:freedom/components/thank_you_dialog.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeNextStepsWidget extends StatefulWidget {
  const SeeNextStepsWidget({Key? key}) : super(key: key);

  @override
  _SeeNextStepsWidgetState createState() => _SeeNextStepsWidgetState();
}

class _SeeNextStepsWidgetState extends State<SeeNextStepsWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 329,
        height: 492,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Image.asset(
                'assets/images/Untitled-27.png',
                width: 229,
                height: 229,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Text(
                'Bravo! \nA mortgage advisor will contact\n you to go over your choices.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Seoge UI',
                      fontSize: 18,
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);

                    Future.delayed(
                        Duration(seconds: 2),
                        await showDialog(
                            context: context,
                            builder: (_) {
                              return ThankYouDialog();
                            }));
                  },
                  child: Container(
                    width: 200,
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
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'See Next Steps',
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
            ),
          ],
        ),
      ),
    );
  }
}
