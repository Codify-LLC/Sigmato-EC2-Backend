import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/backend/api.dart';
import 'package:freedom/components/edit_address_details_widget.dart';
import 'package:freedom/components/edit_applicant_details_widget.dart';
import 'package:freedom/components/edit_occupation_details_widget.dart';
import 'package:freedom/components/edit_previous_address.dart';
import 'package:freedom/components/finished_widget.dart';
import 'package:freedom/components/outstanding_details_widget.dart';
import 'package:freedom/form1Pages/dependent_details.dart';
import 'package:freedom/reload.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  PageController? pageViewController = PageController(initialPage: 0);
  String? dropDownValue1;
  String? dropDownValue2;
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool applicantDetails = false;
  bool applicantAddress = false;
  bool applicantOccupation = false;
  bool outstandingDetails = false;
  bool jointApplicant1 = false;
  bool jointApplicant2 = false;
  bool sameAs = true;
  bool isValue = false;
  dynamic data;
  String? name;
  String? typeOfAddress;
  String? occupation;
  bool add = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    setData();
    getOccupation();
  }

  Future getOccupation() async {
    final prefs = await SharedPreferences.getInstance();
    final occupatn = prefs.getString("occupation");

    setState(() {
      occupation = occupatn;
    });
  }

  // http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500

  Future setData() async {
    // final data = await ApiFunctions().getApplicantData();
    final prefs = await SharedPreferences.getInstance();
    final namee = prefs.getString("applicant_name");
    // print(data["firstname"]);

    setState(() {
      name = namee;
    });
  }

  Future addApplicantDependentDetails() async {
    final id = await ApiFunctions().getApplicantId();
    print(id);

    // var values = [];

    try {
      var data = [
        {
          dropDownValue1: textController1?.text,
        },
      ];

      // values.add(data);
      if (add == true) {
        data.add({
          dropDownValue2: textController2?.text,
        });
      }

      final jsonData = jsonEncode(data);

      var response = await http.patch(
        Uri.parse(
            "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/applicant/${id}"),
        body: {
          "dependents": jsonData,
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Data succesfully saved",
          backgroundColor: Colors.green,
        );
        setState(() => FFAppState().currentFormPageNumber = 6);
        await pageViewController?.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        print(response.body);
        Fluttertoast.showToast(
          msg: "Error while saving data, try again",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
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
                          FFAppState().currentFormPageNumber.toString(),
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
                if (FFAppState().currentFormPageNumber == 1)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'I\'m interested in',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                if (FFAppState().currentFormPageNumber == 2)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Applicant Details',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                if (FFAppState().currentFormPageNumber == 3)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Address',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                if (FFAppState().currentFormPageNumber == 4)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Occupation Details',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                if (FFAppState().currentFormPageNumber == 5)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Dependent Details',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                if (FFAppState().currentFormPageNumber == 6)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Outstanding Details',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                  child: LinearPercentIndicator(
                    percent: valueOrDefault<double>(
                      functions.progressCalculator(
                          6, FFAppState().currentFormPageNumber),
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
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageViewController ??= PageController(
                            initialPage: min(
                                valueOrDefault<int>(
                                  functions.subtractor(
                                      FFAppState().currentFormPageNumber, 1),
                                  0,
                                ),
                                5)),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Text(
                                            'What are you looking for?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Segoe UI',
                                                  fontSize: 18,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().whatAreYouLookingFor ==
                                            'Purchase')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 157,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF4B65B2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      'Purchase',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    setState(() => FFAppState()
                                                            .whatAreYouLookingFor =
                                                        'Remortgage');
                                                  },
                                                  child: Container(
                                                    width: 157,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEF7FE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        'Remortgage',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (FFAppState().whatAreYouLookingFor ==
                                            'Remortgage')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    setState(() => FFAppState()
                                                            .whatAreYouLookingFor =
                                                        'Purchase');
                                                  },
                                                  child: Container(
                                                    width: 157,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEF7FE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        'Purchase',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 157,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF4B65B2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      'Remortgage',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Segoe UI',
                                                            color: Colors.white,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Text(
                                          'Select your option below',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Segoe UI',
                                                fontSize: 16,
                                                useGoogleFonts: false,
                                                lineHeight: 2,
                                              ),
                                        ),
                                        if (FFAppState().whatAreYouLookingFor ==
                                            'Purchase')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                if (FFAppState()
                                                        .PurchaseOptionSelected !=
                                                    'First Time Buyer')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .PurchaseOptionSelected =
                                                            'First Time Buyer');
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'First Time Buyer',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected ==
                                                    'First Time Buyer')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: Container(
                                                      width: 100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'First Time Buyer',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected !=
                                                    'Help to Buy')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .PurchaseOptionSelected =
                                                            'Help to Buy');
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Help to Buy',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected ==
                                                    'Help to Buy')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: Container(
                                                      width: 100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Help to Buy',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected !=
                                                    'Home Mover')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .PurchaseOptionSelected =
                                                            'Home Mover');
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Home Mover',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected ==
                                                    'Home Mover')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: Container(
                                                      width: 100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Home Mover',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected !=
                                                    'Buy to Let')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .PurchaseOptionSelected =
                                                            'Buy to Let');
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Buy to Let',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .PurchaseOptionSelected ==
                                                    'Buy to Let')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: Container(
                                                      width: 100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Buy to Let',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        if (FFAppState().whatAreYouLookingFor ==
                                            'Remortgage')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                if (FFAppState()
                                                        .RemortgageOptionSelected !=
                                                    'Residential Remortgage')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .RemortgageOptionSelected =
                                                            'Residential Remortgage');
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Residential Remortgage',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .RemortgageOptionSelected ==
                                                    'Residential Remortgage')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: Container(
                                                      width: 100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Residential Remortgage',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .RemortgageOptionSelected !=
                                                    'Buy-to-let Remortgage')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .RemortgageOptionSelected =
                                                            'Buy-to-let Remortgage');
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEF7FE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Buy-to-let Remortgage',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .RemortgageOptionSelected ==
                                                    'Buy-to-let Remortgage')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 15),
                                                    child: Container(
                                                      width: 100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Buy-to-let Remortgage',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 16,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
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
                                                  .currentFormPageNumber = 2);
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
                                    Text(
                                      'Number of applicants?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 18,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 15),
                                      child: Text(
                                        'Planning to buy the property as single applicant or joint applicant',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Color(0xFF979797),
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    if (FFAppState().numberOfApplicants ==
                                        'Single Applicant')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 157,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF4B65B2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Single Applicant',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Segoe UI',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                setState(() => FFAppState()
                                                        .numberOfApplicants =
                                                    'Joint Applicant');
                                              },
                                              child: Container(
                                                width: 157,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEF7FE),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    'Joint Applicant',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().numberOfApplicants ==
                                        'Joint Applicant')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                setState(() => FFAppState()
                                                        .numberOfApplicants =
                                                    'Single Applicant');
                                              },
                                              child: Container(
                                                width: 157,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEF7FE),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    'Single Applicant',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Segoe UI',
                                                          color: Colors.black,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 157,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF4B65B2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Joint Applicant',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Segoe UI',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Text(
                                        'Applicant Details',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              fontSize: 18,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    if (FFAppState().numberOfApplicants ==
                                        'Single Applicant')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: applicantDetails
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 16,
                                                      color: Color(0x0C000000),
                                                      offset: Offset(0, 4),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 18,
                                                    vertical: 11),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Applicant Details",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFF4B65B2),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          name ?? "Name",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xFF979797),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
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
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    child:
                                                                        EditApplicantDetails(),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Image.asset(
                                                            "assets/images/edit.png",
                                                            height: 18,
                                                            width: 18,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              applicantDetails =
                                                                  false;
                                                            });
                                                          },
                                                          child: Image.asset(
                                                            "assets/images/delete.png",
                                                            height: 18,
                                                            width: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () async {
                                                  final value =
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
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                          child:
                                                              ApplicantDetailsWidget(
                                                            type:
                                                                "Single Applicant",
                                                            heading:
                                                                'Applicant Details',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  setState(() {
                                                    applicantDetails = value;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 16,
                                                        color:
                                                            Color(0x0C000000),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'Add Applicant Details',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                color: Color(
                                                                    0xFF4B65B2),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Container(
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
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      1, 0),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.arrow_forward,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    if (FFAppState().numberOfApplicants ==
                                        'Joint Applicant')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          jointApplicant1
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 16,
                                                        color:
                                                            Color(0x0C000000),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 11),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Applicant 1 Details",
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xFF4B65B2),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            name ?? "Name",
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
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
                                                                          EditApplicantDetails(),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/edit.png",
                                                              height: 18,
                                                              width: 18,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                applicantDetails =
                                                                    false;
                                                              });
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/delete.png",
                                                              height: 18,
                                                              width: 18,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 15, 0, 0),
                                                  child: InkWell(
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
                                                                  ApplicantDetailsWidget(
                                                                type:
                                                                    "Joint Applicant",
                                                                heading:
                                                                    'Applicant 1 Details',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      setState(() {
                                                        jointApplicant1 = value;
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 16,
                                                            color: Color(
                                                                0x0C000000),
                                                            offset:
                                                                Offset(0, 4),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              'Add Applicant 1 Details',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    color: Color(
                                                                        0xFF4B65B2),
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Container(
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
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          1, 0),
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          jointApplicant2
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 16,
                                                        color:
                                                            Color(0x0C000000),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 11),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Applicant 1 Details",
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xFF4B65B2),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            name ?? "Name",
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
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
                                                                          EditApplicantDetails(),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/edit.png",
                                                              height: 18,
                                                              width: 18,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                applicantDetails =
                                                                    false;
                                                              });
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/delete.png",
                                                              height: 18,
                                                              width: 18,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 15, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
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
                                                                  ApplicantDetailsWidget(
                                                                type:
                                                                    "Joint Applicant",
                                                                heading:
                                                                    'Applicant 2 Details',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 16,
                                                            color: Color(
                                                                0x0C000000),
                                                            offset:
                                                                Offset(0, 4),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              'Add Applicant 2 Details',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    color: Color(
                                                                        0xFF4B65B2),
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Container(
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
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          1, 0),
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
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
                                                      .currentFormPageNumber =
                                                  FFAppState()
                                                          .currentFormPageNumber +
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
                                                final id = await ApiFunctions()
                                                    .getApplicantId();
                                                if (id == null) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Fill the Applicant Details form to continue");
                                                } else {
                                                  setState(() => FFAppState()
                                                      .currentFormPageNumber = 3);
                                                  await pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                }
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
                          //ADDRESS DETAILS
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
                                          0, 0, 0, 5),
                                      child: Text(
                                        'Add the last 3 years of your address history',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              fontSize: 16,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 15),
                                      child: Text(
                                        'Add your addresses in order, starting with the most recent. You can add UK and foreign addresses.\n',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              color: Color(0xFF979797),
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Address Details',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Segoe UI',
                                              fontSize: 18,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    if (FFAppState().numberOfApplicants ==
                                        'Single Applicant')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    child: AddAddressWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 16,
                                                  color: Color(0x0C000000),
                                                  offset: Offset(0, 4),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 10, 20, 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Applicant Address',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: Color(
                                                                      0xFF4B65B2),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Hello World',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: 26.67,
                                                        height: 26.67,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFF4B65B2),
                                                              Color(0xFF13BBE6)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    1, 0),
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.arrow_forward,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (FFAppState()
                                                          .currentAddress ==
                                                      true)
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 11,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Current Address",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFF4B65B2),
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Text(
                                                                name ?? "Name",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xFF979797),
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1,
                                                                          child:
                                                                              EditAddressDetails(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/edit.png",
                                                                  height: 18,
                                                                  width: 18,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await ApiFunctions()
                                                                      .deleteApplicantDetails(
                                                                          "currentaddress");
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .previousAddress =
                                                                        false;
                                                                  });
                                                                },
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/delete.png",
                                                                  height: 18,
                                                                  width: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (FFAppState()
                                                          .previousAddress ==
                                                      true)
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 11,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Previous Address",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          14,
                                                                      color: Color(
                                                                          0xFF4B65B2),
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Text(
                                                                name ?? "Name",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xFF979797),
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1,
                                                                          child:
                                                                              EditPreviousAddress(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/edit.png",
                                                                  height: 18,
                                                                  width: 18,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await ApiFunctions()
                                                                      .deleteApplicantDetails(
                                                                          "previousaddress");
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .previousAddress =
                                                                        false;
                                                                  });
                                                                },
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/delete.png",
                                                                  height: 18,
                                                                  width: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().numberOfApplicants ==
                                        'Joint Applicant')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final value =
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
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            1,
                                                        child:
                                                            AddAddressWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                setState(() {
                                                  applicantAddress = value;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 16,
                                                      color: Color(0x0C000000),
                                                      offset: Offset(0, 4),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18, 11, 18, 11),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Applicant 1 Address',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      color: Color(
                                                                          0xFF4B65B2),
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Hello World',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      color: Color(
                                                                          0xFF979797),
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Visibility(
                                                            visible:
                                                                !applicantAddress,
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
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          1, 0),
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      if (FFAppState()
                                                              .currentAddress ==
                                                          true)
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 11,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Current Address",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Segoe UI',
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Color(0xFF4B65B2),
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    name ??
                                                                        "Name",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Segoe UI',
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Color(0xFF979797),
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        barrierColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height * 1,
                                                                              child: EditAddressDetails(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/edit.png",
                                                                      height:
                                                                          18,
                                                                      width: 18,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await ApiFunctions()
                                                                          .deleteApplicantDetails(
                                                                              "currentaddress");
                                                                      setState(
                                                                          () {
                                                                        applicantAddress =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/delete.png",
                                                                      height:
                                                                          18,
                                                                      width: 18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .previousAddress ==
                                                          true)
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 11,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Previous Address",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Segoe UI',
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Color(0xFF4B65B2),
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    name ??
                                                                        "Name",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Segoe UI',
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Color(0xFF979797),
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        barrierColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height * 1,
                                                                              child: EditPreviousAddress(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/edit.png",
                                                                      height:
                                                                          18,
                                                                      width: 18,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await ApiFunctions()
                                                                          .deleteApplicantDetails(
                                                                              "previousaddress");
                                                                      setState(
                                                                          () {
                                                                        applicantAddress =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/delete.png",
                                                                      height:
                                                                          18,
                                                                      width: 18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: InkWell(
                                              // onTap: () async {
                                              //   await showModalBottomSheet(
                                              //     isScrollControlled: true,
                                              //     backgroundColor:
                                              //         FlutterFlowTheme.of(
                                              //                 context)
                                              //             .primaryBackground,
                                              //     barrierColor:
                                              //         FlutterFlowTheme.of(
                                              //                 context)
                                              //             .primaryBackground,
                                              //     context: context,
                                              //     builder: (context) {
                                              //       return Padding(
                                              //         padding:
                                              //             MediaQuery.of(context)
                                              //                 .viewInsets,
                                              //         child: Container(
                                              //           height: MediaQuery.of(
                                              //                       context)
                                              //                   .size
                                              //                   .height *
                                              //               1,
                                              //           child:
                                              //               AddAddressWidget(),
                                              //         ),
                                              //       );
                                              //     },
                                              //   );
                                              // },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 16,
                                                      color: Color(0x0C000000),
                                                      offset: Offset(0, 4),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18, 11, 18, 11),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Applicant 2 Address',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
                                                                      color: Color(
                                                                          0xFF4B65B2),
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),

                                                              // Text(
                                                              //   'Hello World',
                                                              //   style: FlutterFlowTheme
                                                              //           .of(context)
                                                              //       .bodyText1
                                                              //       .override(
                                                              //         fontFamily:
                                                              //             'Segoe UI',
                                                              //         color: Color(
                                                              //             0xFF979797),
                                                              //         fontSize: 12,
                                                              //         fontWeight:
                                                              //             FontWeight
                                                              //                 .normal,
                                                              //         useGoogleFonts:
                                                              //             false,
                                                              //       ),
                                                              // ),
                                                            ],
                                                          ),
                                                          Container(
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
                                                                stops: [0, 1],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        -1, 0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isValue =
                                                                        !isValue;
                                                                  });
                                                                },
                                                                child: isValue ==
                                                                        true
                                                                    ? Image
                                                                        .asset(
                                                                        "assets/images/verified-square.png",
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            20,
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            20,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          border:
                                                                              Border.all(color: Colors.black),
                                                                        ),
                                                                      ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  " check this box if the address is same as applicant 1.",
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    color: Color(
                                                                        0xFF263238),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        13,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            // WidgetSpan(
                                                            //   child: Image
                                                            //       .asset(
                                                            //     "assets/images/LOGO.png",
                                                            //     height: 18,
                                                            //     width: 18,
                                                            //   ),
                                                            // ),
                                                            // TextSpan(
                                                            //   text:
                                                            //       " Freedom Circle their information and to process this application. As far as I know, all of the information is correct.",
                                                            //   style: FlutterFlowTheme.of(
                                                            //           context)
                                                            //       .bodyText1
                                                            //       .override(
                                                            //         fontFamily:
                                                            //             'Segoe UI',
                                                            //         color: Color(
                                                            //             0xFF263238),
                                                            //         fontWeight:
                                                            //             FontWeight.w400,
                                                            //         fontSize:
                                                            //             13,
                                                            //         useGoogleFonts:
                                                            //             false,
                                                            //       ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                                      .currentFormPageNumber =
                                                  FFAppState()
                                                          .currentFormPageNumber +
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
                                                setState(() => FFAppState()
                                                    .currentFormPageNumber = 4);
                                                await pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
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
                          //
                          //
                          //
                          //
                          // OCCUPATION DETAILS
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Image.asset(
                                        'assets/images/Untitled-7.png',
                                        width: 49,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Add your job or profession details ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF979797),
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (FFAppState().numberOfApplicants ==
                                  'Single Applicant')
                                applicantOccupation
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 16,
                                              color: Color(0x0D000000),
                                              offset: Offset(0, 4),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color(0x80979797),
                                            width: 0.25,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 11),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Occupation Details",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Segoe UI',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF4B65B2),
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${name ?? ""} - ${occupation ?? ""}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Segoe UI',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF979797),
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
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
                                                                EditOccupationDetails(),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/edit.png",
                                                    height: 18,
                                                    width: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await ApiFunctions()
                                                        .deleteApplicantDetails(
                                                            "occupation");
                                                    setState(() {
                                                      applicantOccupation =
                                                          false;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/delete.png",
                                                    height: 18,
                                                    width: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () async {
                                          final value =
                                              await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  child:
                                                      OccupationDetailsWidget(),
                                                ),
                                              );
                                            },
                                          );

                                          setState(() {
                                            applicantOccupation = value;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 16,
                                                color: Color(0x0D000000),
                                                offset: Offset(0, 4),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color(0x80979797),
                                              width: 0.25,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Applicant 1',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
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
                                                                  .fromSTEB(0,
                                                                      5, 0, 0),
                                                          child: Text(
                                                            '${name ?? "Name"} - ${occupation ?? ""}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              if (FFAppState().numberOfApplicants ==
                                  'Joint Applicant')
                                Column(
                                  children: [
                                    FFAppState().applicant1occupation
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 16,
                                                  color: Color(0x0D000000),
                                                  offset: Offset(0, 4),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color(0x80979797),
                                                width: 0.25,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 11),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Occupation Details",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Segoe UI',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF4B65B2),
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '${name ?? ""} - ${occupation ?? ""}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Segoe UI',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xFF979797),
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
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
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    1,
                                                                child:
                                                                    EditOccupationDetails(),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/edit.png",
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        await ApiFunctions()
                                                            .deleteApplicantDetails(
                                                                "occupation");
                                                        setState(() {
                                                          applicantOccupation =
                                                              false;
                                                        });
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/delete.png",
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final value =
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
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                          child:
                                                              OccupationDetailsWidget(
                                                            heading:
                                                                "Applicant 1",
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  setState(() {
                                                    applicantOccupation = value;
                                                  });
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 16,
                                                        color:
                                                            Color(0x0D000000),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color(0x80979797),
                                                      width: 0.25,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Applicant 1',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Segoe UI',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    '${name ?? ""} - ${occupation ?? ""}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Segoe UI',
                                                                          color:
                                                                              Color(0xFF979797),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Untitled-3.png',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    FFAppState().applicant2occupation
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 16,
                                                  color: Color(0x0D000000),
                                                  offset: Offset(0, 4),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color(0x80979797),
                                                width: 0.25,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 11),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Occupation Details",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Segoe UI',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF4B65B2),
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '${name ?? ""} - ${occupation ?? ""}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Segoe UI',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xFF979797),
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
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
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    1,
                                                                child:
                                                                    EditOccupationDetails(),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/edit.png",
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        await ApiFunctions()
                                                            .deleteApplicantDetails(
                                                                "occupation");
                                                        setState(() {
                                                          applicantOccupation =
                                                              false;
                                                        });
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/delete.png",
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
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
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            1,
                                                        child:
                                                            OccupationDetailsWidget(
                                                          heading:
                                                              "Applicant 2",
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 16,
                                                      color: Color(0x0D000000),
                                                      offset: Offset(0, 4),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color(0x80979797),
                                                    width: 0.25,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Applicant 2',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Segoe UI',
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
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '${name ?? ""} - ${occupation ?? ""}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Segoe UI',
                                                                        color: Color(
                                                                            0xFF979797),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: 30,
                                                        height: 30,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/Untitled-3.png',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                          .currentFormPageNumber =
                                                      FFAppState()
                                                              .currentFormPageNumber +
                                                          -1);
                                                  await pageViewController
                                                      ?.previousPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() => FFAppState()
                                                        .currentFormPageNumber = 5);
                                                    await pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 42,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                            ],
                          ),
                          //
                          //
                          //
                          //
                          // DEPENDENT DETAILS
                          DependentDetails(pageController: pageViewController),

                          // Column(
                          //   mainAxisSize: MainAxisSize.max,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsetsDirectional.fromSTEB(
                          //           20, 20, 0, 20),
                          //       child: Row(
                          //         mainAxisSize: MainAxisSize.max,
                          //         children: [
                          //           Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 0, 0, 10, 0),
                          //             child: Image.asset(
                          //               'assets/images/Untitled-8.png',
                          //               width: 49,
                          //               height: 50,
                          //               fit: BoxFit.cover,
                          //             ),
                          //           ),
                          //           Text(
                          //             'Add your dependent details below',
                          //             style: FlutterFlowTheme.of(context)
                          //                 .bodyText1
                          //                 .override(
                          //                   fontFamily: 'Segoe UI',
                          //                   color: Color(0xFF979797),
                          //                   fontWeight: FontWeight.normal,
                          //                   useGoogleFonts: false,
                          //                 ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Padding(
                          //           padding: EdgeInsetsDirectional.fromSTEB(
                          //               0, 20, 0, 0),
                          //           child: Container(
                          //             width: 42,
                          //             height: 70,
                          //             decoration: BoxDecoration(
                          //               color: Color(0xFFEEF7FE),
                          //               borderRadius: BorderRadius.only(
                          //                 bottomLeft: Radius.circular(10),
                          //                 bottomRight: Radius.circular(0),
                          //                 topLeft: Radius.circular(10),
                          //                 topRight: Radius.circular(0),
                          //               ),
                          //             ),
                          //             child: Align(
                          //               alignment: AlignmentDirectional(0, 0),
                          //               child: Text(
                          //                 '1',
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsetsDirectional.fromSTEB(
                          //               0, 20, 0, 0),
                          //           child: Container(
                          //             height: 70,
                          //             decoration: BoxDecoration(
                          //               color: FlutterFlowTheme.of(context)
                          //                   .secondaryBackground,
                          //               border: Border.all(
                          //                 color: Color(0xFF979797),
                          //                 width: 0.25,
                          //               ),
                          //             ),
                          //             child: FlutterFlowDropDown(
                          //               options: [
                          //                 'Husband',
                          //                 'Wife',
                          //                 'Child',
                          //                 'Father',
                          //                 'Mother'
                          //               ],
                          //               onChanged: (val) => setState(
                          //                   () => dropDownValue1 = val),
                          //               width: 180,
                          //               height: 50,
                          //               textStyle: FlutterFlowTheme.of(context)
                          //                   .bodyText1
                          //                   .override(
                          //                     fontFamily: 'Segoe UI',
                          //                     color: Color(0xFF263238),
                          //                     fontSize: 16,
                          //                     fontWeight: FontWeight.normal,
                          //                     useGoogleFonts: false,
                          //                   ),
                          //               hintText: 'Select Relationship',
                          //               icon: Icon(
                          //                 Icons.keyboard_arrow_down,
                          //                 color: Color(0xFF4B65B2),
                          //                 size: 20,
                          //               ),
                          //               fillColor: Colors.white,
                          //               elevation: 2,
                          //               borderColor: Colors.transparent,
                          //               borderWidth: 0,
                          //               borderRadius: 0,
                          //               margin: EdgeInsetsDirectional.fromSTEB(
                          //                   12, 4, 12, 4),
                          //               hidesUnderline: true,
                          //             ),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsetsDirectional.fromSTEB(
                          //               0, 20, 0, 0),
                          //           child: Container(
                          //             width: 100,
                          //             height: 70,
                          //             decoration: BoxDecoration(
                          //               color: FlutterFlowTheme.of(context)
                          //                   .secondaryBackground,
                          //               borderRadius: BorderRadius.only(
                          //                 bottomLeft: Radius.circular(0),
                          //                 bottomRight: Radius.circular(10),
                          //                 topLeft: Radius.circular(0),
                          //                 topRight: Radius.circular(10),
                          //               ),
                          //               border: Border.all(
                          //                 color: Color(0xFF979797),
                          //                 width: 0.25,
                          //               ),
                          //             ),
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.max,
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               children: [
                          //                 Expanded(
                          //                   child: Container(
                          //                     decoration: BoxDecoration(
                          //                       color:
                          //                           FlutterFlowTheme.of(context)
                          //                               .secondaryBackground,
                          //                     ),
                          //                     child: Padding(
                          //                       padding: EdgeInsetsDirectional
                          //                           .fromSTEB(10, 0, 0, 0),
                          //                       child: TextFormField(
                          //                         controller: textController1,
                          //                         autofocus: true,
                          //                         obscureText: false,
                          //                         decoration: InputDecoration(
                          //                           hintText: 'Enter',
                          //                           enabledBorder:
                          //                               UnderlineInputBorder(
                          //                             borderSide: BorderSide(
                          //                               color:
                          //                                   Color(0x00000000),
                          //                               width: 1,
                          //                             ),
                          //                             borderRadius:
                          //                                 const BorderRadius
                          //                                     .only(
                          //                               topLeft:
                          //                                   Radius.circular(
                          //                                       4.0),
                          //                               topRight:
                          //                                   Radius.circular(
                          //                                       4.0),
                          //                             ),
                          //                           ),
                          //                           focusedBorder:
                          //                               UnderlineInputBorder(
                          //                             borderSide: BorderSide(
                          //                               color:
                          //                                   Color(0x00000000),
                          //                               width: 1,
                          //                             ),
                          //                             borderRadius:
                          //                                 const BorderRadius
                          //                                     .only(
                          //                               topLeft:
                          //                                   Radius.circular(
                          //                                       4.0),
                          //                               topRight:
                          //                                   Radius.circular(
                          //                                       4.0),
                          //                             ),
                          //                           ),
                          //                         ),
                          //                         style: FlutterFlowTheme.of(
                          //                                 context)
                          //                             .bodyText1
                          //                             .override(
                          //                               fontFamily: 'Segoe UI',
                          //                               color:
                          //                                   Color(0xFF263238),
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                                   FontWeight.normal,
                          //                               useGoogleFonts: false,
                          //                             ),
                          //                         keyboardType:
                          //                             TextInputType.number,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Expanded(
                          //       child: ListView.builder(
                          //         itemBuilder: (_, index) {
                          //           return Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         0, 20, 0, 0),
                          //                 child: Container(
                          //                   width: 42,
                          //                   height: 70,
                          //                   decoration: BoxDecoration(
                          //                     color: Color(0xFFEEF7FE),
                          //                     borderRadius: BorderRadius.only(
                          //                       bottomLeft: Radius.circular(10),
                          //                       bottomRight: Radius.circular(0),
                          //                       topLeft: Radius.circular(10),
                          //                       topRight: Radius.circular(0),
                          //                     ),
                          //                   ),
                          //                   child: Align(
                          //                     alignment:
                          //                         AlignmentDirectional(0, 0),
                          //                     child: Text(
                          //                       '1',
                          //                       style:
                          //                           FlutterFlowTheme.of(context)
                          //                               .bodyText1,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         0, 20, 0, 0),
                          //                 child: Container(
                          //                   height: 70,
                          //                   decoration: BoxDecoration(
                          //                     color:
                          //                         FlutterFlowTheme.of(context)
                          //                             .secondaryBackground,
                          //                     border: Border.all(
                          //                       color: Color(0xFF979797),
                          //                       width: 0.25,
                          //                     ),
                          //                   ),
                          //                   child: FlutterFlowDropDown(
                          //                     options: [
                          //                       'Husband',
                          //                       'Wife',
                          //                       'Child',
                          //                       'Father',
                          //                       'Mother'
                          //                     ],
                          //                     onChanged: (val) => setState(
                          //                         () => dropDownValue1 = val),
                          //                     width: 180,
                          //                     height: 50,
                          //                     textStyle:
                          //                         FlutterFlowTheme.of(context)
                          //                             .bodyText1
                          //                             .override(
                          //                               fontFamily: 'Segoe UI',
                          //                               color:
                          //                                   Color(0xFF263238),
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                                   FontWeight.normal,
                          //                               useGoogleFonts: false,
                          //                             ),
                          //                     hintText: 'Select Relationship',
                          //                     icon: Icon(
                          //                       Icons.keyboard_arrow_down,
                          //                       color: Color(0xFF4B65B2),
                          //                       size: 20,
                          //                     ),
                          //                     fillColor: Colors.white,
                          //                     elevation: 2,
                          //                     borderColor: Colors.transparent,
                          //                     borderWidth: 0,
                          //                     borderRadius: 0,
                          //                     margin: EdgeInsetsDirectional
                          //                         .fromSTEB(12, 4, 12, 4),
                          //                     hidesUnderline: true,
                          //                   ),
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         0, 20, 0, 0),
                          //                 child: Container(
                          //                   width: 100,
                          //                   height: 70,
                          //                   decoration: BoxDecoration(
                          //                     color:
                          //                         FlutterFlowTheme.of(context)
                          //                             .secondaryBackground,
                          //                     borderRadius: BorderRadius.only(
                          //                       bottomLeft: Radius.circular(0),
                          //                       bottomRight:
                          //                           Radius.circular(10),
                          //                       topLeft: Radius.circular(0),
                          //                       topRight: Radius.circular(10),
                          //                     ),
                          //                     border: Border.all(
                          //                       color: Color(0xFF979797),
                          //                       width: 0.25,
                          //                     ),
                          //                   ),
                          //                   child: Row(
                          //                     mainAxisSize: MainAxisSize.max,
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.center,
                          //                     children: [
                          //                       Expanded(
                          //                         child: Container(
                          //                           decoration: BoxDecoration(
                          //                             color: FlutterFlowTheme
                          //                                     .of(context)
                          //                                 .secondaryBackground,
                          //                           ),
                          //                           child: Padding(
                          //                             padding:
                          //                                 EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                         10, 0, 0, 0),
                          //                             child: TextFormField(
                          //                               controller:
                          //                                   textController1,
                          //                               autofocus: true,
                          //                               obscureText: false,
                          //                               decoration:
                          //                                   InputDecoration(
                          //                                 hintText: 'Enter',
                          //                                 enabledBorder:
                          //                                     UnderlineInputBorder(
                          //                                   borderSide:
                          //                                       BorderSide(
                          //                                     color: Color(
                          //                                         0x00000000),
                          //                                     width: 1,
                          //                                   ),
                          //                                   borderRadius:
                          //                                       const BorderRadius
                          //                                           .only(
                          //                                     topLeft: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                     topRight: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                   ),
                          //                                 ),
                          //                                 focusedBorder:
                          //                                     UnderlineInputBorder(
                          //                                   borderSide:
                          //                                       BorderSide(
                          //                                     color: Color(
                          //                                         0x00000000),
                          //                                     width: 1,
                          //                                   ),
                          //                                   borderRadius:
                          //                                       const BorderRadius
                          //                                           .only(
                          //                                     topLeft: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                     topRight: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                               style:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .bodyText1
                          //                                       .override(
                          //                                         fontFamily:
                          //                                             'Segoe UI',
                          //                                         color: Color(
                          //                                             0xFF263238),
                          //                                         fontSize: 16,
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .normal,
                          //                                         useGoogleFonts:
                          //                                             false,
                          //                                       ),
                          //                               keyboardType:
                          //                                   TextInputType
                          //                                       .number,
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           );
                          //         },
                          //       ),
                          //     ),
                          //     Row(
                          //       mainAxisSize: MainAxisSize.max,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Column(
                          //           mainAxisSize: MainAxisSize.max,
                          //           children: [
                          //             Text(
                          //               'S.No',
                          //               style: FlutterFlowTheme.of(context)
                          //                   .bodyText1,
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   0, 20, 0, 0),
                          //               child: Container(
                          //                 width: 42,
                          //                 height: 70,
                          //                 decoration: BoxDecoration(
                          //                   color: Color(0xFFEEF7FE),
                          //                   borderRadius: BorderRadius.only(
                          //                     bottomLeft: Radius.circular(10),
                          //                     bottomRight: Radius.circular(0),
                          //                     topLeft: Radius.circular(10),
                          //                     topRight: Radius.circular(0),
                          //                   ),
                          //                 ),
                          //                 child: Align(
                          //                   alignment:
                          //                       AlignmentDirectional(0, 0),
                          //                   child: Text(
                          //                     '1',
                          //                     style:
                          //                         FlutterFlowTheme.of(context)
                          //                             .bodyText1,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             Visibility(
                          //               visible: add,
                          //               child: Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         0, 20, 0, 0),
                          //                 child: Container(
                          //                   width: 42,
                          //                   height: 70,
                          //                   decoration: BoxDecoration(
                          //                     color: Color(0xFFEEF7FE),
                          //                     borderRadius: BorderRadius.only(
                          //                       bottomLeft: Radius.circular(10),
                          //                       bottomRight: Radius.circular(0),
                          //                       topLeft: Radius.circular(10),
                          //                       topRight: Radius.circular(0),
                          //                     ),
                          //                   ),
                          //                   child: Align(
                          //                     alignment:
                          //                         AlignmentDirectional(0, 0),
                          //                     child: Text(
                          //                       '2',
                          //                       style:
                          //                           FlutterFlowTheme.of(context)
                          //                               .bodyText1,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         Column(
                          //           mainAxisSize: MainAxisSize.max,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   10, 0, 0, 0),
                          //               child: Text(
                          //                 'Relationship',
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1,
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   0, 20, 0, 0),
                          //               child: Container(
                          //                 height: 70,
                          //                 decoration: BoxDecoration(
                          //                   color: FlutterFlowTheme.of(context)
                          //                       .secondaryBackground,
                          //                   border: Border.all(
                          //                     color: Color(0xFF979797),
                          //                     width: 0.25,
                          //                   ),
                          //                 ),
                          //                 child: FlutterFlowDropDown(
                          //                   options: [
                          //                     'Husband',
                          //                     'Wife',
                          //                     'Child',
                          //                     'Father',
                          //                     'Mother'
                          //                   ],
                          //                   onChanged: (val) => setState(
                          //                       () => dropDownValue1 = val),
                          //                   width: 180,
                          //                   height: 50,
                          //                   textStyle:
                          //                       FlutterFlowTheme.of(context)
                          //                           .bodyText1
                          //                           .override(
                          //                             fontFamily: 'Segoe UI',
                          //                             color: Color(0xFF263238),
                          //                             fontSize: 16,
                          //                             fontWeight:
                          //                                 FontWeight.normal,
                          //                             useGoogleFonts: false,
                          //                           ),
                          //                   hintText: 'Select Relationship',
                          //                   icon: Icon(
                          //                     Icons.keyboard_arrow_down,
                          //                     color: Color(0xFF4B65B2),
                          //                     size: 20,
                          //                   ),
                          //                   fillColor: Colors.white,
                          //                   elevation: 2,
                          //                   borderColor: Colors.transparent,
                          //                   borderWidth: 0,
                          //                   borderRadius: 0,
                          //                   margin:
                          //                       EdgeInsetsDirectional.fromSTEB(
                          //                           12, 4, 12, 4),
                          //                   hidesUnderline: true,
                          //                 ),
                          //               ),
                          //             ),
                          //             Visibility(
                          //               visible: add,
                          //               child: Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         0, 20, 0, 0),
                          //                 child: Container(
                          //                   height: 70,
                          //                   decoration: BoxDecoration(
                          //                     color:
                          //                         FlutterFlowTheme.of(context)
                          //                             .secondaryBackground,
                          //                     border: Border.all(
                          //                       color: Color(0xFF979797),
                          //                       width: 0.25,
                          //                     ),
                          //                   ),
                          //                   child: FlutterFlowDropDown(
                          //                     options: [
                          //                       'Husband',
                          //                       'Wife',
                          //                       'Child',
                          //                       'Father',
                          //                       'Mother'
                          //                     ],
                          //                     onChanged: (val) => setState(
                          //                         () => dropDownValue2 = val),
                          //                     width: 180,
                          //                     height: 50,
                          //                     textStyle:
                          //                         FlutterFlowTheme.of(context)
                          //                             .bodyText1
                          //                             .override(
                          //                               fontFamily: 'Segoe UI',
                          //                               fontSize: 16,
                          //                               color:
                          //                                   Color(0xFF263238),
                          //                               fontWeight:
                          //                                   FontWeight.normal,
                          //                               useGoogleFonts: false,
                          //                             ),
                          //                     hintText: 'Select Relationship',
                          //                     icon: Icon(
                          //                       Icons.keyboard_arrow_down,
                          //                       color: Color(0xFF4B65B2),
                          //                       size: 20,
                          //                     ),
                          //                     fillColor: Colors.white,
                          //                     elevation: 2,
                          //                     borderColor: Colors.transparent,
                          //                     borderWidth: 0,
                          //                     borderRadius: 0,
                          //                     margin: EdgeInsetsDirectional
                          //                         .fromSTEB(12, 4, 12, 4),
                          //                     hidesUnderline: true,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         Column(
                          //           mainAxisSize: MainAxisSize.max,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   10, 0, 0, 0),
                          //               child: Text(
                          //                 'Age',
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1,
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   0, 20, 0, 0),
                          //               child: Container(
                          //                 width: 100,
                          //                 height: 70,
                          //                 decoration: BoxDecoration(
                          //                   color: FlutterFlowTheme.of(context)
                          //                       .secondaryBackground,
                          //                   borderRadius: BorderRadius.only(
                          //                     bottomLeft: Radius.circular(0),
                          //                     bottomRight: Radius.circular(10),
                          //                     topLeft: Radius.circular(0),
                          //                     topRight: Radius.circular(10),
                          //                   ),
                          //                   border: Border.all(
                          //                     color: Color(0xFF979797),
                          //                     width: 0.25,
                          //                   ),
                          //                 ),
                          //                 child: Row(
                          //                   mainAxisSize: MainAxisSize.max,
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.center,
                          //                   children: [
                          //                     Expanded(
                          //                       child: Container(
                          //                         decoration: BoxDecoration(
                          //                           color: FlutterFlowTheme.of(
                          //                                   context)
                          //                               .secondaryBackground,
                          //                         ),
                          //                         child: Padding(
                          //                           padding:
                          //                               EdgeInsetsDirectional
                          //                                   .fromSTEB(
                          //                                       10, 0, 0, 0),
                          //                           child: TextFormField(
                          //                             controller:
                          //                                 textController1,
                          //                             autofocus: true,
                          //                             obscureText: false,
                          //                             decoration:
                          //                                 InputDecoration(
                          //                               hintText: 'Enter',
                          //                               enabledBorder:
                          //                                   UnderlineInputBorder(
                          //                                 borderSide:
                          //                                     BorderSide(
                          //                                   color: Color(
                          //                                       0x00000000),
                          //                                   width: 1,
                          //                                 ),
                          //                                 borderRadius:
                          //                                     const BorderRadius
                          //                                         .only(
                          //                                   topLeft:
                          //                                       Radius.circular(
                          //                                           4.0),
                          //                                   topRight:
                          //                                       Radius.circular(
                          //                                           4.0),
                          //                                 ),
                          //                               ),
                          //                               focusedBorder:
                          //                                   UnderlineInputBorder(
                          //                                 borderSide:
                          //                                     BorderSide(
                          //                                   color: Color(
                          //                                       0x00000000),
                          //                                   width: 1,
                          //                                 ),
                          //                                 borderRadius:
                          //                                     const BorderRadius
                          //                                         .only(
                          //                                   topLeft:
                          //                                       Radius.circular(
                          //                                           4.0),
                          //                                   topRight:
                          //                                       Radius.circular(
                          //                                           4.0),
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                             style:
                          //                                 FlutterFlowTheme.of(
                          //                                         context)
                          //                                     .bodyText1
                          //                                     .override(
                          //                                       fontFamily:
                          //                                           'Segoe UI',
                          //                                       color: Color(
                          //                                           0xFF263238),
                          //                                       fontSize: 16,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .normal,
                          //                                       useGoogleFonts:
                          //                                           false,
                          //                                     ),
                          //                             keyboardType:
                          //                                 TextInputType.number,
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     // Padding(
                          //                     //   padding: EdgeInsetsDirectional
                          //                     //       .fromSTEB(0, 0, 10, 0),
                          //                     //   child: Container(
                          //                     //     width: 24,
                          //                     //     height: 24,
                          //                     //     clipBehavior: Clip.antiAlias,
                          //                     //     decoration: BoxDecoration(
                          //                     //       shape: BoxShape.circle,
                          //                     //     ),
                          //                     //     child: Image.asset(
                          //                     //       'assets/images/Untitled-9.png',
                          //                     //     ),
                          //                     //   ),
                          //                     // ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             Visibility(
                          //               visible: add,
                          //               child: Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         0, 20, 0, 0),
                          //                 child: Container(
                          //                   width: 100,
                          //                   height: 70,
                          //                   decoration: BoxDecoration(
                          //                     color:
                          //                         FlutterFlowTheme.of(context)
                          //                             .secondaryBackground,
                          //                     borderRadius: BorderRadius.only(
                          //                       bottomLeft: Radius.circular(0),
                          //                       bottomRight:
                          //                           Radius.circular(10),
                          //                       topLeft: Radius.circular(0),
                          //                       topRight: Radius.circular(10),
                          //                     ),
                          //                     border: Border.all(
                          //                       color: Color(0xFF979797),
                          //                       width: 0.25,
                          //                     ),
                          //                   ),
                          //                   child: Row(
                          //                     mainAxisSize: MainAxisSize.max,
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.center,
                          //                     children: [
                          //                       Expanded(
                          //                         child: Container(
                          //                           decoration: BoxDecoration(
                          //                             color: FlutterFlowTheme
                          //                                     .of(context)
                          //                                 .secondaryBackground,
                          //                           ),
                          //                           child: Padding(
                          //                             padding:
                          //                                 EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                         10, 0, 0, 0),
                          //                             child: TextFormField(
                          //                               controller:
                          //                                   textController2,
                          //                               autofocus: true,
                          //                               obscureText: false,
                          //                               decoration:
                          //                                   InputDecoration(
                          //                                 hintText: 'Enter',
                          //                                 enabledBorder:
                          //                                     UnderlineInputBorder(
                          //                                   borderSide:
                          //                                       BorderSide(
                          //                                     color: Color(
                          //                                         0x00000000),
                          //                                     width: 1,
                          //                                   ),
                          //                                   borderRadius:
                          //                                       const BorderRadius
                          //                                           .only(
                          //                                     topLeft: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                     topRight: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                   ),
                          //                                 ),
                          //                                 focusedBorder:
                          //                                     UnderlineInputBorder(
                          //                                   borderSide:
                          //                                       BorderSide(
                          //                                     color: Color(
                          //                                         0x00000000),
                          //                                     width: 1,
                          //                                   ),
                          //                                   borderRadius:
                          //                                       const BorderRadius
                          //                                           .only(
                          //                                     topLeft: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                     topRight: Radius
                          //                                         .circular(
                          //                                             4.0),
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                               style:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .bodyText1
                          //                                       .override(
                          //                                         fontFamily:
                          //                                             'Segoe UI',
                          //                                         color: Color(
                          //                                             0xFF263238),
                          //                                         fontSize: 16,
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .normal,
                          //                                         useGoogleFonts:
                          //                                             false,
                          //                                       ),
                          //                               keyboardType:
                          //                                   TextInputType
                          //                                       .number,
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                       // Padding(
                          //                       //   padding: EdgeInsetsDirectional
                          //                       //       .fromSTEB(0, 0, 10, 0),
                          //                       //   child: Container(
                          //                       //     width: 24,
                          //                       //     height: 24,
                          //                       //     clipBehavior: Clip.antiAlias,
                          //                       //     decoration: BoxDecoration(
                          //                       //       shape: BoxShape.circle,
                          //                       //     ),
                          //                       //     child: Image.asset(
                          //                       //       'assets/images/Untitled-9.png',
                          //                       //     ),
                          //                       //   ),
                          //                       // ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     const SizedBox(
                          //       height: 15,
                          //     ),
                          //     Visibility(
                          //       visible: !add,
                          //       child: InkWell(
                          //         onTap: () {
                          //           setState(() {
                          //             add = true;
                          //           });
                          //         },
                          //         child: Row(
                          //           // crossAxisAlignment: CrossAxisAlignment.end,
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             Text(
                          //               "Add",
                          //               style: FlutterFlowTheme.of(context)
                          //                   .bodyText1
                          //                   .override(
                          //                     fontFamily: 'Segoe UI',
                          //                     color: Color(0xFF37474F),
                          //                     fontWeight: FontWeight.normal,
                          //                     useGoogleFonts: false,
                          //                   ),
                          //             ),
                          //             const SizedBox(
                          //               width: 8,
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   0, 0, 30, 0),
                          //               child: Container(
                          //                 width: 18,
                          //                 height: 18,
                          //                 clipBehavior: Clip.antiAlias,
                          //                 decoration: BoxDecoration(
                          //                   shape: BoxShape.circle,
                          //                 ),
                          //                 child: Image.asset(
                          //                   'assets/images/Untitled-9.png',
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Column(
                          //         mainAxisSize: MainAxisSize.max,
                          //         mainAxisAlignment: MainAxisAlignment.end,
                          //         children: [
                          //           Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 15, 15, 15, 30),
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.max,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Container(
                          //                   width: 111,
                          //                   height: 26,
                          //                   decoration: BoxDecoration(
                          //                     color:
                          //                         FlutterFlowTheme.of(context)
                          //                             .secondaryBackground,
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
                          //                           duration: Duration(
                          //                               milliseconds: 300),
                          //                           curve: Curves.ease,
                          //                         );
                          //                       },
                          //                       child: Container(
                          //                         width: 32,
                          //                         height: 32,
                          //                         decoration: BoxDecoration(
                          //                           color: FlutterFlowTheme.of(
                          //                                   context)
                          //                               .secondaryBackground,
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
                          //                       padding: EdgeInsetsDirectional
                          //                           .fromSTEB(15, 0, 0, 0),
                          //                       child: InkWell(
                          //                         onTap: () async {
                          //                           // setState(() => FFAppState()
                          //                           //     .currentFormPageNumber = 6);
                          //                           // await pageViewController
                          //                           //     ?.nextPage(
                          //                           //   duration: Duration(
                          //                           //       milliseconds: 300),
                          //                           //   curve: Curves.ease,
                          //                           // );
                          //                           await addApplicantDependentDetails();
                          //                         },
                          //                         child: Container(
                          //                           width: 42,
                          //                           height: 42,
                          //                           decoration: BoxDecoration(
                          //                             color: FlutterFlowTheme
                          //                                     .of(context)
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
                          //   ],
                          // ),
                          //
                          //
                          //
                          //
                          // OUTSTANDING DETAILS
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Image.asset(
                                        'assets/images/Untitled-10.png',
                                        width: 49,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Add your outstanding details',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Segoe UI',
                                            color: Color(0xFF979797),
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 16,
                                      color: Color(0x0D000000),
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0x80979797),
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Applicant 1 Outstandings',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Segoe UI',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Text(
                                                      name ?? "Name",
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                color: Color(
                                                                    0xFF979797),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () async {
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
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                          child:
                                                              OutstandingDetailsWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  clipBehavior: Clip.antiAlias,
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
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      FFAppState().creditCardList.length != 0
                                          ? Container(
                                              height: FFAppState()
                                                      .creditCardList
                                                      .length *
                                                  50,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: FFAppState()
                                                    .creditCardList
                                                    .length,
                                                itemBuilder: (_, index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Credit Card',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
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
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFAppState().creditCardList[
                                                                      index][
                                                                  "creditCardProvider"],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xFF979797),
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFAppState().creditCardList[
                                                                    index][
                                                                "currentBalance"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Image.asset(
                                                              "assets/images/edit.png",
                                                              height: 18,
                                                              width: 18,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .creditCardList
                                                                  .removeAt(
                                                                      index);
                                                              await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              Reload()));
                                                            },
                                                            child: Image.asset(
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
                                                    ],
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(),
                                      FFAppState().personalLoanList.length != 0
                                          ? Container(
                                              height: FFAppState()
                                                      .personalLoanList
                                                      .length *
                                                  50,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: FFAppState()
                                                    .personalLoanList
                                                    .length,
                                                itemBuilder: (_, index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Personal Loan',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
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
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFAppState().personalLoanList[
                                                                      index][
                                                                  "personalLoanProvider"],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xFF979797),
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFAppState().personalLoanList[
                                                                    index][
                                                                "currentBalance"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Image.asset(
                                                            "assets/images/edit.png",
                                                            height: 18,
                                                            width: 18,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .personalLoanList
                                                                  .removeAt(
                                                                      index);
                                                              await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              Reload()));
                                                            },
                                                            child: Image.asset(
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
                                                    ],
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(),
                                      FFAppState().carLoanList.length != 0
                                          ? Container(
                                              height: FFAppState()
                                                      .carLoanList
                                                      .length *
                                                  50,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: FFAppState()
                                                    .carLoanList
                                                    .length,
                                                itemBuilder: (_, index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Car Loan',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
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
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFAppState().carLoanList[
                                                                      index][
                                                                  "carLoanProvider"],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xFF979797),
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFAppState().carLoanList[
                                                                    index][
                                                                "currentBalance"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Image.asset(
                                                            "assets/images/edit.png",
                                                            height: 18,
                                                            width: 18,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .carLoanList
                                                                  .removeAt(
                                                                      index);
                                                              await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              Reload()));
                                                            },
                                                            child: Image.asset(
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
                                                    ],
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(),
                                      FFAppState().storeCardList.length != 0
                                          ? Container(
                                              height: FFAppState()
                                                      .storeCardList
                                                      .length *
                                                  50,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: FFAppState()
                                                    .storeCardList
                                                    .length,
                                                itemBuilder: (_, index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Store Loan',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
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
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFAppState().storeCardList[
                                                                      index][
                                                                  "storeLoanProvider"],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Segoe UI',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xFF979797),
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFAppState().storeCardList[
                                                                    index][
                                                                "currentBalance"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Segoe UI',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Image.asset(
                                                            "assets/images/edit.png",
                                                            height: 18,
                                                            width: 18,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .storeCardList
                                                                  .removeAt(
                                                                      index);
                                                              await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              Reload()));
                                                            },
                                                            child: Image.asset(
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
                                                    ],
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                              if (FFAppState().numberOfApplicants ==
                                  'Joint Applicant')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 16,
                                          color: Color(0x0C000000),
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0x80979797),
                                        width: 0.25,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Applicant 2 Outstandings',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Segoe UI',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Text(
                                                      name ?? "Name",
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                color: Color(
                                                                    0xFF979797),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                      child:
                                                          OutstandingDetailsWidget(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              clipBehavior: Clip.antiAlias,
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
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                          .currentFormPageNumber =
                                                      FFAppState()
                                                              .currentFormPageNumber +
                                                          -1);
                                                  await pageViewController
                                                      ?.previousPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    // setState(() => FFAppState()
                                                    //     .currentFormPageNumber = 6);
                                                    // await pageViewController
                                                    //     ?.nextPage(
                                                    //   duration: Duration(
                                                    //       milliseconds: 300),
                                                    //   curve: Curves.ease,
                                                    // );

                                                    Navigator.pop(context);
                                                    await showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return FinishedWidget();
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 42,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                            ],
                          ),
                        ],
                      ),
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
