import 'package:dotted_line/dotted_line.dart';
import 'package:freedom/applicant1documents/add_documents.dart';
import 'package:freedom/components/current_property_details.dart';
import 'package:freedom/components/form_2/add_property.dart';
import 'package:freedom/components/outstanding_details_widget.dart';
import 'package:freedom/current_address_details.dart';
import 'package:freedom/my_application_summary.dart';
import 'package:freedom/property_details/property_details_widget.dart';

import '../components/add_address_widget.dart';
import '../components/applicant_details_widget.dart';
import '../components/occupation_details_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Form2Widget extends StatefulWidget {
  final String address;
  final String postcode;
  final String mortBalance;
  final String remMort;
  final String propValue;
  final String mortLender;
  const Form2Widget(
      {Key? key,
      required this.address,
      required this.postcode,
      required this.mortBalance,
      required this.remMort,
      required this.propValue,
      required this.mortLender})
      : super(key: key);

  @override
  _Form2WidgetState createState() => _Form2WidgetState();
}

class _Form2WidgetState extends State<Form2Widget> {
  PageController? pageViewController;
  String? dropDownValue;
  TextEditingController? textController;
  List<bool> docs = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 281,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Group_230.png',
                  ).image,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 25, 0, 0),
                    child: Text(
                      valueOrDefault<String>(
                        '${valueOrDefault<String>(
                          FFAppState().currentForm2PageNumber.toString(),
                          '1',
                        )}/6',
                        '1/6',
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Segoe UI',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                if (FFAppState().currentForm2PageNumber == 1)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Property Summary',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                if (FFAppState().currentForm2PageNumber == 2)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Detailed documents summary',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                // if (FFAppState().currentFormPageNumber == 3)
                //   Expanded(
                //     child: Padding(
                //       padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                //       child: Text(
                //         'Address',
                //         style: FlutterFlowTheme.of(context).bodyText1.override(
                //               fontFamily: 'Segoe UI',
                //               color: Colors.white,
                //               fontSize: 24,
                //               useGoogleFonts: false,
                //             ),
                //       ),
                //     ),
                //   ),
                // if (FFAppState().currentFormPageNumber == 4)
                //   Expanded(
                //     child: Padding(
                //       padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                //       child: Text(
                //         'Occupation Details',
                //         style: FlutterFlowTheme.of(context).bodyText1.override(
                //               fontFamily: 'Segoe UI',
                //               color: Colors.white,
                //               fontSize: 24,
                //               useGoogleFonts: false,
                //             ),
                //       ),
                //     ),
                //   ),
                // if (FFAppState().currentFormPageNumber == 5)
                //   Expanded(
                //     child: Padding(
                //       padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                //       child: Text(
                //         'Dependent Details',
                //         style: FlutterFlowTheme.of(context).bodyText1.override(
                //               fontFamily: 'Segoe UI',
                //               color: Colors.white,
                //               fontSize: 24,
                //               useGoogleFonts: false,
                //             ),
                //       ),
                //     ),
                //   ),
                // if (FFAppState().currentFormPageNumber == 6)
                //   Expanded(
                //     child: Padding(
                //       padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                //       child: Text(
                //         'Outstanding Details',
                //         style: FlutterFlowTheme.of(context).bodyText1.override(
                //               fontFamily: 'Segoe UI',
                //               color: Colors.white,
                //               fontSize: 24,
                //               useGoogleFonts: false,
                //             ),
                //       ),
                //     ),
                //   ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                  child: LinearPercentIndicator(
                    percent: valueOrDefault<double>(
                      functions.progressCalculator(
                          6, FFAppState().currentForm2PageNumber),
                      1.666,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    lineHeight: 9,
                    animation: true,
                    progressColor: Colors.white,
                    backgroundColor: Color(0x7AEEF7FE),
                    barRadius: Radius.circular(30),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        color: Color(0x0C000000),
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageViewController ??= PageController(
                          initialPage: min(
                              valueOrDefault<int>(
                                functions.subtractor(
                                    FFAppState().currentForm2PageNumber, 1),
                                0,
                              ),
                              5),
                        ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 15, 15, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Padding(
                                        //   padding:
                                        //       EdgeInsetsDirectional.fromSTEB(
                                        //           0, 20, 0, 0),
                                        //   child: Container(
                                        //     height: 50,
                                        //     width: 50,
                                        //     padding: EdgeInsets.all(13),
                                        //     decoration: BoxDecoration(
                                        //       color: Color(0xFFEEF7FE),
                                        //       borderRadius:
                                        //           BorderRadius.circular(10),
                                        //     ),
                                        //     child: Image.asset(
                                        //       "assets/images/building3.png",
                                        //     ),
                                        //   ),
                                        // ),

                                        // AddProperty(
                                        //   address: widget.address,
                                        //   postcode: widget.postcode,
                                        // ),

                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 16,
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.05),
                                                  offset: Offset(0, 4),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        padding:
                                                            EdgeInsets.all(13),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Image.asset(
                                                          "assets/images/building3.png",
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        FFAppState().addproperty
                                                            ? "Current Residence"
                                                            : 'Add property',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: Color(
                                                                      0xFF4B65B2),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Spacer(),
                                                      FFAppState().addproperty
                                                          ? Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {},
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/edit.png",
                                                                    height: 18,
                                                                    width: 18,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 15,
                                                                ),
                                                                InkWell(
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/delete.png",
                                                                    height: 18,
                                                                    width: 18,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              ],
                                                            )
                                                          : InkWell(
                                                              onTap: () async {
                                                                final value =
                                                                    await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  barrierColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height *
                                                                                1,
                                                                        child:
                                                                            CurrentPropertyDetails(
                                                                          address:
                                                                              widget.address,
                                                                          postcode:
                                                                              widget.postcode,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                setState(() {
                                                                  FFAppState()
                                                                          .addproperty =
                                                                      value;
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 26.67,
                                                                height: 26.67,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF4B65B2),
                                                                      Color(
                                                                          0xFF13BBE6)
                                                                    ],
                                                                    stops: [
                                                                      0,
                                                                      1
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            0),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 18,
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  if (FFAppState().addproperty)
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      20,
                                                                      0,
                                                                      10),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    13),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEF7FE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      WidgetSpan(
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/building3.png",
                                                                          height:
                                                                              19,
                                                                          width:
                                                                              19,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            "  Address",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Seoge UI',
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 12,
                                                                ),
                                                                Text(
                                                                  widget
                                                                      .address,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        color: Color(
                                                                            0xff979797),
                                                                        fontFamily:
                                                                            'Seoge UI',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  widget
                                                                      .postcode,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        color: Color(
                                                                            0xff979797),
                                                                        fontFamily:
                                                                            'Seoge UI',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      WidgetSpan(
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/mortbalance.png",
                                                                          height:
                                                                              19,
                                                                          width:
                                                                              19,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            "  Mortagage Balance",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              color: Color(0xff979797),
                                                                              fontFamily: 'Seoge UI',
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                  child: Text(
                                                                    widget
                                                                        .mortBalance,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Seoge UI',
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            //
                                                            //
                                                            //
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      WidgetSpan(
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/remmort.png",
                                                                          height:
                                                                              19,
                                                                          width:
                                                                              19,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            "  Remaining term of Mortagage",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              color: Color(0xff979797),
                                                                              fontFamily: 'Seoge UI',
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                  child: Text(
                                                                    widget
                                                                        .remMort,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Seoge UI',
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      WidgetSpan(
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/propvalue.png",
                                                                          height:
                                                                              19,
                                                                          width:
                                                                              19,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            "  Property Value (Approx.)",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              color: Color(0xff979797),
                                                                              fontFamily: 'Seoge UI',
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                  child: Text(
                                                                    widget
                                                                        .propValue,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Seoge UI',
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            //
                                                            //
                                                            //
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      WidgetSpan(
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/mortlender.png",
                                                                          height:
                                                                              19,
                                                                          width:
                                                                              19,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            "  Mortagage Lender                     ",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              color: Color(0xff979797),
                                                                              fontFamily: 'Seoge UI',
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                  child: Text(
                                                                    widget
                                                                        .mortLender,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Seoge UI',
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        // if (FFAppState().whatAreYouLookingFor ==
                                        //     'Purchase')
                                        //   Padding(
                                        //     padding:
                                        //         EdgeInsetsDirectional.fromSTEB(
                                        //             0, 15, 0, 15),
                                        //     child: Row(
                                        //       mainAxisSize: MainAxisSize.max,
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       children: [
                                        //         Container(
                                        //           width: 157,
                                        //           height: 50,
                                        //           decoration: BoxDecoration(
                                        //             color: Color(0xFF4B65B2),
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     10),
                                        //           ),
                                        //           child: Align(
                                        //             alignment:
                                        //                 AlignmentDirectional(
                                        //                     0, 0),
                                        //             child: Text(
                                        //               'Purchase',
                                        //               textAlign:
                                        //                   TextAlign.center,
                                        //               style:
                                        //                   FlutterFlowTheme.of(
                                        //                           context)
                                        //                       .bodyText1
                                        //                       .override(
                                        //                         fontFamily:
                                        //                             'Segoe UI',
                                        //                         color: FlutterFlowTheme.of(
                                        //                                 context)
                                        //                             .primaryBackground,
                                        //                         useGoogleFonts:
                                        //                             false,
                                        //                       ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         InkWell(
                                        //           onTap: () async {
                                        //             setState(() => FFAppState()
                                        //                     .whatAreYouLookingFor =
                                        //                 'Remortgage');
                                        //           },
                                        //           child: Container(
                                        //             width: 157,
                                        //             height: 50,
                                        //             decoration: BoxDecoration(
                                        //               color: Color(0xFFEEF7FE),
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       10),
                                        //             ),
                                        //             child: Align(
                                        //               alignment:
                                        //                   AlignmentDirectional(
                                        //                       0, 0),
                                        //               child: Text(
                                        //                 'Remortgage',
                                        //                 textAlign:
                                        //                     TextAlign.center,
                                        //                 style:
                                        //                     FlutterFlowTheme.of(
                                        //                             context)
                                        //                         .bodyText1,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // if (FFAppState().whatAreYouLookingFor ==
                                        //     'Remortgage')
                                        //   Padding(
                                        //     padding:
                                        //         EdgeInsetsDirectional.fromSTEB(
                                        //             0, 15, 0, 15),
                                        //     child: Row(
                                        //       mainAxisSize: MainAxisSize.max,
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       children: [
                                        //         InkWell(
                                        //           onTap: () async {
                                        //             setState(() => FFAppState()
                                        //                     .whatAreYouLookingFor =
                                        //                 'Purchase');
                                        //           },
                                        //           child: Container(
                                        //             width: 157,
                                        //             height: 50,
                                        //             decoration: BoxDecoration(
                                        //               color: Color(0xFFEEF7FE),
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       10),
                                        //             ),
                                        //             child: Align(
                                        //               alignment:
                                        //                   AlignmentDirectional(
                                        //                       0, 0),
                                        //               child: Text(
                                        //                 'Purchase',
                                        //                 textAlign:
                                        //                     TextAlign.center,
                                        //                 style:
                                        //                     FlutterFlowTheme.of(
                                        //                             context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryText,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //           width: 157,
                                        //           height: 50,
                                        //           decoration: BoxDecoration(
                                        //             color: Color(0xFF4B65B2),
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     10),
                                        //           ),
                                        //           child: Align(
                                        //             alignment:
                                        //                 AlignmentDirectional(
                                        //                     0, 0),
                                        //             child: Text(
                                        //               'Remortgage',
                                        //               textAlign:
                                        //                   TextAlign.center,
                                        //               style: FlutterFlowTheme
                                        //                       .of(context)
                                        //                   .bodyText1
                                        //                   .override(
                                        //                     fontFamily:
                                        //                         'Segoe UI',
                                        //                     color: Colors.white,
                                        //                     useGoogleFonts:
                                        //                         false,
                                        //                   ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // Text(
                                        //   'Select your option below',
                                        //   style: FlutterFlowTheme.of(context)
                                        //       .bodyText1
                                        //       .override(
                                        //         fontFamily: 'Segoe UI',
                                        //         fontSize: 16,
                                        //         useGoogleFonts: false,
                                        //         lineHeight: 2,
                                        //       ),
                                        // ),
                                        // if (FFAppState().whatAreYouLookingFor ==
                                        //     'Purchase')
                                        //   Padding(
                                        //     padding:
                                        //         EdgeInsetsDirectional.fromSTEB(
                                        //             0, 15, 0, 0),
                                        //     child: Column(
                                        //       mainAxisSize: MainAxisSize.max,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.stretch,
                                        //       children: [
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected !=
                                        //             'First Time Buyer')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: InkWell(
                                        //               onTap: () async {
                                        //                 setState(() => FFAppState()
                                        //                         .PurchaseOptionSelected =
                                        //                     'First Time Buyer');
                                        //               },
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 50,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color:
                                        //                       Color(0xFFEEF7FE),
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: Align(
                                        //                   alignment:
                                        //                       AlignmentDirectional(
                                        //                           -1, 0),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsetsDirectional
                                        //                             .fromSTEB(
                                        //                                 15,
                                        //                                 0,
                                        //                                 0,
                                        //                                 0),
                                        //                     child: Text(
                                        //                       'First Time Buyer',
                                        //                       style: FlutterFlowTheme
                                        //                               .of(context)
                                        //                           .bodyText1
                                        //                           .override(
                                        //                             fontFamily:
                                        //                                 'Segoe UI',
                                        //                             fontSize:
                                        //                                 16,
                                        //                             useGoogleFonts:
                                        //                                 false,
                                        //                           ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected ==
                                        //             'First Time Buyer')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: Container(
                                        //               width: 100,
                                        //               height: 50,
                                        //               decoration: BoxDecoration(
                                        //                 color:
                                        //                     Color(0xFF4B65B2),
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               child: Align(
                                        //                 alignment:
                                        //                     AlignmentDirectional(
                                        //                         -1, 0),
                                        //                 child: Padding(
                                        //                   padding:
                                        //                       EdgeInsetsDirectional
                                        //                           .fromSTEB(15,
                                        //                               0, 0, 0),
                                        //                   child: Text(
                                        //                     'First Time Buyer',
                                        //                     style: FlutterFlowTheme
                                        //                             .of(context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryBackground,
                                        //                           fontSize: 16,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected !=
                                        //             'Help to Buy')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: InkWell(
                                        //               onTap: () async {
                                        //                 setState(() => FFAppState()
                                        //                         .PurchaseOptionSelected =
                                        //                     'Help to Buy');
                                        //               },
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 50,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color:
                                        //                       Color(0xFFEEF7FE),
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: Align(
                                        //                   alignment:
                                        //                       AlignmentDirectional(
                                        //                           -1, 0),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsetsDirectional
                                        //                             .fromSTEB(
                                        //                                 15,
                                        //                                 0,
                                        //                                 0,
                                        //                                 0),
                                        //                     child: Text(
                                        //                       'Help to Buy',
                                        //                       style: FlutterFlowTheme
                                        //                               .of(context)
                                        //                           .bodyText1
                                        //                           .override(
                                        //                             fontFamily:
                                        //                                 'Segoe UI',
                                        //                             fontSize:
                                        //                                 16,
                                        //                             useGoogleFonts:
                                        //                                 false,
                                        //                           ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected ==
                                        //             'Help to Buy')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: Container(
                                        //               width: 100,
                                        //               height: 50,
                                        //               decoration: BoxDecoration(
                                        //                 color:
                                        //                     Color(0xFF4B65B2),
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               child: Align(
                                        //                 alignment:
                                        //                     AlignmentDirectional(
                                        //                         -1, 0),
                                        //                 child: Padding(
                                        //                   padding:
                                        //                       EdgeInsetsDirectional
                                        //                           .fromSTEB(15,
                                        //                               0, 0, 0),
                                        //                   child: Text(
                                        //                     'Help to Buy',
                                        //                     style: FlutterFlowTheme
                                        //                             .of(context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryBackground,
                                        //                           fontSize: 16,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected !=
                                        //             'Home Mover')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: InkWell(
                                        //               onTap: () async {
                                        //                 setState(() => FFAppState()
                                        //                         .PurchaseOptionSelected =
                                        //                     'Home Mover');
                                        //               },
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 50,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color:
                                        //                       Color(0xFFEEF7FE),
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: Align(
                                        //                   alignment:
                                        //                       AlignmentDirectional(
                                        //                           -1, 0),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsetsDirectional
                                        //                             .fromSTEB(
                                        //                                 15,
                                        //                                 0,
                                        //                                 0,
                                        //                                 0),
                                        //                     child: Text(
                                        //                       'Home Mover',
                                        //                       style: FlutterFlowTheme
                                        //                               .of(context)
                                        //                           .bodyText1
                                        //                           .override(
                                        //                             fontFamily:
                                        //                                 'Segoe UI',
                                        //                             fontSize:
                                        //                                 16,
                                        //                             useGoogleFonts:
                                        //                                 false,
                                        //                           ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected ==
                                        //             'Home Mover')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: Container(
                                        //               width: 100,
                                        //               height: 50,
                                        //               decoration: BoxDecoration(
                                        //                 color:
                                        //                     Color(0xFF4B65B2),
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               child: Align(
                                        //                 alignment:
                                        //                     AlignmentDirectional(
                                        //                         -1, 0),
                                        //                 child: Padding(
                                        //                   padding:
                                        //                       EdgeInsetsDirectional
                                        //                           .fromSTEB(15,
                                        //                               0, 0, 0),
                                        //                   child: Text(
                                        //                     'Home Mover',
                                        //                     style: FlutterFlowTheme
                                        //                             .of(context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryBackground,
                                        //                           fontSize: 16,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected !=
                                        //             'Buy to Let')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: InkWell(
                                        //               onTap: () async {
                                        //                 setState(() => FFAppState()
                                        //                         .PurchaseOptionSelected =
                                        //                     'Buy to Let');
                                        //               },
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 50,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color:
                                        //                       Color(0xFFEEF7FE),
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: Align(
                                        //                   alignment:
                                        //                       AlignmentDirectional(
                                        //                           -1, 0),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsetsDirectional
                                        //                             .fromSTEB(
                                        //                                 15,
                                        //                                 0,
                                        //                                 0,
                                        //                                 0),
                                        //                     child: Text(
                                        //                       'Buy to Let',
                                        //                       style: FlutterFlowTheme
                                        //                               .of(context)
                                        //                           .bodyText1
                                        //                           .override(
                                        //                             fontFamily:
                                        //                                 'Segoe UI',
                                        //                             fontSize:
                                        //                                 16,
                                        //                             useGoogleFonts:
                                        //                                 false,
                                        //                           ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .PurchaseOptionSelected ==
                                        //             'Buy to Let')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: Container(
                                        //               width: 100,
                                        //               height: 50,
                                        //               decoration: BoxDecoration(
                                        //                 color:
                                        //                     Color(0xFF4B65B2),
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               child: Align(
                                        //                 alignment:
                                        //                     AlignmentDirectional(
                                        //                         -1, 0),
                                        //                 child: Padding(
                                        //                   padding:
                                        //                       EdgeInsetsDirectional
                                        //                           .fromSTEB(15,
                                        //                               0, 0, 0),
                                        //                   child: Text(
                                        //                     'Buy to Let',
                                        //                     style: FlutterFlowTheme
                                        //                             .of(context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryBackground,
                                        //                           fontSize: 16,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // if (FFAppState().whatAreYouLookingFor ==
                                        //     'Remortgage')
                                        //   Padding(
                                        //     padding:
                                        //         EdgeInsetsDirectional.fromSTEB(
                                        //             0, 15, 0, 0),
                                        //     child: Column(
                                        //       mainAxisSize: MainAxisSize.max,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.stretch,
                                        //       children: [
                                        //         if (FFAppState()
                                        //                 .RemortgageOptionSelected !=
                                        //             'Residential Remortgage')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: InkWell(
                                        //               onTap: () async {
                                        //                 setState(() => FFAppState()
                                        //                         .RemortgageOptionSelected =
                                        //                     'Residential Remortgage');
                                        //               },
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 50,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color:
                                        //                       Color(0xFFEEF7FE),
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: Align(
                                        //                   alignment:
                                        //                       AlignmentDirectional(
                                        //                           -1, 0),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsetsDirectional
                                        //                             .fromSTEB(
                                        //                                 15,
                                        //                                 0,
                                        //                                 0,
                                        //                                 0),
                                        //                     child: Text(
                                        //                       'Residential Remortgage',
                                        //                       style: FlutterFlowTheme
                                        //                               .of(context)
                                        //                           .bodyText1
                                        //                           .override(
                                        //                             fontFamily:
                                        //                                 'Segoe UI',
                                        //                             fontSize:
                                        //                                 16,
                                        //                             useGoogleFonts:
                                        //                                 false,
                                        //                           ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .RemortgageOptionSelected ==
                                        //             'Residential Remortgage')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: Container(
                                        //               width: 100,
                                        //               height: 50,
                                        //               decoration: BoxDecoration(
                                        //                 color:
                                        //                     Color(0xFF4B65B2),
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               child: Align(
                                        //                 alignment:
                                        //                     AlignmentDirectional(
                                        //                         -1, 0),
                                        //                 child: Padding(
                                        //                   padding:
                                        //                       EdgeInsetsDirectional
                                        //                           .fromSTEB(15,
                                        //                               0, 0, 0),
                                        //                   child: Text(
                                        //                     'Residential Remortgage',
                                        //                     style: FlutterFlowTheme
                                        //                             .of(context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryBackground,
                                        //                           fontSize: 16,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .RemortgageOptionSelected !=
                                        //             'Buy-to-let Remortgage')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: InkWell(
                                        //               onTap: () async {
                                        //                 setState(() => FFAppState()
                                        //                         .RemortgageOptionSelected =
                                        //                     'Buy-to-let Remortgage');
                                        //               },
                                        //               child: Container(
                                        //                 width: 100,
                                        //                 height: 50,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color:
                                        //                       Color(0xFFEEF7FE),
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: Align(
                                        //                   alignment:
                                        //                       AlignmentDirectional(
                                        //                           -1, 0),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsetsDirectional
                                        //                             .fromSTEB(
                                        //                                 15,
                                        //                                 0,
                                        //                                 0,
                                        //                                 0),
                                        //                     child: Text(
                                        //                       'Buy-to-let Remortgage',
                                        //                       style: FlutterFlowTheme
                                        //                               .of(context)
                                        //                           .bodyText1
                                        //                           .override(
                                        //                             fontFamily:
                                        //                                 'Segoe UI',
                                        //                             fontSize:
                                        //                                 16,
                                        //                             useGoogleFonts:
                                        //                                 false,
                                        //                           ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         if (FFAppState()
                                        //                 .RemortgageOptionSelected ==
                                        //             'Buy-to-let Remortgage')
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsetsDirectional
                                        //                     .fromSTEB(
                                        //                         0, 0, 0, 15),
                                        //             child: Container(
                                        //               width: 100,
                                        //               height: 50,
                                        //               decoration: BoxDecoration(
                                        //                 color:
                                        //                     Color(0xFF4B65B2),
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               child: Align(
                                        //                 alignment:
                                        //                     AlignmentDirectional(
                                        //                         -1, 0),
                                        //                 child: Padding(
                                        //                   padding:
                                        //                       EdgeInsetsDirectional
                                        //                           .fromSTEB(15,
                                        //                               0, 0, 0),
                                        //                   child: Text(
                                        //                     'Buy-to-let Remortgage',
                                        //                     style: FlutterFlowTheme
                                        //                             .of(context)
                                        //                         .bodyText1
                                        //                         .override(
                                        //                           fontFamily:
                                        //                               'Segoe UI',
                                        //                           color: FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .primaryBackground,
                                        //                           fontSize: 16,
                                        //                           useGoogleFonts:
                                        //                               false,
                                        //                         ),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //       ],
                                        //     ),
                                        //   ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 15, 15, 30),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 111,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              setState(() => FFAppState()
                                                  .currentForm2PageNumber = 2);
                                              await pageViewController
                                                  ?.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Container(
                                              width: 42,
                                              height: 42,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            padding: EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEF7FE),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Image.asset(
                                              "assets/images/upload.png",
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Uplaod the below documents ",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Seoge UI',
                                                  color: Color(0xFF979797),
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 16,
                                            color: Color(0x0D000000),
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF979797)
                                              .withOpacity(0.5),
                                          width: 0.25,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Applicant 1 Documents',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Seoge UI',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Text(
                                                        'Name',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Seoge UI',
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final values =
                                                        await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                1,
                                                            child:
                                                                AddDocuments(),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    setState(() {
                                                      docs = values;
                                                    });
                                                  },
                                                  // onTap: () {
                                                  //   Navigator.push(
                                                  //       context,
                                                  //       MaterialPageRoute(
                                                  //           builder: (_) =>
                                                  //               Applicant1documentsWidget()));
                                                  // },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Untitled-3.png',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              child: DottedLine(
                                                dashColor: Color(0xff263238)
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            ListTile(
                                              visualDensity:
                                                  VisualDensity(vertical: -3),
                                              leading: FFAppState()
                                                      .identityDoc
                                                      .isEmpty
                                                  ? Image.asset(
                                                      "assets/images/not_verified.png")
                                                  : Image.asset(
                                                      "assets/images/verified_icon.png"),
                                              minLeadingWidth: 20,
                                              title: Text(
                                                "Identity Document",
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Seoge UI',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            ListTile(
                                              visualDensity:
                                                  VisualDensity(vertical: -3),
                                              leading: FFAppState()
                                                          .addressProof
                                                          .length ==
                                                      0
                                                  ? Image.asset(
                                                      "assets/images/not_verified.png")
                                                  : Image.asset(
                                                      "assets/images/verified_icon.png"),
                                              minLeadingWidth: 20,
                                              title: Text(
                                                "Proof of Address",
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Seoge UI',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            ListTile(
                                              visualDensity:
                                                  VisualDensity(vertical: -3),
                                              leading: FFAppState()
                                                          .employmentSlip
                                                          .length ==
                                                      0
                                                  ? Image.asset(
                                                      "assets/images/not_verified.png")
                                                  : Image.asset(
                                                      "assets/images/verified_icon.png"),
                                              minLeadingWidth: 20,
                                              title: Text(
                                                "Employement",
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Seoge UI',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            ListTile(
                                              visualDensity:
                                                  VisualDensity(vertical: -3),
                                              leading: FFAppState()
                                                          .bankStatement
                                                          .length ==
                                                      0
                                                  ? Image.asset(
                                                      "assets/images/not_verified.png")
                                                  : Image.asset(
                                                      "assets/images/verified_icon.png"),
                                              minLeadingWidth: 20,
                                              title: Text(
                                                "Bank Statement",
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Seoge UI',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 5),
                                    //   child: Text(
                                    //     'Add the last 3 years of your address history',
                                    //     style: FlutterFlowTheme.of(context)
                                    //         .bodyText1
                                    //         .override(
                                    //           fontFamily: 'Segoe UI',
                                    //           fontSize: 16,
                                    //           useGoogleFonts: false,
                                    //         ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 15),
                                    //   child: Text(
                                    //     'Add your addresses in order, starting with the most recent. You can add UK and foreign addresses.\n',
                                    //     style: FlutterFlowTheme.of(context)
                                    //         .bodyText1
                                    //         .override(
                                    //           fontFamily: 'Segoe UI',
                                    //           color: Color(0xFF979797),
                                    //           fontWeight: FontWeight.normal,
                                    //           useGoogleFonts: false,
                                    //         ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 15, 0, 0),
                                    //   child: Text(
                                    //     'Applicant Details',
                                    //     style: FlutterFlowTheme.of(context)
                                    //         .bodyText1
                                    //         .override(
                                    //           fontFamily: 'Segoe UI',
                                    //           fontSize: 18,
                                    //           useGoogleFonts: false,
                                    //         ),
                                    //   ),
                                    // ),
                                    // if (FFAppState().numberOfApplicants ==
                                    //     'Single Applicant')
                                    //   Padding(
                                    //     padding: EdgeInsetsDirectional.fromSTEB(
                                    //         0, 15, 0, 0),
                                    //     child: InkWell(
                                    //       onTap: () async {
                                    //         await showModalBottomSheet(
                                    //           isScrollControlled: true,
                                    //           backgroundColor:
                                    //               FlutterFlowTheme.of(context)
                                    //                   .primaryBackground,
                                    //           barrierColor:
                                    //               FlutterFlowTheme.of(context)
                                    //                   .primaryBackground,
                                    //           context: context,
                                    //           builder: (context) {
                                    //             return Padding(
                                    //               padding:
                                    //                   MediaQuery.of(context)
                                    //                       .viewInsets,
                                    //               child: Container(
                                    //                 height:
                                    //                     MediaQuery.of(context)
                                    //                             .size
                                    //                             .height *
                                    //                         1,
                                    //                 child: AddAddressWidget(),
                                    //               ),
                                    //             );
                                    //           },
                                    //         );
                                    //       },
                                    //       child: Container(
                                    //         decoration: BoxDecoration(
                                    //           color: Colors.white,
                                    //           boxShadow: [
                                    //             BoxShadow(
                                    //               blurRadius: 16,
                                    //               color: Color(0x0C000000),
                                    //               offset: Offset(0, 4),
                                    //             )
                                    //           ],
                                    //           borderRadius:
                                    //               BorderRadius.circular(10),
                                    //         ),
                                    //         child: Padding(
                                    //           padding: EdgeInsetsDirectional
                                    //               .fromSTEB(0, 10, 0, 10),
                                    //           child: Row(
                                    //             mainAxisSize: MainAxisSize.max,
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment
                                    //                     .spaceAround,
                                    //             children: [
                                    //               Column(
                                    //                 mainAxisSize:
                                    //                     MainAxisSize.max,
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   Text(
                                    //                     'Applicant  Address',
                                    //                     style:
                                    //                         FlutterFlowTheme.of(
                                    //                                 context)
                                    //                             .bodyText1
                                    //                             .override(
                                    //                               fontFamily:
                                    //                                   'Segoe UI',
                                    //                               color: Color(
                                    //                                   0xFF4B65B2),
                                    //                               useGoogleFonts:
                                    //                                   false,
                                    //                             ),
                                    //                   ),
                                    //                   Text(
                                    //                     'Hello World',
                                    //                     style:
                                    //                         FlutterFlowTheme.of(
                                    //                                 context)
                                    //                             .bodyText1
                                    //                             .override(
                                    //                               fontFamily:
                                    //                                   'Segoe UI',
                                    //                               color: Color(
                                    //                                   0xFF979797),
                                    //                               fontSize: 12,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .normal,
                                    //                               useGoogleFonts:
                                    //                                   false,
                                    //                             ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //               Container(
                                    //                 width: 26.67,
                                    //                 height: 26.67,
                                    //                 decoration: BoxDecoration(
                                    //                   gradient: LinearGradient(
                                    //                     colors: [
                                    //                       Color(0xFF4B65B2),
                                    //                       Color(0xFF13BBE6)
                                    //                     ],
                                    //                     stops: [0, 1],
                                    //                     begin:
                                    //                         AlignmentDirectional(
                                    //                             -1, 0),
                                    //                     end:
                                    //                         AlignmentDirectional(
                                    //                             1, 0),
                                    //                   ),
                                    //                   shape: BoxShape.circle,
                                    //                 ),
                                    //                 child: Icon(
                                    //                   Icons.arrow_forward,
                                    //                   color: FlutterFlowTheme
                                    //                           .of(context)
                                    //                       .primaryBackground,
                                    //                   size: 15,
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // if (FFAppState().numberOfApplicants ==
                                    //     'Joint Applicant')
                                    //   Column(
                                    //     mainAxisSize: MainAxisSize.max,
                                    //     children: [
                                    //       Padding(
                                    //         padding:
                                    //             EdgeInsetsDirectional.fromSTEB(
                                    //                 0, 15, 0, 0),
                                    //         child: InkWell(
                                    //           onTap: () async {
                                    //             await showModalBottomSheet(
                                    //               isScrollControlled: true,
                                    //               backgroundColor:
                                    //                   FlutterFlowTheme.of(
                                    //                           context)
                                    //                       .primaryBackground,
                                    //               barrierColor:
                                    //                   FlutterFlowTheme.of(
                                    //                           context)
                                    //                       .primaryBackground,
                                    //               context: context,
                                    //               builder: (context) {
                                    //                 return Padding(
                                    //                   padding:
                                    //                       MediaQuery.of(context)
                                    //                           .viewInsets,
                                    //                   child: Container(
                                    //                     height: MediaQuery.of(
                                    //                                 context)
                                    //                             .size
                                    //                             .height *
                                    //                         1,
                                    //                     child:
                                    //                         AddAddressWidget(),
                                    //                   ),
                                    //                 );
                                    //               },
                                    //             );
                                    //           },
                                    //           child: Container(
                                    //             decoration: BoxDecoration(
                                    //               color: Colors.white,
                                    //               boxShadow: [
                                    //                 BoxShadow(
                                    //                   blurRadius: 16,
                                    //                   color: Color(0x0C000000),
                                    //                   offset: Offset(0, 4),
                                    //                 )
                                    //               ],
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10),
                                    //             ),
                                    //             child: Padding(
                                    //               padding: EdgeInsetsDirectional
                                    //                   .fromSTEB(0, 10, 0, 10),
                                    //               child: Row(
                                    //                 mainAxisSize:
                                    //                     MainAxisSize.max,
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceAround,
                                    //                 children: [
                                    //                   Column(
                                    //                     mainAxisSize:
                                    //                         MainAxisSize.max,
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                     children: [
                                    //                       Text(
                                    //                         'Applicant 1  Address',
                                    //                         style: FlutterFlowTheme
                                    //                                 .of(context)
                                    //                             .bodyText1
                                    //                             .override(
                                    //                               fontFamily:
                                    //                                   'Segoe UI',
                                    //                               color: Color(
                                    //                                   0xFF4B65B2),
                                    //                               useGoogleFonts:
                                    //                                   false,
                                    //                             ),
                                    //                       ),
                                    //                       Text(
                                    //                         'Hello World',
                                    //                         style: FlutterFlowTheme
                                    //                                 .of(context)
                                    //                             .bodyText1
                                    //                             .override(
                                    //                               fontFamily:
                                    //                                   'Segoe UI',
                                    //                               color: Color(
                                    //                                   0xFF979797),
                                    //                               fontSize: 12,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .normal,
                                    //                               useGoogleFonts:
                                    //                                   false,
                                    //                             ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   Container(
                                    //                     width: 26.67,
                                    //                     height: 26.67,
                                    //                     decoration:
                                    //                         BoxDecoration(
                                    //                       gradient:
                                    //                           LinearGradient(
                                    //                         colors: [
                                    //                           Color(0xFF4B65B2),
                                    //                           Color(0xFF13BBE6)
                                    //                         ],
                                    //                         stops: [0, 1],
                                    //                         begin:
                                    //                             AlignmentDirectional(
                                    //                                 -1, 0),
                                    //                         end:
                                    //                             AlignmentDirectional(
                                    //                                 1, 0),
                                    //                       ),
                                    //                       shape:
                                    //                           BoxShape.circle,
                                    //                     ),
                                    //                     child: Icon(
                                    //                       Icons.arrow_forward,
                                    //                       color: FlutterFlowTheme
                                    //                               .of(context)
                                    //                           .primaryBackground,
                                    //                       size: 15,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Padding(
                                    //         padding:
                                    //             EdgeInsetsDirectional.fromSTEB(
                                    //                 0, 15, 0, 0),
                                    //         child: InkWell(
                                    //           onTap: () async {
                                    //             await showModalBottomSheet(
                                    //               isScrollControlled: true,
                                    //               backgroundColor:
                                    //                   FlutterFlowTheme.of(
                                    //                           context)
                                    //                       .primaryBackground,
                                    //               barrierColor:
                                    //                   FlutterFlowTheme.of(
                                    //                           context)
                                    //                       .primaryBackground,
                                    //               context: context,
                                    //               builder: (context) {
                                    //                 return Padding(
                                    //                   padding:
                                    //                       MediaQuery.of(context)
                                    //                           .viewInsets,
                                    //                   child: Container(
                                    //                     height: MediaQuery.of(
                                    //                                 context)
                                    //                             .size
                                    //                             .height *
                                    //                         1,
                                    //                     child:
                                    //                         AddAddressWidget(),
                                    //                   ),
                                    //                 );
                                    //               },
                                    //             );
                                    //           },
                                    //           child: Container(
                                    //             decoration: BoxDecoration(
                                    //               color: Colors.white,
                                    //               boxShadow: [
                                    //                 BoxShadow(
                                    //                   blurRadius: 16,
                                    //                   color: Color(0x0C000000),
                                    //                   offset: Offset(0, 4),
                                    //                 )
                                    //               ],
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10),
                                    //             ),
                                    //             child: Padding(
                                    //               padding: EdgeInsetsDirectional
                                    //                   .fromSTEB(0, 10, 0, 10),
                                    //               child: Row(
                                    //                 mainAxisSize:
                                    //                     MainAxisSize.max,
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceAround,
                                    //                 children: [
                                    //                   Column(
                                    //                     mainAxisSize:
                                    //                         MainAxisSize.max,
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                     children: [
                                    //                       Text(
                                    //                         'Applicant 2  Address',
                                    //                         style: FlutterFlowTheme
                                    //                                 .of(context)
                                    //                             .bodyText1
                                    //                             .override(
                                    //                               fontFamily:
                                    //                                   'Segoe UI',
                                    //                               color: Color(
                                    //                                   0xFF4B65B2),
                                    //                               useGoogleFonts:
                                    //                                   false,
                                    //                             ),
                                    //                       ),
                                    //                       Text(
                                    //                         'Hello World',
                                    //                         style: FlutterFlowTheme
                                    //                                 .of(context)
                                    //                             .bodyText1
                                    //                             .override(
                                    //                               fontFamily:
                                    //                                   'Segoe UI',
                                    //                               color: Color(
                                    //                                   0xFF979797),
                                    //                               fontSize: 12,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .normal,
                                    //                               useGoogleFonts:
                                    //                                   false,
                                    //                             ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   Container(
                                    //                     width: 26.67,
                                    //                     height: 26.67,
                                    //                     decoration:
                                    //                         BoxDecoration(
                                    //                       gradient:
                                    //                           LinearGradient(
                                    //                         colors: [
                                    //                           Color(0xFF4B65B2),
                                    //                           Color(0xFF13BBE6)
                                    //                         ],
                                    //                         stops: [0, 1],
                                    //                         begin:
                                    //                             AlignmentDirectional(
                                    //                                 -1, 0),
                                    //                         end:
                                    //                             AlignmentDirectional(
                                    //                                 1, 0),
                                    //                       ),
                                    //                       shape:
                                    //                           BoxShape.circle,
                                    //                     ),
                                    //                     child: Icon(
                                    //                       Icons.arrow_forward,
                                    //                       color: FlutterFlowTheme
                                    //                               .of(context)
                                    //                           .primaryBackground,
                                    //                       size: 15,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 111,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                              setState(() => FFAppState()
                                                      .currentForm2PageNumber =
                                                  FFAppState()
                                                          .currentForm2PageNumber +
                                                      -1);
                                              await pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                // setState(() => FFAppState()
                                                //     .currentForm2PageNumber = 3);
                                                // await pageViewController
                                                //     ?.nextPage(
                                                //   duration: Duration(
                                                //       milliseconds: 300),
                                                //   curve: Curves.ease,
                                                // );
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            MyApplicationSummary()));
                                              },
                                              child: Container(
                                                width: 42,
                                                height: 42,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                          ),
                          Container(),
                        ],
                      ),
                      // PageView(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   controller: pageViewController ??= PageController(
                      //       initialPage: min(
                      //           valueOrDefault<int>(
                      //             functions.subtractor(
                      //                 FFAppState().currentFormPageNumber, 1),
                      //             0,
                      //           ),
                      //           5)),
                      //   scrollDirection: Axis.horizontal,
                      //   children: [
                      //     Column(
                      //       mainAxisSize: MainAxisSize.max,
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Expanded(
                      //           child: Padding(
                      //             padding: EdgeInsetsDirectional.fromSTEB(
                      //                 15, 15, 15, 0),
                      //             child: SingleChildScrollView(
                      //               child: Column(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.start,
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 15, 0, 0),
                      //                     child: Text(
                      //                       'What are you looking for?',
                      //                       style: FlutterFlowTheme.of(context)
                      //                           .bodyText1
                      //                           .override(
                      //                             fontFamily: 'Segoe UI',
                      //                             fontSize: 18,
                      //                             useGoogleFonts: false,
                      //                           ),
                      //                     ),
                      //                   ),
                      //                   if (FFAppState().whatAreYouLookingFor ==
                      //                       'Purchase')
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 15, 0, 15),
                      //                       child: Row(
                      //                         mainAxisSize: MainAxisSize.max,
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Container(
                      //                             width: 157,
                      //                             height: 50,
                      //                             decoration: BoxDecoration(
                      //                               color: Color(0xFF4B65B2),
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       10),
                      //                             ),
                      //                             child: Align(
                      //                               alignment:
                      //                                   AlignmentDirectional(
                      //                                       0, 0),
                      //                               child: Text(
                      //                                 'Purchase',
                      //                                 textAlign:
                      //                                     TextAlign.center,
                      //                                 style:
                      //                                     FlutterFlowTheme.of(
                      //                                             context)
                      //                                         .bodyText1
                      //                                         .override(
                      //                                           fontFamily:
                      //                                               'Segoe UI',
                      //                                           color: FlutterFlowTheme.of(
                      //                                                   context)
                      //                                               .primaryBackground,
                      //                                           useGoogleFonts:
                      //                                               false,
                      //                                         ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           InkWell(
                      //                             onTap: () async {
                      //                               setState(() => FFAppState()
                      //                                       .whatAreYouLookingFor =
                      //                                   'Remortgage');
                      //                             },
                      //                             child: Container(
                      //                               width: 157,
                      //                               height: 50,
                      //                               decoration: BoxDecoration(
                      //                                 color: Color(0xFFEEF7FE),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         10),
                      //                               ),
                      //                               child: Align(
                      //                                 alignment:
                      //                                     AlignmentDirectional(
                      //                                         0, 0),
                      //                                 child: Text(
                      //                                   'Remortgage',
                      //                                   textAlign:
                      //                                       TextAlign.center,
                      //                                   style:
                      //                                       FlutterFlowTheme.of(
                      //                                               context)
                      //                                           .bodyText1,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   if (FFAppState().whatAreYouLookingFor ==
                      //                       'Remortgage')
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 15, 0, 15),
                      //                       child: Row(
                      //                         mainAxisSize: MainAxisSize.max,
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           InkWell(
                      //                             onTap: () async {
                      //                               setState(() => FFAppState()
                      //                                       .whatAreYouLookingFor =
                      //                                   'Purchase');
                      //                             },
                      //                             child: Container(
                      //                               width: 157,
                      //                               height: 50,
                      //                               decoration: BoxDecoration(
                      //                                 color: Color(0xFFEEF7FE),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         10),
                      //                               ),
                      //                               child: Align(
                      //                                 alignment:
                      //                                     AlignmentDirectional(
                      //                                         0, 0),
                      //                                 child: Text(
                      //                                   'Purchase',
                      //                                   textAlign:
                      //                                       TextAlign.center,
                      //                                   style:
                      //                                       FlutterFlowTheme.of(
                      //                                               context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryText,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Container(
                      //                             width: 157,
                      //                             height: 50,
                      //                             decoration: BoxDecoration(
                      //                               color: Color(0xFF4B65B2),
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       10),
                      //                             ),
                      //                             child: Align(
                      //                               alignment:
                      //                                   AlignmentDirectional(
                      //                                       0, 0),
                      //                               child: Text(
                      //                                 'Remortgage',
                      //                                 textAlign:
                      //                                     TextAlign.center,
                      //                                 style: FlutterFlowTheme
                      //                                         .of(context)
                      //                                     .bodyText1
                      //                                     .override(
                      //                                       fontFamily:
                      //                                           'Segoe UI',
                      //                                       color: Colors.white,
                      //                                       useGoogleFonts:
                      //                                           false,
                      //                                     ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   Text(
                      //                     'Select your option below',
                      //                     style: FlutterFlowTheme.of(context)
                      //                         .bodyText1
                      //                         .override(
                      //                           fontFamily: 'Segoe UI',
                      //                           fontSize: 16,
                      //                           useGoogleFonts: false,
                      //                           lineHeight: 2,
                      //                         ),
                      //                   ),
                      //                   if (FFAppState().whatAreYouLookingFor ==
                      //                       'Purchase')
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 15, 0, 0),
                      //                       child: Column(
                      //                         mainAxisSize: MainAxisSize.max,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.stretch,
                      //                         children: [
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected !=
                      //                               'First Time Buyer')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: InkWell(
                      //                                 onTap: () async {
                      //                                   setState(() => FFAppState()
                      //                                           .PurchaseOptionSelected =
                      //                                       'First Time Buyer');
                      //                                 },
                      //                                 child: Container(
                      //                                   width: 100,
                      //                                   height: 50,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color:
                      //                                         Color(0xFFEEF7FE),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(10),
                      //                                   ),
                      //                                   child: Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             -1, 0),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   15,
                      //                                                   0,
                      //                                                   0,
                      //                                                   0),
                      //                                       child: Text(
                      //                                         'First Time Buyer',
                      //                                         style: FlutterFlowTheme
                      //                                                 .of(context)
                      //                                             .bodyText1
                      //                                             .override(
                      //                                               fontFamily:
                      //                                                   'Segoe UI',
                      //                                               fontSize:
                      //                                                   16,
                      //                                               useGoogleFonts:
                      //                                                   false,
                      //                                             ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected ==
                      //                               'First Time Buyer')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: Container(
                      //                                 width: 100,
                      //                                 height: 50,
                      //                                 decoration: BoxDecoration(
                      //                                   color:
                      //                                       Color(0xFF4B65B2),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                 ),
                      //                                 child: Align(
                      //                                   alignment:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(15,
                      //                                                 0, 0, 0),
                      //                                     child: Text(
                      //                                       'First Time Buyer',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryBackground,
                      //                                             fontSize: 16,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected !=
                      //                               'Help to Buy')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: InkWell(
                      //                                 onTap: () async {
                      //                                   setState(() => FFAppState()
                      //                                           .PurchaseOptionSelected =
                      //                                       'Help to Buy');
                      //                                 },
                      //                                 child: Container(
                      //                                   width: 100,
                      //                                   height: 50,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color:
                      //                                         Color(0xFFEEF7FE),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(10),
                      //                                   ),
                      //                                   child: Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             -1, 0),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   15,
                      //                                                   0,
                      //                                                   0,
                      //                                                   0),
                      //                                       child: Text(
                      //                                         'Help to Buy',
                      //                                         style: FlutterFlowTheme
                      //                                                 .of(context)
                      //                                             .bodyText1
                      //                                             .override(
                      //                                               fontFamily:
                      //                                                   'Segoe UI',
                      //                                               fontSize:
                      //                                                   16,
                      //                                               useGoogleFonts:
                      //                                                   false,
                      //                                             ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected ==
                      //                               'Help to Buy')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: Container(
                      //                                 width: 100,
                      //                                 height: 50,
                      //                                 decoration: BoxDecoration(
                      //                                   color:
                      //                                       Color(0xFF4B65B2),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                 ),
                      //                                 child: Align(
                      //                                   alignment:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(15,
                      //                                                 0, 0, 0),
                      //                                     child: Text(
                      //                                       'Help to Buy',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryBackground,
                      //                                             fontSize: 16,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected !=
                      //                               'Home Mover')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: InkWell(
                      //                                 onTap: () async {
                      //                                   setState(() => FFAppState()
                      //                                           .PurchaseOptionSelected =
                      //                                       'Home Mover');
                      //                                 },
                      //                                 child: Container(
                      //                                   width: 100,
                      //                                   height: 50,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color:
                      //                                         Color(0xFFEEF7FE),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(10),
                      //                                   ),
                      //                                   child: Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             -1, 0),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   15,
                      //                                                   0,
                      //                                                   0,
                      //                                                   0),
                      //                                       child: Text(
                      //                                         'Home Mover',
                      //                                         style: FlutterFlowTheme
                      //                                                 .of(context)
                      //                                             .bodyText1
                      //                                             .override(
                      //                                               fontFamily:
                      //                                                   'Segoe UI',
                      //                                               fontSize:
                      //                                                   16,
                      //                                               useGoogleFonts:
                      //                                                   false,
                      //                                             ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected ==
                      //                               'Home Mover')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: Container(
                      //                                 width: 100,
                      //                                 height: 50,
                      //                                 decoration: BoxDecoration(
                      //                                   color:
                      //                                       Color(0xFF4B65B2),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                 ),
                      //                                 child: Align(
                      //                                   alignment:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(15,
                      //                                                 0, 0, 0),
                      //                                     child: Text(
                      //                                       'Home Mover',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryBackground,
                      //                                             fontSize: 16,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected !=
                      //                               'Buy to Let')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: InkWell(
                      //                                 onTap: () async {
                      //                                   setState(() => FFAppState()
                      //                                           .PurchaseOptionSelected =
                      //                                       'Buy to Let');
                      //                                 },
                      //                                 child: Container(
                      //                                   width: 100,
                      //                                   height: 50,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color:
                      //                                         Color(0xFFEEF7FE),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(10),
                      //                                   ),
                      //                                   child: Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             -1, 0),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   15,
                      //                                                   0,
                      //                                                   0,
                      //                                                   0),
                      //                                       child: Text(
                      //                                         'Buy to Let',
                      //                                         style: FlutterFlowTheme
                      //                                                 .of(context)
                      //                                             .bodyText1
                      //                                             .override(
                      //                                               fontFamily:
                      //                                                   'Segoe UI',
                      //                                               fontSize:
                      //                                                   16,
                      //                                               useGoogleFonts:
                      //                                                   false,
                      //                                             ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .PurchaseOptionSelected ==
                      //                               'Buy to Let')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: Container(
                      //                                 width: 100,
                      //                                 height: 50,
                      //                                 decoration: BoxDecoration(
                      //                                   color:
                      //                                       Color(0xFF4B65B2),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                 ),
                      //                                 child: Align(
                      //                                   alignment:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(15,
                      //                                                 0, 0, 0),
                      //                                     child: Text(
                      //                                       'Buy to Let',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryBackground,
                      //                                             fontSize: 16,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   if (FFAppState().whatAreYouLookingFor ==
                      //                       'Remortgage')
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 15, 0, 0),
                      //                       child: Column(
                      //                         mainAxisSize: MainAxisSize.max,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.stretch,
                      //                         children: [
                      //                           if (FFAppState()
                      //                                   .RemortgageOptionSelected !=
                      //                               'Residential Remortgage')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: InkWell(
                      //                                 onTap: () async {
                      //                                   setState(() => FFAppState()
                      //                                           .RemortgageOptionSelected =
                      //                                       'Residential Remortgage');
                      //                                 },
                      //                                 child: Container(
                      //                                   width: 100,
                      //                                   height: 50,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color:
                      //                                         Color(0xFFEEF7FE),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(10),
                      //                                   ),
                      //                                   child: Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             -1, 0),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   15,
                      //                                                   0,
                      //                                                   0,
                      //                                                   0),
                      //                                       child: Text(
                      //                                         'Residential Remortgage',
                      //                                         style: FlutterFlowTheme
                      //                                                 .of(context)
                      //                                             .bodyText1
                      //                                             .override(
                      //                                               fontFamily:
                      //                                                   'Segoe UI',
                      //                                               fontSize:
                      //                                                   16,
                      //                                               useGoogleFonts:
                      //                                                   false,
                      //                                             ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .RemortgageOptionSelected ==
                      //                               'Residential Remortgage')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: Container(
                      //                                 width: 100,
                      //                                 height: 50,
                      //                                 decoration: BoxDecoration(
                      //                                   color:
                      //                                       Color(0xFF4B65B2),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                 ),
                      //                                 child: Align(
                      //                                   alignment:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(15,
                      //                                                 0, 0, 0),
                      //                                     child: Text(
                      //                                       'Residential Remortgage',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryBackground,
                      //                                             fontSize: 16,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .RemortgageOptionSelected !=
                      //                               'Buy-to-let Remortgage')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: InkWell(
                      //                                 onTap: () async {
                      //                                   setState(() => FFAppState()
                      //                                           .RemortgageOptionSelected =
                      //                                       'Buy-to-let Remortgage');
                      //                                 },
                      //                                 child: Container(
                      //                                   width: 100,
                      //                                   height: 50,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color:
                      //                                         Color(0xFFEEF7FE),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(10),
                      //                                   ),
                      //                                   child: Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             -1, 0),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   15,
                      //                                                   0,
                      //                                                   0,
                      //                                                   0),
                      //                                       child: Text(
                      //                                         'Buy-to-let Remortgage',
                      //                                         style: FlutterFlowTheme
                      //                                                 .of(context)
                      //                                             .bodyText1
                      //                                             .override(
                      //                                               fontFamily:
                      //                                                   'Segoe UI',
                      //                                               fontSize:
                      //                                                   16,
                      //                                               useGoogleFonts:
                      //                                                   false,
                      //                                             ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           if (FFAppState()
                      //                                   .RemortgageOptionSelected ==
                      //                               'Buy-to-let Remortgage')
                      //                             Padding(
                      //                               padding:
                      //                                   EdgeInsetsDirectional
                      //                                       .fromSTEB(
                      //                                           0, 0, 0, 15),
                      //                               child: Container(
                      //                                 width: 100,
                      //                                 height: 50,
                      //                                 decoration: BoxDecoration(
                      //                                   color:
                      //                                       Color(0xFF4B65B2),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                 ),
                      //                                 child: Align(
                      //                                   alignment:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(15,
                      //                                                 0, 0, 0),
                      //                                     child: Text(
                      //                                       'Buy-to-let Remortgage',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .primaryBackground,
                      //                                             fontSize: 16,
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: EdgeInsetsDirectional.fromSTEB(
                      //               15, 15, 15, 30),
                      //           child: Row(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Container(
                      //                 width: 111,
                      //                 height: 26,
                      //                 decoration: BoxDecoration(
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .secondaryBackground,
                      //                   image: DecorationImage(
                      //                     fit: BoxFit.contain,
                      //                     image: Image.asset(
                      //                       'assets/images/Group_25034.png',
                      //                     ).image,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 children: [
                      //                   Container(
                      //                     width: 32,
                      //                     height: 32,
                      //                     decoration: BoxDecoration(
                      //                       color: FlutterFlowTheme.of(context)
                      //                           .secondaryBackground,
                      //                       image: DecorationImage(
                      //                         fit: BoxFit.contain,
                      //                         image: Image.asset(
                      //                           'assets/images/Add_Button_(1).png',
                      //                         ).image,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 0, 0, 0),
                      //                     child: InkWell(
                      //                       onTap: () async {
                      //                         setState(() => FFAppState()
                      //                             .currentFormPageNumber = 2);
                      //                         await pageViewController
                      //                             ?.nextPage(
                      //                           duration:
                      //                               Duration(milliseconds: 300),
                      //                           curve: Curves.ease,
                      //                         );
                      //                       },
                      //                       child: Container(
                      //                         width: 42,
                      //                         height: 42,
                      //                         decoration: BoxDecoration(
                      //                           color:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .secondaryBackground,
                      //                           image: DecorationImage(
                      //                             fit: BoxFit.contain,
                      //                             image: Image.asset(
                      //                               'assets/images/Add_Button_(2).png',
                      //                             ).image,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                      //       child: Column(
                      //         mainAxisSize: MainAxisSize.max,
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 'Number of applicants?',
                      //                 style: FlutterFlowTheme.of(context)
                      //                     .bodyText1
                      //                     .override(
                      //                       fontFamily: 'Segoe UI',
                      //                       fontSize: 18,
                      //                       useGoogleFonts: false,
                      //                     ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 0, 0, 15),
                      //                 child: Text(
                      //                   'Planning to buy the property as single applicant or joint applicant',
                      //                   style: FlutterFlowTheme.of(context)
                      //                       .bodyText1
                      //                       .override(
                      //                         fontFamily: 'Segoe UI',
                      //                         color: Color(0xFF979797),
                      //                         fontWeight: FontWeight.normal,
                      //                         useGoogleFonts: false,
                      //                       ),
                      //                 ),
                      //               ),
                      //               if (FFAppState().numberOfApplicants ==
                      //                   'Single Applicant')
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 15, 0, 15),
                      //                   child: Row(
                      //                     mainAxisSize: MainAxisSize.max,
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       Container(
                      //                         width: 157,
                      //                         height: 50,
                      //                         decoration: BoxDecoration(
                      //                           color: Color(0xFF4B65B2),
                      //                           borderRadius:
                      //                               BorderRadius.circular(10),
                      //                         ),
                      //                         child: Align(
                      //                           alignment:
                      //                               AlignmentDirectional(0, 0),
                      //                           child: Text(
                      //                             'Single Applicant',
                      //                             textAlign: TextAlign.center,
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Segoe UI',
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .primaryBackground,
                      //                                   useGoogleFonts: false,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       InkWell(
                      //                         onTap: () async {
                      //                           setState(() => FFAppState()
                      //                                   .numberOfApplicants =
                      //                               'Joint Applicant');
                      //                         },
                      //                         child: Container(
                      //                           width: 157,
                      //                           height: 50,
                      //                           decoration: BoxDecoration(
                      //                             color: Color(0xFFEEF7FE),
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10),
                      //                           ),
                      //                           child: Align(
                      //                             alignment:
                      //                                 AlignmentDirectional(
                      //                                     0, 0),
                      //                             child: Text(
                      //                               'Joint Applicant',
                      //                               textAlign: TextAlign.center,
                      //                               style: FlutterFlowTheme.of(
                      //                                       context)
                      //                                   .bodyText1,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               if (FFAppState().numberOfApplicants ==
                      //                   'Joint Applicant')
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 0, 0, 15),
                      //                   child: Row(
                      //                     mainAxisSize: MainAxisSize.max,
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       InkWell(
                      //                         onTap: () async {
                      //                           setState(() => FFAppState()
                      //                                   .numberOfApplicants =
                      //                               'Single Applicant');
                      //                         },
                      //                         child: Container(
                      //                           width: 157,
                      //                           height: 50,
                      //                           decoration: BoxDecoration(
                      //                             color: Color(0xFFEEF7FE),
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10),
                      //                           ),
                      //                           child: Align(
                      //                             alignment:
                      //                                 AlignmentDirectional(
                      //                                     0, 0),
                      //                             child: Text(
                      //                               'Single Applicant',
                      //                               textAlign: TextAlign.center,
                      //                               style: FlutterFlowTheme.of(
                      //                                       context)
                      //                                   .bodyText1
                      //                                   .override(
                      //                                     fontFamily:
                      //                                         'Segoe UI',
                      //                                     color: Colors.black,
                      //                                     useGoogleFonts: false,
                      //                                   ),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       Container(
                      //                         width: 157,
                      //                         height: 50,
                      //                         decoration: BoxDecoration(
                      //                           color: Color(0xFF4B65B2),
                      //                           borderRadius:
                      //                               BorderRadius.circular(10),
                      //                         ),
                      //                         child: Align(
                      //                           alignment:
                      //                               AlignmentDirectional(0, 0),
                      //                           child: Text(
                      //                             'Joint Applicant',
                      //                             textAlign: TextAlign.center,
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Segoe UI',
                      //                                   color: Colors.white,
                      //                                   useGoogleFonts: false,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 15, 0, 0),
                      //                 child: Text(
                      //                   'Applicant Details',
                      //                   style: FlutterFlowTheme.of(context)
                      //                       .bodyText1
                      //                       .override(
                      //                         fontFamily: 'Segoe UI',
                      //                         fontSize: 18,
                      //                         useGoogleFonts: false,
                      //                       ),
                      //                 ),
                      //               ),
                      //               if (FFAppState().numberOfApplicants ==
                      //                   'Single Applicant')
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 15, 0, 0),
                      //                   child: InkWell(
                      //                     onTap: () async {
                      //                       await showModalBottomSheet(
                      //                         isScrollControlled: true,
                      //                         backgroundColor:
                      //                             FlutterFlowTheme.of(context)
                      //                                 .primaryBackground,
                      //                         barrierColor:
                      //                             FlutterFlowTheme.of(context)
                      //                                 .primaryBackground,
                      //                         context: context,
                      //                         builder: (context) {
                      //                           return Padding(
                      //                             padding:
                      //                                 MediaQuery.of(context)
                      //                                     .viewInsets,
                      //                             child: Container(
                      //                               height:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .height *
                      //                                       1,
                      //                               child:
                      //                                   ApplicantDetailsWidget(
                      //                                 heading:
                      //                                     'Applicant Details',
                      //                               ),
                      //                             ),
                      //                           );
                      //                         },
                      //                       );
                      //                     },
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.white,
                      //                         boxShadow: [
                      //                           BoxShadow(
                      //                             blurRadius: 16,
                      //                             color: Color(0x0C000000),
                      //                             offset: Offset(0, 4),
                      //                           )
                      //                         ],
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                       ),
                      //                       child: Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(0, 10, 0, 10),
                      //                         child: Row(
                      //                           mainAxisSize: MainAxisSize.max,
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment
                      //                                   .spaceAround,
                      //                           children: [
                      //                             Text(
                      //                               'Add Applicant Details',
                      //                               style: FlutterFlowTheme.of(
                      //                                       context)
                      //                                   .bodyText1
                      //                                   .override(
                      //                                     fontFamily:
                      //                                         'Segoe UI',
                      //                                     color:
                      //                                         Color(0xFF4B65B2),
                      //                                     useGoogleFonts: false,
                      //                                   ),
                      //                             ),
                      //                             Container(
                      //                               width: 26.67,
                      //                               height: 26.67,
                      //                               decoration: BoxDecoration(
                      //                                 gradient: LinearGradient(
                      //                                   colors: [
                      //                                     Color(0xFF4B65B2),
                      //                                     Color(0xFF13BBE6)
                      //                                   ],
                      //                                   stops: [0, 1],
                      //                                   begin:
                      //                                       AlignmentDirectional(
                      //                                           -1, 0),
                      //                                   end:
                      //                                       AlignmentDirectional(
                      //                                           1, 0),
                      //                                 ),
                      //                                 shape: BoxShape.circle,
                      //                               ),
                      //                               child: Icon(
                      //                                 Icons.arrow_forward,
                      //                                 color: FlutterFlowTheme
                      //                                         .of(context)
                      //                                     .primaryBackground,
                      //                                 size: 15,
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               if (FFAppState().numberOfApplicants ==
                      //                   'Joint Applicant')
                      //                 Column(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   children: [
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 15, 0, 0),
                      //                       child: InkWell(
                      //                         onTap: () async {
                      //                           await showModalBottomSheet(
                      //                             isScrollControlled: true,
                      //                             backgroundColor:
                      //                                 FlutterFlowTheme.of(
                      //                                         context)
                      //                                     .primaryBackground,
                      //                             barrierColor:
                      //                                 FlutterFlowTheme.of(
                      //                                         context)
                      //                                     .primaryBackground,
                      //                             context: context,
                      //                             builder: (context) {
                      //                               return Padding(
                      //                                 padding:
                      //                                     MediaQuery.of(context)
                      //                                         .viewInsets,
                      //                                 child: Container(
                      //                                   height: MediaQuery.of(
                      //                                               context)
                      //                                           .size
                      //                                           .height *
                      //                                       1,
                      //                                   child:
                      //                                       ApplicantDetailsWidget(
                      //                                     heading:
                      //                                         'Applicant 1 Details',
                      //                                   ),
                      //                                 ),
                      //                               );
                      //                             },
                      //                           );
                      //                         },
                      //                         child: Container(
                      //                           decoration: BoxDecoration(
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                 blurRadius: 16,
                      //                                 color: Color(0x0C000000),
                      //                                 offset: Offset(0, 4),
                      //                               )
                      //                             ],
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10),
                      //                           ),
                      //                           child: Padding(
                      //                             padding: EdgeInsetsDirectional
                      //                                 .fromSTEB(0, 10, 0, 10),
                      //                             child: Row(
                      //                               mainAxisSize:
                      //                                   MainAxisSize.max,
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment
                      //                                       .spaceAround,
                      //                               children: [
                      //                                 Text(
                      //                                   'Add Applicant 1 Details',
                      //                                   style:
                      //                                       FlutterFlowTheme.of(
                      //                                               context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: Color(
                      //                                                 0xFF4B65B2),
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                 ),
                      //                                 Container(
                      //                                   width: 26.67,
                      //                                   height: 26.67,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     gradient:
                      //                                         LinearGradient(
                      //                                       colors: [
                      //                                         Color(0xFF4B65B2),
                      //                                         Color(0xFF13BBE6)
                      //                                       ],
                      //                                       stops: [0, 1],
                      //                                       begin:
                      //                                           AlignmentDirectional(
                      //                                               -1, 0),
                      //                                       end:
                      //                                           AlignmentDirectional(
                      //                                               1, 0),
                      //                                     ),
                      //                                     shape:
                      //                                         BoxShape.circle,
                      //                                   ),
                      //                                   child: Icon(
                      //                                     Icons.arrow_forward,
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .primaryBackground,
                      //                                     size: 15,
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 15, 0, 0),
                      //                       child: InkWell(
                      //                         onTap: () async {
                      //                           await showModalBottomSheet(
                      //                             isScrollControlled: true,
                      //                             backgroundColor:
                      //                                 FlutterFlowTheme.of(
                      //                                         context)
                      //                                     .primaryBackground,
                      //                             barrierColor:
                      //                                 FlutterFlowTheme.of(
                      //                                         context)
                      //                                     .primaryBackground,
                      //                             context: context,
                      //                             builder: (context) {
                      //                               return Padding(
                      //                                 padding:
                      //                                     MediaQuery.of(context)
                      //                                         .viewInsets,
                      //                                 child: Container(
                      //                                   height: MediaQuery.of(
                      //                                               context)
                      //                                           .size
                      //                                           .height *
                      //                                       1,
                      //                                   child:
                      //                                       ApplicantDetailsWidget(
                      //                                     heading:
                      //                                         'Applicant 2 Details',
                      //                                   ),
                      //                                 ),
                      //                               );
                      //                             },
                      //                           );
                      //                         },
                      //                         child: Container(
                      //                           decoration: BoxDecoration(
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                 blurRadius: 16,
                      //                                 color: Color(0x0C000000),
                      //                                 offset: Offset(0, 4),
                      //                               )
                      //                             ],
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10),
                      //                           ),
                      //                           child: Padding(
                      //                             padding: EdgeInsetsDirectional
                      //                                 .fromSTEB(0, 10, 0, 10),
                      //                             child: Row(
                      //                               mainAxisSize:
                      //                                   MainAxisSize.max,
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment
                      //                                       .spaceAround,
                      //                               children: [
                      //                                 Text(
                      //                                   'Add Applicant 2 Details',
                      //                                   style:
                      //                                       FlutterFlowTheme.of(
                      //                                               context)
                      //                                           .bodyText1
                      //                                           .override(
                      //                                             fontFamily:
                      //                                                 'Segoe UI',
                      //                                             color: Color(
                      //                                                 0xFF4B65B2),
                      //                                             useGoogleFonts:
                      //                                                 false,
                      //                                           ),
                      //                                 ),
                      //                                 Container(
                      //                                   width: 26.67,
                      //                                   height: 26.67,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     gradient:
                      //                                         LinearGradient(
                      //                                       colors: [
                      //                                         Color(0xFF4B65B2),
                      //                                         Color(0xFF13BBE6)
                      //                                       ],
                      //                                       stops: [0, 1],
                      //                                       begin:
                      //                                           AlignmentDirectional(
                      //                                               -1, 0),
                      //                                       end:
                      //                                           AlignmentDirectional(
                      //                                               1, 0),
                      //                                     ),
                      //                                     shape:
                      //                                         BoxShape.circle,
                      //                                   ),
                      //                                   child: Icon(
                      //                                     Icons.arrow_forward,
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .primaryBackground,
                      //                                     size: 15,
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //             ],
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsetsDirectional.fromSTEB(
                      //                 0, 15, 0, 30),
                      //             child: Row(
                      //               mainAxisSize: MainAxisSize.max,
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Container(
                      //                   width: 111,
                      //                   height: 26,
                      //                   decoration: BoxDecoration(
                      //                     color: FlutterFlowTheme.of(context)
                      //                         .secondaryBackground,
                      //                     image: DecorationImage(
                      //                       fit: BoxFit.contain,
                      //                       image: Image.asset(
                      //                         'assets/images/Group_25034.png',
                      //                       ).image,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   children: [
                      //                     InkWell(
                      //                       onTap: () async {
                      //                         setState(() => FFAppState()
                      //                                 .currentFormPageNumber =
                      //                             FFAppState()
                      //                                     .currentFormPageNumber +
                      //                                 -1);
                      //                         await pageViewController
                      //                             ?.previousPage(
                      //                           duration:
                      //                               Duration(milliseconds: 300),
                      //                           curve: Curves.ease,
                      //                         );
                      //                       },
                      //                       child: Container(
                      //                         width: 32,
                      //                         height: 32,
                      //                         decoration: BoxDecoration(
                      //                           color:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .secondaryBackground,
                      //                           image: DecorationImage(
                      //                             fit: BoxFit.contain,
                      //                             image: Image.asset(
                      //                               'assets/images/Add_Button_(1).png',
                      //                             ).image,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               15, 0, 0, 0),
                      //                       child: InkWell(
                      //                         onTap: () async {
                      //                           setState(() => FFAppState()
                      //                               .currentFormPageNumber = 3);
                      //                           await pageViewController
                      //                               ?.nextPage(
                      //                             duration: Duration(
                      //                                 milliseconds: 300),
                      //                             curve: Curves.ease,
                      //                           );
                      //                         },
                      //                         child: Container(
                      //                           width: 42,
                      //                           height: 42,
                      //                           decoration: BoxDecoration(
                      //                             color: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .secondaryBackground,
                      //                             image: DecorationImage(
                      //                               fit: BoxFit.contain,
                      //                               image: Image.asset(
                      //                                 'assets/images/Add_Button_(2).png',
                      //                               ).image,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     // Padding(
                      //     //   padding:
                      //     //       EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                      //     //   child: Column(
                      //     //     mainAxisSize: MainAxisSize.max,
                      //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     //     children: [
                      //     //       Column(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         crossAxisAlignment: CrossAxisAlignment.start,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 0, 0, 0, 5),
                      //     //             child: Text(
                      //     //               'Add the last 3 years of your address history',
                      //     //               style: FlutterFlowTheme.of(context)
                      //     //                   .bodyText1
                      //     //                   .override(
                      //     //                     fontFamily: 'Segoe UI',
                      //     //                     fontSize: 16,
                      //     //                     useGoogleFonts: false,
                      //     //                   ),
                      //     //             ),
                      //     //           ),
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 0, 0, 0, 15),
                      //     //             child: Text(
                      //     //               'Add your addresses in order, starting with the most recent. You can add UK and foreign addresses.\n',
                      //     //               style: FlutterFlowTheme.of(context)
                      //     //                   .bodyText1
                      //     //                   .override(
                      //     //                     fontFamily: 'Segoe UI',
                      //     //                     color: Color(0xFF979797),
                      //     //                     fontWeight: FontWeight.normal,
                      //     //                     useGoogleFonts: false,
                      //     //                   ),
                      //     //             ),
                      //     //           ),
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 0, 15, 0, 0),
                      //     //             child: Text(
                      //     //               'Applicant Details',
                      //     //               style: FlutterFlowTheme.of(context)
                      //     //                   .bodyText1
                      //     //                   .override(
                      //     //                     fontFamily: 'Segoe UI',
                      //     //                     fontSize: 18,
                      //     //                     useGoogleFonts: false,
                      //     //                   ),
                      //     //             ),
                      //     //           ),
                      //     //           if (FFAppState().numberOfApplicants ==
                      //     //               'Single Applicant')
                      //     //             Padding(
                      //     //               padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                   0, 15, 0, 0),
                      //     //               child: InkWell(
                      //     //                 onTap: () async {
                      //     //                   await showModalBottomSheet(
                      //     //                     isScrollControlled: true,
                      //     //                     backgroundColor:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .primaryBackground,
                      //     //                     barrierColor:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .primaryBackground,
                      //     //                     context: context,
                      //     //                     builder: (context) {
                      //     //                       return Padding(
                      //     //                         padding:
                      //     //                             MediaQuery.of(context)
                      //     //                                 .viewInsets,
                      //     //                         child: Container(
                      //     //                           height:
                      //     //                               MediaQuery.of(context)
                      //     //                                       .size
                      //     //                                       .height *
                      //     //                                   1,
                      //     //                           child: AddAddressWidget(),
                      //     //                         ),
                      //     //                       );
                      //     //                     },
                      //     //                   );
                      //     //                 },
                      //     //                 child: Container(
                      //     //                   decoration: BoxDecoration(
                      //     //                     color: Colors.white,
                      //     //                     boxShadow: [
                      //     //                       BoxShadow(
                      //     //                         blurRadius: 16,
                      //     //                         color: Color(0x0C000000),
                      //     //                         offset: Offset(0, 4),
                      //     //                       )
                      //     //                     ],
                      //     //                     borderRadius:
                      //     //                         BorderRadius.circular(10),
                      //     //                   ),
                      //     //                   child: Padding(
                      //     //                     padding: EdgeInsetsDirectional
                      //     //                         .fromSTEB(0, 10, 0, 10),
                      //     //                     child: Row(
                      //     //                       mainAxisSize: MainAxisSize.max,
                      //     //                       mainAxisAlignment:
                      //     //                           MainAxisAlignment
                      //     //                               .spaceAround,
                      //     //                       children: [
                      //     //                         Column(
                      //     //                           mainAxisSize:
                      //     //                               MainAxisSize.max,
                      //     //                           crossAxisAlignment:
                      //     //                               CrossAxisAlignment
                      //     //                                   .start,
                      //     //                           children: [
                      //     //                             Text(
                      //     //                               'Applicant  Address',
                      //     //                               style:
                      //     //                                   FlutterFlowTheme.of(
                      //     //                                           context)
                      //     //                                       .bodyText1
                      //     //                                       .override(
                      //     //                                         fontFamily:
                      //     //                                             'Segoe UI',
                      //     //                                         color: Color(
                      //     //                                             0xFF4B65B2),
                      //     //                                         useGoogleFonts:
                      //     //                                             false,
                      //     //                                       ),
                      //     //                             ),
                      //     //                             Text(
                      //     //                               'Hello World',
                      //     //                               style:
                      //     //                                   FlutterFlowTheme.of(
                      //     //                                           context)
                      //     //                                       .bodyText1
                      //     //                                       .override(
                      //     //                                         fontFamily:
                      //     //                                             'Segoe UI',
                      //     //                                         color: Color(
                      //     //                                             0xFF979797),
                      //     //                                         fontSize: 12,
                      //     //                                         fontWeight:
                      //     //                                             FontWeight
                      //     //                                                 .normal,
                      //     //                                         useGoogleFonts:
                      //     //                                             false,
                      //     //                                       ),
                      //     //                             ),
                      //     //                           ],
                      //     //                         ),
                      //     //                         Container(
                      //     //                           width: 26.67,
                      //     //                           height: 26.67,
                      //     //                           decoration: BoxDecoration(
                      //     //                             gradient: LinearGradient(
                      //     //                               colors: [
                      //     //                                 Color(0xFF4B65B2),
                      //     //                                 Color(0xFF13BBE6)
                      //     //                               ],
                      //     //                               stops: [0, 1],
                      //     //                               begin:
                      //     //                                   AlignmentDirectional(
                      //     //                                       -1, 0),
                      //     //                               end:
                      //     //                                   AlignmentDirectional(
                      //     //                                       1, 0),
                      //     //                             ),
                      //     //                             shape: BoxShape.circle,
                      //     //                           ),
                      //     //                           child: Icon(
                      //     //                             Icons.arrow_forward,
                      //     //                             color: FlutterFlowTheme
                      //     //                                     .of(context)
                      //     //                                 .primaryBackground,
                      //     //                             size: 15,
                      //     //                           ),
                      //     //                         ),
                      //     //                       ],
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //           if (FFAppState().numberOfApplicants ==
                      //     //               'Joint Applicant')
                      //     //             Column(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               children: [
                      //     //                 Padding(
                      //     //                   padding:
                      //     //                       EdgeInsetsDirectional.fromSTEB(
                      //     //                           0, 15, 0, 0),
                      //     //                   child: InkWell(
                      //     //                     onTap: () async {
                      //     //                       await showModalBottomSheet(
                      //     //                         isScrollControlled: true,
                      //     //                         backgroundColor:
                      //     //                             FlutterFlowTheme.of(
                      //     //                                     context)
                      //     //                                 .primaryBackground,
                      //     //                         barrierColor:
                      //     //                             FlutterFlowTheme.of(
                      //     //                                     context)
                      //     //                                 .primaryBackground,
                      //     //                         context: context,
                      //     //                         builder: (context) {
                      //     //                           return Padding(
                      //     //                             padding:
                      //     //                                 MediaQuery.of(context)
                      //     //                                     .viewInsets,
                      //     //                             child: Container(
                      //     //                               height: MediaQuery.of(
                      //     //                                           context)
                      //     //                                       .size
                      //     //                                       .height *
                      //     //                                   1,
                      //     //                               child:
                      //     //                                   AddAddressWidget(),
                      //     //                             ),
                      //     //                           );
                      //     //                         },
                      //     //                       );
                      //     //                     },
                      //     //                     child: Container(
                      //     //                       decoration: BoxDecoration(
                      //     //                         color: Colors.white,
                      //     //                         boxShadow: [
                      //     //                           BoxShadow(
                      //     //                             blurRadius: 16,
                      //     //                             color: Color(0x0C000000),
                      //     //                             offset: Offset(0, 4),
                      //     //                           )
                      //     //                         ],
                      //     //                         borderRadius:
                      //     //                             BorderRadius.circular(10),
                      //     //                       ),
                      //     //                       child: Padding(
                      //     //                         padding: EdgeInsetsDirectional
                      //     //                             .fromSTEB(0, 10, 0, 10),
                      //     //                         child: Row(
                      //     //                           mainAxisSize:
                      //     //                               MainAxisSize.max,
                      //     //                           mainAxisAlignment:
                      //     //                               MainAxisAlignment
                      //     //                                   .spaceAround,
                      //     //                           children: [
                      //     //                             Column(
                      //     //                               mainAxisSize:
                      //     //                                   MainAxisSize.max,
                      //     //                               crossAxisAlignment:
                      //     //                                   CrossAxisAlignment
                      //     //                                       .start,
                      //     //                               children: [
                      //     //                                 Text(
                      //     //                                   'Applicant 1  Address',
                      //     //                                   style: FlutterFlowTheme
                      //     //                                           .of(context)
                      //     //                                       .bodyText1
                      //     //                                       .override(
                      //     //                                         fontFamily:
                      //     //                                             'Segoe UI',
                      //     //                                         color: Color(
                      //     //                                             0xFF4B65B2),
                      //     //                                         useGoogleFonts:
                      //     //                                             false,
                      //     //                                       ),
                      //     //                                 ),
                      //     //                                 Text(
                      //     //                                   'Hello World',
                      //     //                                   style: FlutterFlowTheme
                      //     //                                           .of(context)
                      //     //                                       .bodyText1
                      //     //                                       .override(
                      //     //                                         fontFamily:
                      //     //                                             'Segoe UI',
                      //     //                                         color: Color(
                      //     //                                             0xFF979797),
                      //     //                                         fontSize: 12,
                      //     //                                         fontWeight:
                      //     //                                             FontWeight
                      //     //                                                 .normal,
                      //     //                                         useGoogleFonts:
                      //     //                                             false,
                      //     //                                       ),
                      //     //                                 ),
                      //     //                               ],
                      //     //                             ),
                      //     //                             Container(
                      //     //                               width: 26.67,
                      //     //                               height: 26.67,
                      //     //                               decoration:
                      //     //                                   BoxDecoration(
                      //     //                                 gradient:
                      //     //                                     LinearGradient(
                      //     //                                   colors: [
                      //     //                                     Color(0xFF4B65B2),
                      //     //                                     Color(0xFF13BBE6)
                      //     //                                   ],
                      //     //                                   stops: [0, 1],
                      //     //                                   begin:
                      //     //                                       AlignmentDirectional(
                      //     //                                           -1, 0),
                      //     //                                   end:
                      //     //                                       AlignmentDirectional(
                      //     //                                           1, 0),
                      //     //                                 ),
                      //     //                                 shape:
                      //     //                                     BoxShape.circle,
                      //     //                               ),
                      //     //                               child: Icon(
                      //     //                                 Icons.arrow_forward,
                      //     //                                 color: FlutterFlowTheme
                      //     //                                         .of(context)
                      //     //                                     .primaryBackground,
                      //     //                                 size: 15,
                      //     //                               ),
                      //     //                             ),
                      //     //                           ],
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //                 Padding(
                      //     //                   padding:
                      //     //                       EdgeInsetsDirectional.fromSTEB(
                      //     //                           0, 15, 0, 0),
                      //     //                   child: InkWell(
                      //     //                     onTap: () async {
                      //     //                       await showModalBottomSheet(
                      //     //                         isScrollControlled: true,
                      //     //                         backgroundColor:
                      //     //                             FlutterFlowTheme.of(
                      //     //                                     context)
                      //     //                                 .primaryBackground,
                      //     //                         barrierColor:
                      //     //                             FlutterFlowTheme.of(
                      //     //                                     context)
                      //     //                                 .primaryBackground,
                      //     //                         context: context,
                      //     //                         builder: (context) {
                      //     //                           return Padding(
                      //     //                             padding:
                      //     //                                 MediaQuery.of(context)
                      //     //                                     .viewInsets,
                      //     //                             child: Container(
                      //     //                               height: MediaQuery.of(
                      //     //                                           context)
                      //     //                                       .size
                      //     //                                       .height *
                      //     //                                   1,
                      //     //                               child:
                      //     //                                   AddAddressWidget(),
                      //     //                             ),
                      //     //                           );
                      //     //                         },
                      //     //                       );
                      //     //                     },
                      //     //                     child: Container(
                      //     //                       decoration: BoxDecoration(
                      //     //                         color: Colors.white,
                      //     //                         boxShadow: [
                      //     //                           BoxShadow(
                      //     //                             blurRadius: 16,
                      //     //                             color: Color(0x0C000000),
                      //     //                             offset: Offset(0, 4),
                      //     //                           )
                      //     //                         ],
                      //     //                         borderRadius:
                      //     //                             BorderRadius.circular(10),
                      //     //                       ),
                      //     //                       child: Padding(
                      //     //                         padding: EdgeInsetsDirectional
                      //     //                             .fromSTEB(0, 10, 0, 10),
                      //     //                         child: Row(
                      //     //                           mainAxisSize:
                      //     //                               MainAxisSize.max,
                      //     //                           mainAxisAlignment:
                      //     //                               MainAxisAlignment
                      //     //                                   .spaceAround,
                      //     //                           children: [
                      //     //                             Column(
                      //     //                               mainAxisSize:
                      //     //                                   MainAxisSize.max,
                      //     //                               crossAxisAlignment:
                      //     //                                   CrossAxisAlignment
                      //     //                                       .start,
                      //     //                               children: [
                      //     //                                 Text(
                      //     //                                   'Applicant 2  Address',
                      //     //                                   style: FlutterFlowTheme
                      //     //                                           .of(context)
                      //     //                                       .bodyText1
                      //     //                                       .override(
                      //     //                                         fontFamily:
                      //     //                                             'Segoe UI',
                      //     //                                         color: Color(
                      //     //                                             0xFF4B65B2),
                      //     //                                         useGoogleFonts:
                      //     //                                             false,
                      //     //                                       ),
                      //     //                                 ),
                      //     //                                 Text(
                      //     //                                   'Hello World',
                      //     //                                   style: FlutterFlowTheme
                      //     //                                           .of(context)
                      //     //                                       .bodyText1
                      //     //                                       .override(
                      //     //                                         fontFamily:
                      //     //                                             'Segoe UI',
                      //     //                                         color: Color(
                      //     //                                             0xFF979797),
                      //     //                                         fontSize: 12,
                      //     //                                         fontWeight:
                      //     //                                             FontWeight
                      //     //                                                 .normal,
                      //     //                                         useGoogleFonts:
                      //     //                                             false,
                      //     //                                       ),
                      //     //                                 ),
                      //     //                               ],
                      //     //                             ),
                      //     //                             Container(
                      //     //                               width: 26.67,
                      //     //                               height: 26.67,
                      //     //                               decoration:
                      //     //                                   BoxDecoration(
                      //     //                                 gradient:
                      //     //                                     LinearGradient(
                      //     //                                   colors: [
                      //     //                                     Color(0xFF4B65B2),
                      //     //                                     Color(0xFF13BBE6)
                      //     //                                   ],
                      //     //                                   stops: [0, 1],
                      //     //                                   begin:
                      //     //                                       AlignmentDirectional(
                      //     //                                           -1, 0),
                      //     //                                   end:
                      //     //                                       AlignmentDirectional(
                      //     //                                           1, 0),
                      //     //                                 ),
                      //     //                                 shape:
                      //     //                                     BoxShape.circle,
                      //     //                               ),
                      //     //                               child: Icon(
                      //     //                                 Icons.arrow_forward,
                      //     //                                 color: FlutterFlowTheme
                      //     //                                         .of(context)
                      //     //                                     .primaryBackground,
                      //     //                                 size: 15,
                      //     //                               ),
                      //     //                             ),
                      //     //                           ],
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //         ],
                      //     //       ),
                      //     //       Padding(
                      //     //         padding: EdgeInsetsDirectional.fromSTEB(
                      //     //             0, 15, 0, 30),
                      //     //         child: Row(
                      //     //           mainAxisSize: MainAxisSize.max,
                      //     //           mainAxisAlignment:
                      //     //               MainAxisAlignment.spaceBetween,
                      //     //           children: [
                      //     //             Container(
                      //     //               width: 111,
                      //     //               height: 26,
                      //     //               decoration: BoxDecoration(
                      //     //                 color: FlutterFlowTheme.of(context)
                      //     //                     .secondaryBackground,
                      //     //                 image: DecorationImage(
                      //     //                   fit: BoxFit.contain,
                      //     //                   image: Image.asset(
                      //     //                     'assets/images/Group_25034.png',
                      //     //                   ).image,
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //             Row(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               children: [
                      //     //                 InkWell(
                      //     //                   onTap: () async {
                      //     //                     setState(() => FFAppState()
                      //     //                             .currentFormPageNumber =
                      //     //                         FFAppState()
                      //     //                                 .currentFormPageNumber +
                      //     //                             -1);
                      //     //                     await pageViewController
                      //     //                         ?.previousPage(
                      //     //                       duration:
                      //     //                           Duration(milliseconds: 300),
                      //     //                       curve: Curves.ease,
                      //     //                     );
                      //     //                   },
                      //     //                   child: Container(
                      //     //                     width: 32,
                      //     //                     height: 32,
                      //     //                     decoration: BoxDecoration(
                      //     //                       color:
                      //     //                           FlutterFlowTheme.of(context)
                      //     //                               .secondaryBackground,
                      //     //                       image: DecorationImage(
                      //     //                         fit: BoxFit.contain,
                      //     //                         image: Image.asset(
                      //     //                           'assets/images/Add_Button_(1).png',
                      //     //                         ).image,
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //                 Padding(
                      //     //                   padding:
                      //     //                       EdgeInsetsDirectional.fromSTEB(
                      //     //                           15, 0, 0, 0),
                      //     //                   child: InkWell(
                      //     //                     onTap: () async {
                      //     //                       setState(() => FFAppState()
                      //     //                           .currentFormPageNumber = 4);
                      //     //                       await pageViewController
                      //     //                           ?.nextPage(
                      //     //                         duration: Duration(
                      //     //                             milliseconds: 300),
                      //     //                         curve: Curves.ease,
                      //     //                       );
                      //     //                     },
                      //     //                     child: Container(
                      //     //                       width: 42,
                      //     //                       height: 42,
                      //     //                       decoration: BoxDecoration(
                      //     //                         color: FlutterFlowTheme.of(
                      //     //                                 context)
                      //     //                             .secondaryBackground,
                      //     //                         image: DecorationImage(
                      //     //                           fit: BoxFit.contain,
                      //     //                           image: Image.asset(
                      //     //                             'assets/images/Add_Button_(2).png',
                      //     //                           ).image,
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //       ),
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //     // Column(
                      //     //   mainAxisSize: MainAxisSize.max,
                      //     //   mainAxisAlignment: MainAxisAlignment.start,
                      //     //   children: [
                      //     //     Padding(
                      //     //       padding: EdgeInsetsDirectional.fromSTEB(
                      //     //           20, 20, 0, 20),
                      //     //       child: Row(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 0, 0, 10, 0),
                      //     //             child: Image.asset(
                      //     //               'assets/images/Untitled-7.png',
                      //     //               width: 49,
                      //     //               height: 50,
                      //     //               fit: BoxFit.cover,
                      //     //             ),
                      //     //           ),
                      //     //           Text(
                      //     //             'Add your job or profession details ',
                      //     //             style: FlutterFlowTheme.of(context)
                      //     //                 .bodyText1
                      //     //                 .override(
                      //     //                   fontFamily: 'Segoe UI',
                      //     //                   color: Color(0xFF979797),
                      //     //                   fontWeight: FontWeight.normal,
                      //     //                   useGoogleFonts: false,
                      //     //                 ),
                      //     //           ),
                      //     //         ],
                      //     //       ),
                      //     //     ),
                      //     //     InkWell(
                      //     //       onTap: () async {
                      //     //         await showModalBottomSheet(
                      //     //           isScrollControlled: true,
                      //     //           backgroundColor:
                      //     //               FlutterFlowTheme.of(context)
                      //     //                   .primaryBackground,
                      //     //           barrierColor: FlutterFlowTheme.of(context)
                      //     //               .primaryBackground,
                      //     //           context: context,
                      //     //           builder: (context) {
                      //     //             return Padding(
                      //     //               padding:
                      //     //                   MediaQuery.of(context).viewInsets,
                      //     //               child: Container(
                      //     //                 height: MediaQuery.of(context)
                      //     //                         .size
                      //     //                         .height *
                      //     //                     1,
                      //     //                 child: OccupationDetailsWidget(),
                      //     //               ),
                      //     //             );
                      //     //           },
                      //     //         );
                      //     //       },
                      //     //       child: Container(
                      //     //         width:
                      //     //             MediaQuery.of(context).size.width * 0.9,
                      //     //         decoration: BoxDecoration(
                      //     //           color: FlutterFlowTheme.of(context)
                      //     //               .secondaryBackground,
                      //     //           boxShadow: [
                      //     //             BoxShadow(
                      //     //               blurRadius: 16,
                      //     //               color: Color(0x0D000000),
                      //     //               offset: Offset(0, 4),
                      //     //             )
                      //     //           ],
                      //     //           borderRadius: BorderRadius.circular(10),
                      //     //           border: Border.all(
                      //     //             color: Color(0x80979797),
                      //     //             width: 0.25,
                      //     //           ),
                      //     //         ),
                      //     //         child: Padding(
                      //     //           padding: EdgeInsetsDirectional.fromSTEB(
                      //     //               10, 10, 10, 10),
                      //     //           child: Row(
                      //     //             mainAxisSize: MainAxisSize.max,
                      //     //             mainAxisAlignment:
                      //     //                 MainAxisAlignment.spaceBetween,
                      //     //             children: [
                      //     //               Column(
                      //     //                 mainAxisSize: MainAxisSize.max,
                      //     //                 children: [
                      //     //                   Column(
                      //     //                     mainAxisSize: MainAxisSize.max,
                      //     //                     crossAxisAlignment:
                      //     //                         CrossAxisAlignment.start,
                      //     //                     children: [
                      //     //                       Text(
                      //     //                         'Applicant 1',
                      //     //                         style: FlutterFlowTheme.of(
                      //     //                                 context)
                      //     //                             .bodyText1
                      //     //                             .override(
                      //     //                               fontFamily: 'Segoe UI',
                      //     //                               color:
                      //     //                                   FlutterFlowTheme.of(
                      //     //                                           context)
                      //     //                                       .primaryColor,
                      //     //                               useGoogleFonts: false,
                      //     //                             ),
                      //     //                       ),
                      //     //                       Padding(
                      //     //                         padding: EdgeInsetsDirectional
                      //     //                             .fromSTEB(0, 5, 0, 0),
                      //     //                         child: Text(
                      //     //                           'Carole Demas',
                      //     //                           style: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .bodyText1
                      //     //                               .override(
                      //     //                                 fontFamily:
                      //     //                                     'Segoe UI',
                      //     //                                 color:
                      //     //                                     Color(0xFF979797),
                      //     //                                 fontSize: 12,
                      //     //                                 fontWeight:
                      //     //                                     FontWeight.normal,
                      //     //                                 useGoogleFonts: false,
                      //     //                               ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ],
                      //     //                   ),
                      //     //                 ],
                      //     //               ),
                      //     //               Column(
                      //     //                 mainAxisSize: MainAxisSize.max,
                      //     //                 children: [
                      //     //                   Container(
                      //     //                     width: 30,
                      //     //                     height: 30,
                      //     //                     clipBehavior: Clip.antiAlias,
                      //     //                     decoration: BoxDecoration(
                      //     //                       shape: BoxShape.circle,
                      //     //                     ),
                      //     //                     child: Image.asset(
                      //     //                       'assets/images/Untitled-3.png',
                      //     //                     ),
                      //     //                   ),
                      //     //                 ],
                      //     //               ),
                      //     //             ],
                      //     //           ),
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //     Padding(
                      //     //       padding:
                      //     //           EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      //     //       child: InkWell(
                      //     //         onTap: () async {
                      //     //           await showModalBottomSheet(
                      //     //             isScrollControlled: true,
                      //     //             backgroundColor:
                      //     //                 FlutterFlowTheme.of(context)
                      //     //                     .primaryBackground,
                      //     //             barrierColor: FlutterFlowTheme.of(context)
                      //     //                 .primaryBackground,
                      //     //             context: context,
                      //     //             builder: (context) {
                      //     //               return Padding(
                      //     //                 padding:
                      //     //                     MediaQuery.of(context).viewInsets,
                      //     //                 child: Container(
                      //     //                   height: MediaQuery.of(context)
                      //     //                           .size
                      //     //                           .height *
                      //     //                       1,
                      //     //                   child: OccupationDetailsWidget(),
                      //     //                 ),
                      //     //               );
                      //     //             },
                      //     //           );
                      //     //         },
                      //     //         child: Container(
                      //     //           width:
                      //     //               MediaQuery.of(context).size.width * 0.9,
                      //     //           decoration: BoxDecoration(
                      //     //             color: FlutterFlowTheme.of(context)
                      //     //                 .secondaryBackground,
                      //     //             boxShadow: [
                      //     //               BoxShadow(
                      //     //                 blurRadius: 16,
                      //     //                 color: Color(0x0D000000),
                      //     //                 offset: Offset(0, 4),
                      //     //               )
                      //     //             ],
                      //     //             borderRadius: BorderRadius.circular(10),
                      //     //             border: Border.all(
                      //     //               color: Color(0x80979797),
                      //     //               width: 0.25,
                      //     //             ),
                      //     //           ),
                      //     //           child: Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 10, 10, 10, 10),
                      //     //             child: Row(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               mainAxisAlignment:
                      //     //                   MainAxisAlignment.spaceBetween,
                      //     //               children: [
                      //     //                 Column(
                      //     //                   mainAxisSize: MainAxisSize.max,
                      //     //                   children: [
                      //     //                     Column(
                      //     //                       mainAxisSize: MainAxisSize.max,
                      //     //                       crossAxisAlignment:
                      //     //                           CrossAxisAlignment.start,
                      //     //                       children: [
                      //     //                         Text(
                      //     //                           'Applicant 2',
                      //     //                           style: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .bodyText1
                      //     //                               .override(
                      //     //                                 fontFamily:
                      //     //                                     'Segoe UI',
                      //     //                                 color: FlutterFlowTheme
                      //     //                                         .of(context)
                      //     //                                     .primaryColor,
                      //     //                                 useGoogleFonts: false,
                      //     //                               ),
                      //     //                         ),
                      //     //                         Padding(
                      //     //                           padding:
                      //     //                               EdgeInsetsDirectional
                      //     //                                   .fromSTEB(
                      //     //                                       0, 5, 0, 0),
                      //     //                           child: Text(
                      //     //                             'Carole Demas',
                      //     //                             style:
                      //     //                                 FlutterFlowTheme.of(
                      //     //                                         context)
                      //     //                                     .bodyText1
                      //     //                                     .override(
                      //     //                                       fontFamily:
                      //     //                                           'Segoe UI',
                      //     //                                       color: Color(
                      //     //                                           0xFF979797),
                      //     //                                       fontSize: 12,
                      //     //                                       fontWeight:
                      //     //                                           FontWeight
                      //     //                                               .normal,
                      //     //                                       useGoogleFonts:
                      //     //                                           false,
                      //     //                                     ),
                      //     //                           ),
                      //     //                         ),
                      //     //                       ],
                      //     //                     ),
                      //     //                   ],
                      //     //                 ),
                      //     //                 Container(
                      //     //                   width: 30,
                      //     //                   height: 30,
                      //     //                   clipBehavior: Clip.antiAlias,
                      //     //                   decoration: BoxDecoration(
                      //     //                     shape: BoxShape.circle,
                      //     //                   ),
                      //     //                   child: Image.asset(
                      //     //                     'assets/images/Untitled-3.png',
                      //     //                   ),
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //           ),
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //     Expanded(
                      //     //       child: Column(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         mainAxisAlignment: MainAxisAlignment.end,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 15, 15, 15, 30),
                      //     //             child: Row(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               mainAxisAlignment:
                      //     //                   MainAxisAlignment.spaceBetween,
                      //     //               children: [
                      //     //                 Container(
                      //     //                   width: 111,
                      //     //                   height: 26,
                      //     //                   decoration: BoxDecoration(
                      //     //                     color:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .secondaryBackground,
                      //     //                     image: DecorationImage(
                      //     //                       fit: BoxFit.contain,
                      //     //                       image: Image.asset(
                      //     //                         'assets/images/Group_25034.png',
                      //     //                       ).image,
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //                 Row(
                      //     //                   mainAxisSize: MainAxisSize.max,
                      //     //                   children: [
                      //     //                     InkWell(
                      //     //                       onTap: () async {
                      //     //                         setState(() => FFAppState()
                      //     //                                 .currentFormPageNumber =
                      //     //                             FFAppState()
                      //     //                                     .currentFormPageNumber +
                      //     //                                 -1);
                      //     //                         await pageViewController
                      //     //                             ?.previousPage(
                      //     //                           duration: Duration(
                      //     //                               milliseconds: 300),
                      //     //                           curve: Curves.ease,
                      //     //                         );
                      //     //                       },
                      //     //                       child: Container(
                      //     //                         width: 32,
                      //     //                         height: 32,
                      //     //                         decoration: BoxDecoration(
                      //     //                           color: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .secondaryBackground,
                      //     //                           image: DecorationImage(
                      //     //                             fit: BoxFit.contain,
                      //     //                             image: Image.asset(
                      //     //                               'assets/images/Add_Button_(1).png',
                      //     //                             ).image,
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                     Padding(
                      //     //                       padding: EdgeInsetsDirectional
                      //     //                           .fromSTEB(15, 0, 0, 0),
                      //     //                       child: InkWell(
                      //     //                         onTap: () async {
                      //     //                           setState(() => FFAppState()
                      //     //                               .currentFormPageNumber = 5);
                      //     //                           await pageViewController
                      //     //                               ?.nextPage(
                      //     //                             duration: Duration(
                      //     //                                 milliseconds: 300),
                      //     //                             curve: Curves.ease,
                      //     //                           );
                      //     //                         },
                      //     //                         child: Container(
                      //     //                           width: 42,
                      //     //                           height: 42,
                      //     //                           decoration: BoxDecoration(
                      //     //                             color: FlutterFlowTheme
                      //     //                                     .of(context)
                      //     //                                 .secondaryBackground,
                      //     //                             image: DecorationImage(
                      //     //                               fit: BoxFit.contain,
                      //     //                               image: Image.asset(
                      //     //                                 'assets/images/Add_Button_(2).png',
                      //     //                               ).image,
                      //     //                             ),
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ],
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //           ),
                      //     //         ],
                      //     //       ),
                      //     //     ),
                      //     //   ],
                      //     // ),
                      //     // Column(
                      //     //   mainAxisSize: MainAxisSize.max,
                      //     //   mainAxisAlignment: MainAxisAlignment.start,
                      //     //   children: [
                      //     //     Padding(
                      //     //       padding: EdgeInsetsDirectional.fromSTEB(
                      //     //           20, 20, 0, 20),
                      //     //       child: Row(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 0, 0, 10, 0),
                      //     //             child: Image.asset(
                      //     //               'assets/images/Untitled-8.png',
                      //     //               width: 49,
                      //     //               height: 50,
                      //     //               fit: BoxFit.cover,
                      //     //             ),
                      //     //           ),
                      //     //           Text(
                      //     //             'Add your dependent details below',
                      //     //             style: FlutterFlowTheme.of(context)
                      //     //                 .bodyText1
                      //     //                 .override(
                      //     //                   fontFamily: 'Segoe UI',
                      //     //                   color: Color(0xFF979797),
                      //     //                   fontWeight: FontWeight.normal,
                      //     //                   useGoogleFonts: false,
                      //     //                 ),
                      //     //           ),
                      //     //         ],
                      //     //       ),
                      //     //     ),
                      //     //     Row(
                      //     //       mainAxisSize: MainAxisSize.max,
                      //     //       mainAxisAlignment: MainAxisAlignment.center,
                      //     //       crossAxisAlignment: CrossAxisAlignment.start,
                      //     //       children: [
                      //     //         Column(
                      //     //           mainAxisSize: MainAxisSize.max,
                      //     //           children: [
                      //     //             Text(
                      //     //               'S.No',
                      //     //               style: FlutterFlowTheme.of(context)
                      //     //                   .bodyText1,
                      //     //             ),
                      //     //             Padding(
                      //     //               padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                   0, 20, 0, 0),
                      //     //               child: Container(
                      //     //                 width: 42,
                      //     //                 height: 70,
                      //     //                 decoration: BoxDecoration(
                      //     //                   color: Color(0xFFEEF7FE),
                      //     //                   borderRadius: BorderRadius.only(
                      //     //                     bottomLeft: Radius.circular(10),
                      //     //                     bottomRight: Radius.circular(0),
                      //     //                     topLeft: Radius.circular(10),
                      //     //                     topRight: Radius.circular(0),
                      //     //                   ),
                      //     //                 ),
                      //     //                 child: Align(
                      //     //                   alignment:
                      //     //                       AlignmentDirectional(0, 0),
                      //     //                   child: Text(
                      //     //                     '1',
                      //     //                     style:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .bodyText1,
                      //     //                   ),
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //         Column(
                      //     //           mainAxisSize: MainAxisSize.max,
                      //     //           mainAxisAlignment: MainAxisAlignment.start,
                      //     //           crossAxisAlignment:
                      //     //               CrossAxisAlignment.start,
                      //     //           children: [
                      //     //             Padding(
                      //     //               padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                   10, 0, 0, 0),
                      //     //               child: Text(
                      //     //                 'Relationship',
                      //     //                 style: FlutterFlowTheme.of(context)
                      //     //                     .bodyText1,
                      //     //               ),
                      //     //             ),
                      //     //             Padding(
                      //     //               padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                   0, 20, 0, 0),
                      //     //               child: Container(
                      //     //                 height: 70,
                      //     //                 decoration: BoxDecoration(
                      //     //                   color: FlutterFlowTheme.of(context)
                      //     //                       .secondaryBackground,
                      //     //                   border: Border.all(
                      //     //                     color: Color(0xFF979797),
                      //     //                     width: 0.25,
                      //     //                   ),
                      //     //                 ),
                      //     //                 child: FlutterFlowDropDown(
                      //     //                   options: [
                      //     //                     'Husband',
                      //     //                     'Wife',
                      //     //                     'Child',
                      //     //                     'Father',
                      //     //                     'Mother'
                      //     //                   ],
                      //     //                   onChanged: (val) => setState(
                      //     //                       () => dropDownValue = val),
                      //     //                   width: 180,
                      //     //                   height: 50,
                      //     //                   textStyle:
                      //     //                       FlutterFlowTheme.of(context)
                      //     //                           .bodyText1
                      //     //                           .override(
                      //     //                             fontFamily: 'Segoe UI',
                      //     //                             color: Color(0xFF979797),
                      //     //                             fontWeight:
                      //     //                                 FontWeight.normal,
                      //     //                             useGoogleFonts: false,
                      //     //                           ),
                      //     //                   hintText: 'Select Relationship',
                      //     //                   icon: Icon(
                      //     //                     Icons.keyboard_arrow_down,
                      //     //                     color: Color(0xFF4B65B2),
                      //     //                     size: 20,
                      //     //                   ),
                      //     //                   fillColor: Colors.white,
                      //     //                   elevation: 2,
                      //     //                   borderColor: Colors.transparent,
                      //     //                   borderWidth: 0,
                      //     //                   borderRadius: 0,
                      //     //                   margin:
                      //     //                       EdgeInsetsDirectional.fromSTEB(
                      //     //                           12, 4, 12, 4),
                      //     //                   hidesUnderline: true,
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //         Column(
                      //     //           mainAxisSize: MainAxisSize.max,
                      //     //           mainAxisAlignment: MainAxisAlignment.start,
                      //     //           crossAxisAlignment:
                      //     //               CrossAxisAlignment.start,
                      //     //           children: [
                      //     //             Padding(
                      //     //               padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                   10, 0, 0, 0),
                      //     //               child: Text(
                      //     //                 'Age',
                      //     //                 style: FlutterFlowTheme.of(context)
                      //     //                     .bodyText1,
                      //     //               ),
                      //     //             ),
                      //     //             Padding(
                      //     //               padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                   0, 20, 0, 0),
                      //     //               child: Container(
                      //     //                 width: 100,
                      //     //                 height: 70,
                      //     //                 decoration: BoxDecoration(
                      //     //                   color: FlutterFlowTheme.of(context)
                      //     //                       .secondaryBackground,
                      //     //                   borderRadius: BorderRadius.only(
                      //     //                     bottomLeft: Radius.circular(0),
                      //     //                     bottomRight: Radius.circular(10),
                      //     //                     topLeft: Radius.circular(0),
                      //     //                     topRight: Radius.circular(10),
                      //     //                   ),
                      //     //                   border: Border.all(
                      //     //                     color: Color(0xFF979797),
                      //     //                     width: 0.25,
                      //     //                   ),
                      //     //                 ),
                      //     //                 child: Row(
                      //     //                   mainAxisSize: MainAxisSize.max,
                      //     //                   crossAxisAlignment:
                      //     //                       CrossAxisAlignment.center,
                      //     //                   children: [
                      //     //                     Expanded(
                      //     //                       child: Container(
                      //     //                         decoration: BoxDecoration(
                      //     //                           color: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .secondaryBackground,
                      //     //                         ),
                      //     //                         child: Padding(
                      //     //                           padding:
                      //     //                               EdgeInsetsDirectional
                      //     //                                   .fromSTEB(
                      //     //                                       10, 0, 0, 0),
                      //     //                           child: TextFormField(
                      //     //                             controller:
                      //     //                                 textController,
                      //     //                             autofocus: true,
                      //     //                             obscureText: false,
                      //     //                             decoration:
                      //     //                                 InputDecoration(
                      //     //                               hintText: 'Enter',
                      //     //                               enabledBorder:
                      //     //                                   UnderlineInputBorder(
                      //     //                                 borderSide:
                      //     //                                     BorderSide(
                      //     //                                   color: Color(
                      //     //                                       0x00000000),
                      //     //                                   width: 1,
                      //     //                                 ),
                      //     //                                 borderRadius:
                      //     //                                     const BorderRadius
                      //     //                                         .only(
                      //     //                                   topLeft:
                      //     //                                       Radius.circular(
                      //     //                                           4.0),
                      //     //                                   topRight:
                      //     //                                       Radius.circular(
                      //     //                                           4.0),
                      //     //                                 ),
                      //     //                               ),
                      //     //                               focusedBorder:
                      //     //                                   UnderlineInputBorder(
                      //     //                                 borderSide:
                      //     //                                     BorderSide(
                      //     //                                   color: Color(
                      //     //                                       0x00000000),
                      //     //                                   width: 1,
                      //     //                                 ),
                      //     //                                 borderRadius:
                      //     //                                     const BorderRadius
                      //     //                                         .only(
                      //     //                                   topLeft:
                      //     //                                       Radius.circular(
                      //     //                                           4.0),
                      //     //                                   topRight:
                      //     //                                       Radius.circular(
                      //     //                                           4.0),
                      //     //                                 ),
                      //     //                               ),
                      //     //                             ),
                      //     //                             style:
                      //     //                                 FlutterFlowTheme.of(
                      //     //                                         context)
                      //     //                                     .bodyText1
                      //     //                                     .override(
                      //     //                                       fontFamily:
                      //     //                                           'Segoe UI',
                      //     //                                       color: Color(
                      //     //                                           0xFF979797),
                      //     //                                       fontWeight:
                      //     //                                           FontWeight
                      //     //                                               .normal,
                      //     //                                       useGoogleFonts:
                      //     //                                           false,
                      //     //                                     ),
                      //     //                             keyboardType:
                      //     //                                 TextInputType.number,
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                     Padding(
                      //     //                       padding: EdgeInsetsDirectional
                      //     //                           .fromSTEB(0, 0, 10, 0),
                      //     //                       child: Container(
                      //     //                         width: 24,
                      //     //                         height: 24,
                      //     //                         clipBehavior: Clip.antiAlias,
                      //     //                         decoration: BoxDecoration(
                      //     //                           shape: BoxShape.circle,
                      //     //                         ),
                      //     //                         child: Image.asset(
                      //     //                           'assets/images/Untitled-9.png',
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ],
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //       ],
                      //     //     ),
                      //     //     Expanded(
                      //     //       child: Column(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         mainAxisAlignment: MainAxisAlignment.end,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 15, 15, 15, 30),
                      //     //             child: Row(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               mainAxisAlignment:
                      //     //                   MainAxisAlignment.spaceBetween,
                      //     //               children: [
                      //     //                 Container(
                      //     //                   width: 111,
                      //     //                   height: 26,
                      //     //                   decoration: BoxDecoration(
                      //     //                     color:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .secondaryBackground,
                      //     //                     image: DecorationImage(
                      //     //                       fit: BoxFit.contain,
                      //     //                       image: Image.asset(
                      //     //                         'assets/images/Group_25034.png',
                      //     //                       ).image,
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //                 Row(
                      //     //                   mainAxisSize: MainAxisSize.max,
                      //     //                   children: [
                      //     //                     InkWell(
                      //     //                       onTap: () async {
                      //     //                         setState(() => FFAppState()
                      //     //                                 .currentFormPageNumber =
                      //     //                             FFAppState()
                      //     //                                     .currentFormPageNumber +
                      //     //                                 -1);
                      //     //                         await pageViewController
                      //     //                             ?.previousPage(
                      //     //                           duration: Duration(
                      //     //                               milliseconds: 300),
                      //     //                           curve: Curves.ease,
                      //     //                         );
                      //     //                       },
                      //     //                       child: Container(
                      //     //                         width: 32,
                      //     //                         height: 32,
                      //     //                         decoration: BoxDecoration(
                      //     //                           color: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .secondaryBackground,
                      //     //                           image: DecorationImage(
                      //     //                             fit: BoxFit.contain,
                      //     //                             image: Image.asset(
                      //     //                               'assets/images/Add_Button_(1).png',
                      //     //                             ).image,
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                     Padding(
                      //     //                       padding: EdgeInsetsDirectional
                      //     //                           .fromSTEB(15, 0, 0, 0),
                      //     //                       child: InkWell(
                      //     //                         onTap: () async {
                      //     //                           setState(() => FFAppState()
                      //     //                               .currentFormPageNumber = 6);
                      //     //                           await pageViewController
                      //     //                               ?.nextPage(
                      //     //                             duration: Duration(
                      //     //                                 milliseconds: 300),
                      //     //                             curve: Curves.ease,
                      //     //                           );
                      //     //                         },
                      //     //                         child: Container(
                      //     //                           width: 42,
                      //     //                           height: 42,
                      //     //                           decoration: BoxDecoration(
                      //     //                             color: FlutterFlowTheme
                      //     //                                     .of(context)
                      //     //                                 .secondaryBackground,
                      //     //                             image: DecorationImage(
                      //     //                               fit: BoxFit.contain,
                      //     //                               image: Image.asset(
                      //     //                                 'assets/images/Add_Button_(2).png',
                      //     //                               ).image,
                      //     //                             ),
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ],
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //           ),
                      //     //         ],
                      //     //       ),
                      //     //     ),
                      //     //   ],
                      //     // ),
                      //     // Column(
                      //     //   mainAxisSize: MainAxisSize.max,
                      //     //   mainAxisAlignment: MainAxisAlignment.start,
                      //     //   children: [
                      //     //     Padding(
                      //     //       padding: EdgeInsetsDirectional.fromSTEB(
                      //     //           20, 20, 0, 20),
                      //     //       child: Row(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 0, 0, 10, 0),
                      //     //             child: Image.asset(
                      //     //               'assets/images/Untitled-10.png',
                      //     //               width: 49,
                      //     //               height: 50,
                      //     //               fit: BoxFit.cover,
                      //     //             ),
                      //     //           ),
                      //     //           Text(
                      //     //             'Add your outstanding details',
                      //     //             style: FlutterFlowTheme.of(context)
                      //     //                 .bodyText1
                      //     //                 .override(
                      //     //                   fontFamily: 'Segoe UI',
                      //     //                   color: Color(0xFF979797),
                      //     //                   fontWeight: FontWeight.normal,
                      //     //                   useGoogleFonts: false,
                      //     //                 ),
                      //     //           ),
                      //     //         ],
                      //     //       ),
                      //     //     ),
                      //     //     Container(
                      //     //       width: MediaQuery.of(context).size.width * 0.9,
                      //     //       decoration: BoxDecoration(
                      //     //         color: FlutterFlowTheme.of(context)
                      //     //             .secondaryBackground,
                      //     //         boxShadow: [
                      //     //           BoxShadow(
                      //     //             blurRadius: 16,
                      //     //             color: Color(0x0D000000),
                      //     //             offset: Offset(0, 4),
                      //     //           )
                      //     //         ],
                      //     //         borderRadius: BorderRadius.circular(10),
                      //     //         border: Border.all(
                      //     //           color: Color(0x80979797),
                      //     //           width: 0.25,
                      //     //         ),
                      //     //       ),
                      //     //       child: Padding(
                      //     //         padding: EdgeInsetsDirectional.fromSTEB(
                      //     //             10, 10, 10, 10),
                      //     //         child: Row(
                      //     //           mainAxisSize: MainAxisSize.max,
                      //     //           mainAxisAlignment:
                      //     //               MainAxisAlignment.spaceBetween,
                      //     //           children: [
                      //     //             Column(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               children: [
                      //     //                 Column(
                      //     //                   mainAxisSize: MainAxisSize.max,
                      //     //                   crossAxisAlignment:
                      //     //                       CrossAxisAlignment.start,
                      //     //                   children: [
                      //     //                     Text(
                      //     //                       'Applicant 1 Outstandings',
                      //     //                       style: FlutterFlowTheme.of(
                      //     //                               context)
                      //     //                           .bodyText1
                      //     //                           .override(
                      //     //                             fontFamily: 'Segoe UI',
                      //     //                             color:
                      //     //                                 FlutterFlowTheme.of(
                      //     //                                         context)
                      //     //                                     .primaryColor,
                      //     //                             useGoogleFonts: false,
                      //     //                           ),
                      //     //                     ),
                      //     //                     Padding(
                      //     //                       padding: EdgeInsetsDirectional
                      //     //                           .fromSTEB(0, 5, 0, 0),
                      //     //                       child: Text(
                      //     //                         'Carole Demas',
                      //     //                         style: FlutterFlowTheme.of(
                      //     //                                 context)
                      //     //                             .bodyText1
                      //     //                             .override(
                      //     //                               fontFamily: 'Segoe UI',
                      //     //                               color:
                      //     //                                   Color(0xFF979797),
                      //     //                               useGoogleFonts: false,
                      //     //                             ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ],
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //             Column(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               children: [
                      //     //                 InkWell(
                      //     //                   onTap: () async {
                      //     //                     await showModalBottomSheet(
                      //     //                       isScrollControlled: true,
                      //     //                       backgroundColor:
                      //     //                           FlutterFlowTheme.of(context)
                      //     //                               .primaryBackground,
                      //     //                       barrierColor:
                      //     //                           FlutterFlowTheme.of(context)
                      //     //                               .primaryBackground,
                      //     //                       context: context,
                      //     //                       builder: (context) {
                      //     //                         return Padding(
                      //     //                           padding:
                      //     //                               MediaQuery.of(context)
                      //     //                                   .viewInsets,
                      //     //                           child: Container(
                      //     //                             height:
                      //     //                                 MediaQuery.of(context)
                      //     //                                         .size
                      //     //                                         .height *
                      //     //                                     1,
                      //     //                             child:
                      //     //                                 OutstandingDetailsWidget(),
                      //     //                           ),
                      //     //                         );
                      //     //                       },
                      //     //                     );
                      //     //                   },
                      //     //                   child: Container(
                      //     //                     width: 30,
                      //     //                     height: 30,
                      //     //                     clipBehavior: Clip.antiAlias,
                      //     //                     decoration: BoxDecoration(
                      //     //                       shape: BoxShape.circle,
                      //     //                     ),
                      //     //                     child: Image.asset(
                      //     //                       'assets/images/Untitled-3.png',
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //     Padding(
                      //     //       padding:
                      //     //           EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      //     //       child: Container(
                      //     //         width:
                      //     //             MediaQuery.of(context).size.width * 0.9,
                      //     //         decoration: BoxDecoration(
                      //     //           color: FlutterFlowTheme.of(context)
                      //     //               .secondaryBackground,
                      //     //           boxShadow: [
                      //     //             BoxShadow(
                      //     //               blurRadius: 16,
                      //     //               color: Color(0x0C000000),
                      //     //               offset: Offset(0, 4),
                      //     //             )
                      //     //           ],
                      //     //           borderRadius: BorderRadius.circular(10),
                      //     //           border: Border.all(
                      //     //             color: Color(0x80979797),
                      //     //             width: 0.25,
                      //     //           ),
                      //     //         ),
                      //     //         child: Padding(
                      //     //           padding: EdgeInsetsDirectional.fromSTEB(
                      //     //               10, 10, 10, 10),
                      //     //           child: Row(
                      //     //             mainAxisSize: MainAxisSize.max,
                      //     //             mainAxisAlignment:
                      //     //                 MainAxisAlignment.spaceBetween,
                      //     //             children: [
                      //     //               Column(
                      //     //                 mainAxisSize: MainAxisSize.max,
                      //     //                 children: [
                      //     //                   Column(
                      //     //                     mainAxisSize: MainAxisSize.max,
                      //     //                     crossAxisAlignment:
                      //     //                         CrossAxisAlignment.start,
                      //     //                     children: [
                      //     //                       Text(
                      //     //                         'Applicant 2 Outstandings',
                      //     //                         style: FlutterFlowTheme.of(
                      //     //                                 context)
                      //     //                             .bodyText1
                      //     //                             .override(
                      //     //                               fontFamily: 'Segoe UI',
                      //     //                               color:
                      //     //                                   FlutterFlowTheme.of(
                      //     //                                           context)
                      //     //                                       .primaryColor,
                      //     //                               useGoogleFonts: false,
                      //     //                             ),
                      //     //                       ),
                      //     //                       Padding(
                      //     //                         padding: EdgeInsetsDirectional
                      //     //                             .fromSTEB(0, 5, 0, 0),
                      //     //                         child: Text(
                      //     //                           'Carole Demas',
                      //     //                           style: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .bodyText1
                      //     //                               .override(
                      //     //                                 fontFamily:
                      //     //                                     'Segoe UI',
                      //     //                                 color:
                      //     //                                     Color(0xFF979797),
                      //     //                                 useGoogleFonts: false,
                      //     //                               ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ],
                      //     //                   ),
                      //     //                 ],
                      //     //               ),
                      //     //               InkWell(
                      //     //                 onTap: () async {
                      //     //                   await showModalBottomSheet(
                      //     //                     isScrollControlled: true,
                      //     //                     backgroundColor:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .primaryBackground,
                      //     //                     barrierColor:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .primaryBackground,
                      //     //                     context: context,
                      //     //                     builder: (context) {
                      //     //                       return Padding(
                      //     //                         padding:
                      //     //                             MediaQuery.of(context)
                      //     //                                 .viewInsets,
                      //     //                         child: Container(
                      //     //                           height:
                      //     //                               MediaQuery.of(context)
                      //     //                                       .size
                      //     //                                       .height *
                      //     //                                   1,
                      //     //                           child:
                      //     //                               OutstandingDetailsWidget(),
                      //     //                         ),
                      //     //                       );
                      //     //                     },
                      //     //                   );
                      //     //                 },
                      //     //                 child: Container(
                      //     //                   width: 30,
                      //     //                   height: 30,
                      //     //                   clipBehavior: Clip.antiAlias,
                      //     //                   decoration: BoxDecoration(
                      //     //                     shape: BoxShape.circle,
                      //     //                   ),
                      //     //                   child: Image.asset(
                      //     //                     'assets/images/Untitled-3.png',
                      //     //                   ),
                      //     //                 ),
                      //     //               ),
                      //     //             ],
                      //     //           ),
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //     Expanded(
                      //     //       child: Column(
                      //     //         mainAxisSize: MainAxisSize.max,
                      //     //         mainAxisAlignment: MainAxisAlignment.end,
                      //     //         children: [
                      //     //           Padding(
                      //     //             padding: EdgeInsetsDirectional.fromSTEB(
                      //     //                 15, 15, 15, 30),
                      //     //             child: Row(
                      //     //               mainAxisSize: MainAxisSize.max,
                      //     //               mainAxisAlignment:
                      //     //                   MainAxisAlignment.spaceBetween,
                      //     //               children: [
                      //     //                 Container(
                      //     //                   width: 111,
                      //     //                   height: 26,
                      //     //                   decoration: BoxDecoration(
                      //     //                     color:
                      //     //                         FlutterFlowTheme.of(context)
                      //     //                             .secondaryBackground,
                      //     //                     image: DecorationImage(
                      //     //                       fit: BoxFit.contain,
                      //     //                       image: Image.asset(
                      //     //                         'assets/images/Group_25034.png',
                      //     //                       ).image,
                      //     //                     ),
                      //     //                   ),
                      //     //                 ),
                      //     //                 Row(
                      //     //                   mainAxisSize: MainAxisSize.max,
                      //     //                   children: [
                      //     //                     InkWell(
                      //     //                       onTap: () async {
                      //     //                         setState(() => FFAppState()
                      //     //                                 .currentFormPageNumber =
                      //     //                             FFAppState()
                      //     //                                     .currentFormPageNumber +
                      //     //                                 -1);
                      //     //                         await pageViewController
                      //     //                             ?.previousPage(
                      //     //                           duration: Duration(
                      //     //                               milliseconds: 300),
                      //     //                           curve: Curves.ease,
                      //     //                         );
                      //     //                       },
                      //     //                       child: Container(
                      //     //                         width: 32,
                      //     //                         height: 32,
                      //     //                         decoration: BoxDecoration(
                      //     //                           color: FlutterFlowTheme.of(
                      //     //                                   context)
                      //     //                               .secondaryBackground,
                      //     //                           image: DecorationImage(
                      //     //                             fit: BoxFit.contain,
                      //     //                             image: Image.asset(
                      //     //                               'assets/images/Add_Button_(1).png',
                      //     //                             ).image,
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                     Padding(
                      //     //                       padding: EdgeInsetsDirectional
                      //     //                           .fromSTEB(15, 0, 0, 0),
                      //     //                       child: InkWell(
                      //     //                         onTap: () async {
                      //     //                           // setState(() => FFAppState()
                      //     //                           //     .currentFormPageNumber = 6);
                      //     //                           // await pageViewController
                      //     //                           //     ?.nextPage(
                      //     //                           //   duration: Duration(
                      //     //                           //       milliseconds: 300),
                      //     //                           //   curve: Curves.ease,
                      //     //                           // );
                      //     //                           Navigator.pop(context);
                      //     //                         },
                      //     //                         child: Container(
                      //     //                           width: 42,
                      //     //                           height: 42,
                      //     //                           decoration: BoxDecoration(
                      //     //                             color: FlutterFlowTheme
                      //     //                                     .of(context)
                      //     //                                 .secondaryBackground,
                      //     //                             image: DecorationImage(
                      //     //                               fit: BoxFit.contain,
                      //     //                               image: Image.asset(
                      //     //                                 'assets/images/Add_Button_(2).png',
                      //     //                               ).image,
                      //     //                             ),
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                     ),
                      //     //                   ],
                      //     //                 ),
                      //     //               ],
                      //     //             ),
                      //     //           ),
                      //     //         ],
                      //     //       ),
                      //     //     ),
                      //     //   ],
                      //     // ),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
