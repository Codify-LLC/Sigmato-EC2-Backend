import 'package:freedom/backend/api.dart';
import 'package:freedom/components/add_carloan_widget.dart';
import 'package:freedom/components/add_credit_card_widget.dart';
import 'package:freedom/components/add_h_p_p_c_p_store_cardloan_widget.dart';
import 'package:freedom/components/addpersonaloan_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutstandingDetailsWidget extends StatefulWidget {
  const OutstandingDetailsWidget({Key? key}) : super(key: key);

  @override
  _OutstandingDetailsWidgetState createState() =>
      _OutstandingDetailsWidgetState();
}

class _OutstandingDetailsWidgetState extends State<OutstandingDetailsWidget> {
  String? name;
  bool creditCard = false;
  bool personalLoan = false;
  bool carLoan = false;
  bool storeCard = false;
  String? _credit;
  String? _personal;
  String? _car;
  String? _store;

  @override
  void initState() {
    super.initState();
    setData();
  }

  Future setData() async {
    final data = await ApiFunctions().getApplicantData();
    final prefs = await SharedPreferences.getInstance();

    // final _creditCard = prefs.getBool('ff_creditCard');
    // print(data["firstname"]);

    setState(() {
      name = '${data["firstname"]} ${data["surname"]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
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
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Text(
                            'Outstanding Details',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      color: Colors.white,
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              creditCard
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Credit Card',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Add credit card",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF37474F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 30, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          final value = await showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AddCreditCardWidget();
                                              });
                                          setState(() {
                                            creditCard = value;
                                          });
                                        },
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Untitled-9.png',
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 5),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: FFAppState().creditCardList.length,
                              itemBuilder: (_, index) {
                                // print(FFAppState().creditCardList.length);
                                return Container(
                                  width: 118,
                                  height: 134,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 22,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/creditcard.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/card.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        // FFAppState().creditCardList[index],
                                        FFAppState().creditCardList[index]
                                            ["creditCardProvider"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Image.asset(
                                        "assets/images/currency.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        FFAppState().creditCardList[index]
                                            ["currentBalance"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                          child: Text(
                            'Do you have a credit card?',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final value = await showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AddCreditCardWidget();
                                        });
                                    setState(() {
                                      creditCard = value;
                                      _credit = "yes";
                                    });
                                  },
                                  text: 'Yes',
                                  options: FFButtonOptions(
                                    width: 157,
                                    height: 50,
                                    color: _credit == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : Color(0xFFEEF7FE),
                                    textStyle: _credit == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Colors.white,
                                              useGoogleFonts: false,
                                            )
                                        : FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Color(0xFF263238),
                                              useGoogleFonts: false,
                                            ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _credit = "no";
                                  });
                                },
                                text: 'No',
                                options: FFButtonOptions(
                                  width: 157,
                                  height: 50,
                                  color: _credit == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : Color(0xFFEEF7FE),
                                  textStyle: _credit == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          )
                                      : FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF263238),
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
                        // if (!FFAppState().creditCard)
                        //   Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0, 0, 20, 0),
                        //           child: FFButtonWidget(
                        //             onPressed: () async {
                        //               setState(
                        //                   () => FFAppState().creditCard = true);
                        //               final value = await showDialog(
                        //                   context: context,
                        //                   builder: (_) {
                        //                     return AddCreditCardWidget();
                        //                   });
                        //               setState(() {
                        //                 creditCard = value;
                        //               });
                        //             },
                        //             text: 'Yes',
                        //             options: FFButtonOptions(
                        //               width: 157,
                        //               height: 50,
                        //               color: Color(0xFFEEF7FE),
                        //               textStyle: FlutterFlowTheme.of(context)
                        //                   .subtitle2
                        //                   .override(
                        //                     fontFamily: 'Segoe UI',
                        //                     color: Color(0xFF263238),
                        //                     useGoogleFonts: false,
                        //                   ),
                        //               borderSide: BorderSide(
                        //                 color: Colors.transparent,
                        //                 width: 1,
                        //               ),
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //         FFButtonWidget(
                        //           onPressed: () {
                        //             print('Button pressed ...');
                        //           },
                        //           text: 'No',
                        //           options: FFButtonOptions(
                        //             width: 157,
                        //             height: 50,
                        //             color: FlutterFlowTheme.of(context)
                        //                 .primaryColor,
                        //             textStyle: FlutterFlowTheme.of(context)
                        //                 .subtitle2
                        //                 .override(
                        //                   fontFamily: 'Segoe UI',
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .primaryBackground,
                        //                   useGoogleFonts: false,
                        //                 ),
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //               width: 1,
                        //             ),
                        //             borderRadius: BorderRadius.circular(8),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                      ],
                    ),
              personalLoan
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Personal Loan',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Add personal loan",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF37474F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 30, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          final value = await showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AddpersonaloanWidget();
                                              });
                                          setState(() {
                                            personalLoan = value;
                                          });
                                        },
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Untitled-9.png',
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 5),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                // print(FFAppState().personalLoanList[index]
                                //     ["personalLoanProvider"]);

                                return Container(
                                  width: 118,
                                  height: 134,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 22,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/creditcard.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/card.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        // FFAppState().creditCardList[index],
                                        FFAppState().personalLoanList[index]
                                            ["personalLoanProvider"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Image.asset(
                                        "assets/images/currency.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        FFAppState().personalLoanList[index]
                                            ["currentBalance"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: FFAppState().personalLoanList.length,
                              separatorBuilder: (_, index) {
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                          child: Row(
                            children: [
                              Text(
                                'Do you have a personal loan?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final value = await showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AddpersonaloanWidget();
                                        });
                                    setState(() {
                                      personalLoan = value;
                                      _personal = "yes";
                                    });
                                  },
                                  text: 'Yes',
                                  options: FFButtonOptions(
                                    width: 157,
                                    height: 50,
                                    color: _personal == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : Color(0xFFEEF7FE),
                                    textStyle: _personal == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Colors.white,
                                              useGoogleFonts: false,
                                            )
                                        : FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Color(0xFF263238),
                                              useGoogleFonts: false,
                                            ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _personal = "no";
                                  });
                                },
                                text: 'No',
                                options: FFButtonOptions(
                                  width: 157,
                                  height: 50,
                                  color: _personal == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : Color(0xFFEEF7FE),
                                  textStyle: _personal == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          )
                                      : FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF263238),
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
                        // if (!FFAppState().personalLoan)
                        //   Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0, 0, 20, 0),
                        //           child: FFButtonWidget(
                        //             onPressed: () async {
                        //               setState(() =>
                        //                   FFAppState().personalLoan = true);
                        //               final value = await showDialog(
                        //                   context: context,
                        //                   builder: (_) {
                        //                     return AddpersonaloanWidget();
                        //                   });
                        //               setState(() {
                        //                 personalLoan = value;
                        //               });
                        //             },
                        //             text: 'Yes',
                        //             options: FFButtonOptions(
                        //               width: 157,
                        //               height: 50,
                        //               color: Color(0xFFEEF7FE),
                        //               textStyle: FlutterFlowTheme.of(context)
                        //                   .subtitle2
                        //                   .override(
                        //                     fontFamily: 'Segoe UI',
                        //                     color: Color(0xFF263238),
                        //                     useGoogleFonts: false,
                        //                   ),
                        //               borderSide: BorderSide(
                        //                 color: Colors.transparent,
                        //                 width: 1,
                        //               ),
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //         FFButtonWidget(
                        //           onPressed: () {
                        //             setState(() =>
                        //                 FFAppState().personalLoan = false);
                        //           },
                        //           text: 'No',
                        //           options: FFButtonOptions(
                        //             width: 157,
                        //             height: 50,
                        //             color: FlutterFlowTheme.of(context)
                        //                 .primaryColor,
                        //             textStyle: FlutterFlowTheme.of(context)
                        //                 .subtitle2
                        //                 .override(
                        //                   fontFamily: 'Segoe UI',
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .primaryBtnText,
                        //                   useGoogleFonts: false,
                        //                 ),
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //               width: 1,
                        //             ),
                        //             borderRadius: BorderRadius.circular(8),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                      ],
                    ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     color: Color(0xFFEEF7FE),
              //   ),
              // ),
              carLoan
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Car Loan HP/PCP',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Add car loan HP/PCP",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF37474F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 30, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          final value = await showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AddCarloanWidget();
                                              });
                                          setState(() {
                                            carLoan = value;
                                          });
                                        },
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Untitled-9.png',
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 5),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Container(
                                  width: 118,
                                  height: 134,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 22,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/creditcard.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/card.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        // FFAppState().creditCardList[index],
                                        FFAppState().carLoanList[index]
                                            ["carLoanProvider"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Image.asset(
                                        "assets/images/currency.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        FFAppState().carLoanList[index]
                                            ["currentBalance"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: FFAppState().carLoanList.length,
                              separatorBuilder: (_, index) {
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                          child: Text(
                            'Do you have a Car Loan HP/PCP?',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final value = await showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AddCarloanWidget();
                                        });
                                    setState(() {
                                      carLoan = value;
                                      _car = "yes";
                                    });
                                  },
                                  text: 'Yes',
                                  options: FFButtonOptions(
                                    width: 157,
                                    height: 50,
                                    color: _car == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : Color(0xFFEEF7FE),
                                    textStyle: _car == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Colors.white,
                                              useGoogleFonts: false,
                                            )
                                        : FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Color(0xFF263238),
                                              useGoogleFonts: false,
                                            ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _car = "no";
                                  });
                                },
                                text: 'No',
                                options: FFButtonOptions(
                                  width: 157,
                                  height: 50,
                                  color: _car == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : Color(0xFFEEF7FE),
                                  textStyle: _car == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          )
                                      : FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF263238),
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
                        // if (FFAppState().carLoan)
                        //   Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0, 0, 20, 0),
                        //           child: FFButtonWidget(
                        //             onPressed: () async {
                        //               final value = await showDialog(
                        //                   context: context,
                        //                   builder: (_) {
                        //                     return AddCarloanWidget();
                        //                   });
                        //               setState(() {
                        //                 carLoan = value;
                        //               });
                        //             },
                        //             text: 'Yes',
                        //             options: FFButtonOptions(
                        //               width: 157,
                        //               height: 50,
                        //               color: FlutterFlowTheme.of(context)
                        //                   .primaryColor,
                        //               textStyle: FlutterFlowTheme.of(context)
                        //                   .subtitle2
                        //                   .override(
                        //                     fontFamily: 'Segoe UI',
                        //                     color: FlutterFlowTheme.of(context)
                        //                         .primaryBackground,
                        //                     useGoogleFonts: false,
                        //                   ),
                        //               borderSide: BorderSide(
                        //                 color: Colors.transparent,
                        //                 width: 1,
                        //               ),
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //         FFButtonWidget(
                        //           onPressed: () async {
                        //             setState(
                        //                 () => FFAppState().carLoan = false);
                        //           },
                        //           text: 'No',
                        //           options: FFButtonOptions(
                        //             width: 157,
                        //             height: 50,
                        //             color: Color(0xFFEEF7FE),
                        //             textStyle: FlutterFlowTheme.of(context)
                        //                 .subtitle2
                        //                 .override(
                        //                   fontFamily: 'Segoe UI',
                        //                   color: Color(0xFF263238),
                        //                   useGoogleFonts: false,
                        //                 ),
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //               width: 1,
                        //             ),
                        //             borderRadius: BorderRadius.circular(8),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // if (!FFAppState().carLoan)
                        //   Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0, 0, 20, 0),
                        //           child: FFButtonWidget(
                        //             onPressed: () async {
                        //               setState(
                        //                   () => FFAppState().carLoan = true);
                        //               final value = await showDialog(
                        //                   context: context,
                        //                   builder: (_) {
                        //                     return AddCarloanWidget();
                        //                   });
                        //               setState(() {
                        //                 carLoan = value;
                        //               });
                        //             },
                        //             text: 'Yes',
                        //             options: FFButtonOptions(
                        //               width: 157,
                        //               height: 50,
                        //               color: Color(0xFFEEF7FE),
                        //               textStyle: FlutterFlowTheme.of(context)
                        //                   .subtitle2
                        //                   .override(
                        //                     fontFamily: 'Segoe UI',
                        //                     color: Color(0xFF263238),
                        //                     useGoogleFonts: false,
                        //                   ),
                        //               borderSide: BorderSide(
                        //                 color: Colors.transparent,
                        //                 width: 1,
                        //               ),
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //         FFButtonWidget(
                        //           onPressed: () {
                        //             print('Button pressed ...');
                        //           },
                        //           text: 'No',
                        //           options: FFButtonOptions(
                        //             width: 157,
                        //             height: 50,
                        //             color: FlutterFlowTheme.of(context)
                        //                 .primaryColor,
                        //             textStyle: FlutterFlowTheme.of(context)
                        //                 .subtitle2
                        //                 .override(
                        //                   fontFamily: 'Segoe UI',
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .primaryBackground,
                        //                   useGoogleFonts: false,
                        //                 ),
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //               width: 1,
                        //             ),
                        //             borderRadius: BorderRadius.circular(8),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                      ],
                    ),
              storeCard
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'HP/PCP/Store Loan',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Add HP/PCP/Store loan",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF37474F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 30, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().storeCard = true);
                                          final value = await showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AddHPPCPStoreCardloanWidget();
                                              });
                                          setState(() {
                                            carLoan = value;
                                          });
                                        },
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Untitled-9.png',
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 5),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Container(
                                  width: 118,
                                  height: 134,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 22,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/creditcard.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/card.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        // FFAppState().creditCardList[index],
                                        FFAppState().storeCardList[index]
                                            ["storeLoanProvider"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Image.asset(
                                        "assets/images/currency.png",
                                        height: 17,
                                        width: 17,
                                      ),
                                      Text(
                                        FFAppState().storeCardList[index]
                                            ["currentBalance"],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: FFAppState().storeCardList.length,
                              separatorBuilder: (_, index) {
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                          child: Text(
                            'Do you have a HP/PCP/Store card?',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final value = await showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AddHPPCPStoreCardloanWidget();
                                        });
                                    setState(() {
                                      storeCard = value;
                                      _store = "yes";
                                    });
                                  },
                                  text: 'Yes',
                                  options: FFButtonOptions(
                                    width: 157,
                                    height: 50,
                                    color: _store == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : Color(0xFFEEF7FE),
                                    textStyle: _store == "yes"
                                        ? FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Colors.white,
                                              useGoogleFonts: false,
                                            )
                                        : FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Color(0xFF263238),
                                              useGoogleFonts: false,
                                            ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _store = "no";
                                  });
                                },
                                text: 'No',
                                options: FFButtonOptions(
                                  width: 157,
                                  height: 50,
                                  color: _store == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : Color(0xFFEEF7FE),
                                  textStyle: _store == "no"
                                      ? FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          )
                                      : FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF263238),
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
                        // if (FFAppState().storeCard)
                        //   Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0, 0, 20, 0),
                        //           child: FFButtonWidget(
                        //             onPressed: () async {
                        //               final value = await showDialog(
                        //                   context: context,
                        //                   builder: (_) {
                        //                     return AddHPPCPStoreCardloanWidget();
                        //                   });
                        //               setState(() {
                        //                 storeCard = value;
                        //               });
                        //             },
                        //             text: 'Yes',
                        //             options: FFButtonOptions(
                        //               width: 157,
                        //               height: 50,
                        //               color: FlutterFlowTheme.of(context)
                        //                   .primaryColor,
                        //               textStyle: FlutterFlowTheme.of(context)
                        //                   .subtitle2
                        //                   .override(
                        //                     fontFamily: 'Segoe UI',
                        //                     color: FlutterFlowTheme.of(context)
                        //                         .primaryBtnText,
                        //                     useGoogleFonts: false,
                        //                   ),
                        //               borderSide: BorderSide(
                        //                 color: Colors.transparent,
                        //                 width: 1,
                        //               ),
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //         FFButtonWidget(
                        //           onPressed: () async {
                        //             setState(
                        //                 () => FFAppState().storeCard = false);
                        //           },
                        //           text: 'No',
                        //           options: FFButtonOptions(
                        //             width: 157,
                        //             height: 50,
                        //             color: Color(0xFFEEF7FE),
                        //             textStyle: FlutterFlowTheme.of(context)
                        //                 .subtitle2
                        //                 .override(
                        //                   fontFamily: 'Segoe UI',
                        //                   color: Color(0xFF263238),
                        //                   useGoogleFonts: false,
                        //                 ),
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //               width: 1,
                        //             ),
                        //             borderRadius: BorderRadius.circular(8),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // if (!FFAppState().storeCard)
                        //   Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0, 0, 20, 0),
                        //           child: FFButtonWidget(
                        //             onPressed: () async {
                        //               setState(
                        //                   () => FFAppState().storeCard = true);
                        //               final value = await showDialog(
                        //                   context: context,
                        //                   builder: (_) {
                        //                     return AddHPPCPStoreCardloanWidget();
                        //                   });
                        //               setState(() {
                        //                 storeCard = value;
                        //               });
                        //             },
                        //             text: 'Yes',
                        //             options: FFButtonOptions(
                        //               width: 157,
                        //               height: 50,
                        //               color: Color(0xFFEEF7FE),
                        //               textStyle: FlutterFlowTheme.of(context)
                        //                   .subtitle2
                        //                   .override(
                        //                     fontFamily: 'Segoe UI',
                        //                     color: Color(0xFF263238),
                        //                     useGoogleFonts: false,
                        //                   ),
                        //               borderSide: BorderSide(
                        //                 color: Colors.transparent,
                        //                 width: 1,
                        //               ),
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //         FFButtonWidget(
                        //           onPressed: () {
                        //             print('Button pressed ...');
                        //           },
                        //           text: 'No',
                        //           options: FFButtonOptions(
                        //             width: 157,
                        //             height: 50,
                        //             color: FlutterFlowTheme.of(context)
                        //                 .primaryColor,
                        //             textStyle: FlutterFlowTheme.of(context)
                        //                 .subtitle2
                        //                 .override(
                        //                   fontFamily: 'Segoe UI',
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .primaryBackground,
                        //                   useGoogleFonts: false,
                        //                 ),
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //               width: 1,
                        //             ),
                        //             borderRadius: BorderRadius.circular(8),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                      ],
                    ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 60, 15, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 111,
                      height: 26,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: Image.asset(
                            'assets/images/Group_25034.png',
                          ).image,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: Image.asset(
                                  'assets/images/Add_Button_(1).png',
                                ).image,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              if (creditCard) {
                                Navigator.pop(context, true);
                              } else {
                                Navigator.pop(context, false);
                              }
                            },
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/Add_Button_(2).png',
                                  ).image,
                                ),
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
        ],
      ),
    );
  }
}
