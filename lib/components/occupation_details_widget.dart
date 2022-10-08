import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/backend/api.dart';
import 'package:http/http.dart' as http;

import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OccupationDetailsWidget extends StatefulWidget {
  final String? heading;
  const OccupationDetailsWidget({Key? key, this.heading}) : super(key: key);

  @override
  _OccupationDetailsWidgetState createState() =>
      _OccupationDetailsWidgetState();
}

class _OccupationDetailsWidgetState extends State<OccupationDetailsWidget> {
  String? dropDownValue1;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  String? dropDownValue2;
  String? name;
  String? parentalLeave;
  String? ownShares;
  String? kindOfEmp;
  DateTime? date;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    setData();
  }

  Future setData() async {
    final data = await ApiFunctions().getApplicantData();

    print(data["firstname"]);

    setState(() {
      name = '${data["firstname"]} ${data["surname"]}';
    });
  }

  Future addApplicantOccupationDetails() async {
    final id = await ApiFunctions().getApplicantId();
    print(id);

    try {
      var data = {
        "employementStatus": dropDownValue1 ?? "null",
        "jobTitle": textController1?.text,
        "parentalLeave": parentalLeave,
        "ownSharesInOwnCompany": ownShares,
        "kindOfEmployee": kindOfEmp,
        "startDate": textController2?.text,
        "currentSalary": textController3?.text,
        "durationOfPay": dropDownValue2 ?? "null",
      };

      // json.encode()
      // data

      // json.

      var jsonData = jsonEncode(data);
      print(jsonData);

      var response = await http.patch(
        Uri.parse(
            "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/applicant/${id}"),
        body: {
          "occupation": jsonData,
        },
      );

      print(response);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Data succesfully saved",
          backgroundColor: Colors.green,
        );
        if (widget.heading == "Applicant 1") {
          setState(() {
            FFAppState().applicant1occupation = true;
          });
        }
        if (widget.heading == "Applicant 2") {
          setState(() {
            FFAppState().applicant2occupation = true;
          });
        }
        Navigator.pop(context, true);
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
      Navigator.pop(context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: InkWell(
                          onTap: () async {
                            Navigator.pop(context, false);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Text(
                        '${widget.heading} - Occupation Details',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
            child: Text(
              'What’s your employment Status',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: FlutterFlowDropDown(
              options: [
                'Employed',
                'Self-Employed',
                'Contractor',
                'Un-employed',
                'Retired'
              ],
              onChanged: (val) => setState(() => dropDownValue1 = val),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    color: Color(0xFF263238),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
              hintText: 'Select',
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF4B65B2),
                size: 15,
              ),
              fillColor: Colors.white,
              elevation: 0,
              borderColor: Color(0xFF979797),
              borderWidth: 0.25,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
            child: Text(
              'Are you on parental leave right now?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      setState(() {
                        parentalLeave = "yes";
                      });
                    },
                    text: 'Yes',
                    options: FFButtonOptions(
                      width: 157,
                      height: 50,
                      color: parentalLeave == "yes"
                          ? FlutterFlowTheme.of(context).primaryColor
                          : Color(0xFFEEF7FE),
                      textStyle: parentalLeave == "yes"
                          ? FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Segoe UI',
                                color: Colors.white,
                                useGoogleFonts: false,
                              )
                          : FlutterFlowTheme.of(context).subtitle2.override(
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
                  onPressed: () {
                    setState(() {
                      parentalLeave = "no";
                    });
                  },
                  text: 'No',
                  options: FFButtonOptions(
                    width: 157,
                    height: 50,
                    color: parentalLeave == "no"
                        ? FlutterFlowTheme.of(context).primaryColor
                        : Color(0xFFEEF7FE),
                    textStyle: parentalLeave == "no"
                        ? FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              useGoogleFonts: false,
                            )
                        : FlutterFlowTheme.of(context).subtitle2.override(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
            child: Text(
              'Do you own shares in your company?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      setState(() {
                        ownShares = "yes";
                      });
                    },
                    text: 'Yes',
                    options: FFButtonOptions(
                      width: 157,
                      height: 50,
                      color: ownShares == "yes"
                          ? FlutterFlowTheme.of(context).primaryColor
                          : Color(0xFFEEF7FE),
                      textStyle: ownShares == "yes"
                          ? FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Segoe UI',
                                color: Colors.white,
                                useGoogleFonts: false,
                              )
                          : FlutterFlowTheme.of(context).subtitle2.override(
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
                  onPressed: () {
                    setState(() {
                      ownShares = "no";
                    });
                  },
                  text: 'No',
                  options: FFButtonOptions(
                    width: 157,
                    height: 50,
                    color: ownShares == "no"
                        ? FlutterFlowTheme.of(context).primaryColor
                        : Color(0xFFEEF7FE),
                    textStyle: ownShares == "no"
                        ? FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              useGoogleFonts: false,
                            )
                        : FlutterFlowTheme.of(context).subtitle2.override(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
            child: Text(
              'What’s your job title',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF979797),
                  width: 0.25,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: TextFormField(
                  controller: textController1,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Software Engineer',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFFEEF7FE),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
            child: Text(
              'What kind of employee are you are?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      setState(() {
                        kindOfEmp = "permanent";
                      });
                    },
                    text: 'Permanent',
                    options: FFButtonOptions(
                      width: 157,
                      height: 50,
                      color: kindOfEmp == "permanent"
                          ? FlutterFlowTheme.of(context).primaryColor
                          : Color(0xFFEEF7FE),
                      textStyle: kindOfEmp == "permanent"
                          ? FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Segoe UI',
                                color: Colors.white,
                                useGoogleFonts: false,
                              )
                          : FlutterFlowTheme.of(context).subtitle2.override(
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
                  onPressed: () {
                    setState(() {
                      kindOfEmp = "temporary";
                    });
                  },
                  text: 'Temporary',
                  options: FFButtonOptions(
                    width: 157,
                    height: 50,
                    color: kindOfEmp == "temporary"
                        ? FlutterFlowTheme.of(context).primaryColor
                        : Color(0xFFEEF7FE),
                    textStyle: kindOfEmp == "temporary"
                        ? FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Segoe UI',
                              color: Colors.white,
                              useGoogleFonts: false,
                            )
                        : FlutterFlowTheme.of(context).subtitle2.override(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
            child: Text(
              'When did you start?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF979797),
                  width: 0.25,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEF7FE),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Untitled-19.png',
                          width: 20,
                          height: 22,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: TextFormField(
                        controller: textController2,
                        autofocus: true,
                        obscureText: false,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            lastDate: getCurrentTimestamp,
                            firstDate: DateTime(1950, 01, 01),
                          );

                          if (newDate == null) return;

                          setState(() {
                            date = newDate;
                            // dayText!.text = newDate.day.toString();
                            // monthText!.text =
                            //     newDate.month.toString();
                            // yearText!.text =
                            //     newDate.year.toString();
                            textController2?.text =
                                '${date!.day.toString()}/${date!.month.toString()}/${date!.year.toString()}';
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'DD/MM/YYYY',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Segoe UI',
                                    color: Color(0xFF979797),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              // color: Color(0xFF979797),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
            child: Text(
              'What’s your current salary?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 36,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF7FE),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.asset(
                      'assets/images/Untitled-20.png',
                      width: 21,
                      height: 21,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(10),
                    ),
                    border: Border.all(
                      color: Color(0xFF979797),
                      width: 0.25,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      controller: textController3,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Salary',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Segoe UI',
                                  color: Color(0xFF979797),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
            child: Text(
              'How often do you get paid?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: FlutterFlowDropDown(
              options: ['Daily', 'Weekly', 'Fortnightly', 'Monthly'],
              onChanged: (val) => setState(() => dropDownValue2 = val),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    color: Color(0xFF263238),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
              hintText: 'Please Select',
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF4B65B2),
                size: 15,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFF979797),
              borderWidth: 0.25,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 30),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            useGoogleFonts: false,
                          ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    if (textController1?.text != "" &&
                        textController2?.text != "" &&
                        textController3?.text != "" &&
                        dropDownValue1 != null &&
                        dropDownValue2 != null) {
                      ApiFunctions().setOccupation(textController1!.text);
                      await addApplicantOccupationDetails();
                    } else {
                      print("alll details not filled");
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: "Please fill all the empty fields");
                    }
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
