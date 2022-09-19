import 'package:freedom/referral_info/referral_info_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ReferralCopyWidget extends StatefulWidget {
  const ReferralCopyWidget({Key? key}) : super(key: key);

  @override
  _ReferralCopyWidgetState createState() => _ReferralCopyWidgetState();
}

class _ReferralCopyWidgetState extends State<ReferralCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset(
                  'assets/lottie_animations/lf30_editor_og9xc00j.json',
                  width: MediaQuery.of(context).size.width * 2.97,
                  height: 200,
                  fit: BoxFit.cover,
                  animate: true,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Refer your friends',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Seoge UI',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
                    child: Text(
                      'What do my friends need to do?',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            color: Color(0xFF263238),
                            fontSize: 16,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 84,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3F000000),
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF13BBE6),
                          FlutterFlowTheme.of(context).primaryColor
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(1, 0),
                        end: AlignmentDirectional(-1, 0),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Rewards won',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Text(
                                '£ 0',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          child: Container(
                            width: 24,
                            height: 24,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/Group_554.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 394,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF7FE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 30, 0, 10),
                        child: Text(
                          'What do my friends need to do?',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF263238),
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                        child: Image.asset(
                          'assets/images/Group_25054.png',
                          width: 344,
                          height: 171,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'These are few steps to complete for a great start',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Seoge UI',
                          color: Color(0xFF979797),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What’s in it for me?',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF263238),
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional(0.78, -1),
                          children: [
                            Text(
                              'We\'ll reward you with         for\neach friend that meets the\ncriteria above',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF979797),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Text(
                              '£ 50 ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Seoge UI',
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/Group_25064.png',
                        width: 140,
                        height: 122,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Image.asset(
                    'assets/images/Group_25068.png',
                    width: MediaQuery.of(context).size.width,
                    height: 159,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Container(
                              width: 26,
                              height: 26,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/Untitled-4.png',
                              ),
                            ),
                          ),
                          Text(
                            'Freedom Circle',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 12,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Refer Your Friends',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF263238),
                                      fontSize: 12,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  barrierColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        child: ReferralInfoWidget(),
                                      ),
                                    );
                                  },
                                );
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
