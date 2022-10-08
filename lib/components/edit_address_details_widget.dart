import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/backend/api.dart';
import 'package:freedom/components/successfully_widget.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAddressDetails extends StatefulWidget {
  EditAddressDetails({Key? key}) : super(key: key);

  @override
  State<EditAddressDetails> createState() => _EditAddressDetailsState();
}

class _EditAddressDetailsState extends State<EditAddressDetails> {
  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  TextEditingController? houseNameNumber;
  DateTime? date;

  @override
  void initState() {
    super.initState();
    // textController1 = TextEditingController();
    // textController2 = TextEditingController();
    // textController3 = TextEditingController();
    // textController4 = TextEditingController();
    // textController5 = TextEditingController();
    // textController6 = TextEditingController();
    // textController7 = TextEditingController();
    fillDetails();
  }

  Future fillDetails() async {
    final data = await ApiFunctions().getApplicantData();
    print(data);
    final currentAdd = jsonDecode(data["currentaddress"]);

    print(currentAdd["postalCode"]);
    print(currentAdd["buildingName"]);

    // print(data["currentaddress"]);

    setState(() {
      textController1 = TextEditingController(text: currentAdd["postalCode"]);
      textController2 = TextEditingController(text: currentAdd["flatNumber"]);

      textController3 = TextEditingController(text: currentAdd["buildingName"]);
      textController4 = TextEditingController(text: currentAdd["street"]);
      textController5 = TextEditingController(text: currentAdd["city"]);
      textController6 = TextEditingController(text: currentAdd["postalCode"]);
      textController7 =
          TextEditingController(text: currentAdd["startLivingDate"]);

      dropDownValue = currentAdd["typeOfOccupant"];
      // dropDownValue = currentAdd["typeOfOccupant"];
    });
  }

  Future addApplicantAddress() async {
    final id = await ApiFunctions().getApplicantId();
    print(id);

    try {
      Map<String, String> data = {
        // "typeOfAddress": FFAppState().typeOfAddress,
        "postalCode": textController1!.text,
        "flatNumber": textController2!.text,
        "buildingName": textController3!.text,
        "street": textController4!.text,
        "city": textController5!.text,
        "startLivingDate": textController7!.text,
        "typeOfOccupant": dropDownValue ?? "null"
      };

      // final stringData = data.toString();
      // print(stringData);

      final jsonData = json.encode(data);

      var response = await http.patch(
        Uri.parse(
            "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/applicant/${id}"),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: {
          "currentaddress": jsonData,
        },
      );

      // json.encode({
      //       "typeOfAddress": FFAppState().typeOfAddress,
      //       "postalCode": textController1?.text,
      //       "flatNumber": textController2?.text,
      //       "buildingName": textController3?.text,
      //       "street": textController4?.text,
      //       "city": textController5?.text,
      //       "startLivingDate": textController7?.text,
      //       "typeOfOccupant": dropDownValue ?? "null"
      //     }),

      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Data succesfully saved",
          backgroundColor: Colors.green,
        );
        Navigator.pop(context, true);
        await showDialog(
            context: context, builder: (_) => SuccessfullyWidget());
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
                            size: 25,
                          ),
                        ),
                      ),
                      Text(
                        'Update Address',
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
          Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.87,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                  child: Text(
                    'Select the Type of address',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                if (FFAppState().typeOfAddress == 'Current')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Container(
                              width: 130,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF4B65B2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Current',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Segoe UI',
                                        color: Colors.white,
                                        fontSize: 16,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {},
                              child: Container(
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEF7FE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Previous',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Segoe UI',
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
                // if (FFAppState().typeOfAddress == 'Previous')
                //   Padding(
                //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //           child: Padding(
                //             padding:
                //                 EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                //             child: InkWell(
                //               onTap: () async {
                //                 setState(() =>
                //                     FFAppState().typeOfAddress = 'Current');
                //               },
                //               child: Container(
                //                 width: 130,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   color: Color(0xFFEEF7FE),
                //                   borderRadius: BorderRadius.circular(10),
                //                 ),
                //                 child: Align(
                //                   alignment: AlignmentDirectional(0, 0),
                //                   child: Text(
                //                     'Current',
                //                     style: FlutterFlowTheme.of(context)
                //                         .bodyText1
                //                         .override(
                //                           fontFamily: 'Segoe UI',
                //                           color: FlutterFlowTheme.of(context)
                //                               .primaryText,
                //                           fontSize: 16,
                //                           useGoogleFonts: false,
                //                         ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           child: Padding(
                //             padding:
                //                 EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                //             child: Container(
                //               width: 130,
                //               height: 50,
                //               decoration: BoxDecoration(
                //                 color: Color(0xFF4B65B2),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Align(
                //                 alignment: AlignmentDirectional(0, 0),
                //                 child: Text(
                //                   'Previous',
                //                   style: FlutterFlowTheme.of(context)
                //                       .bodyText1
                //                       .override(
                //                         fontFamily: 'Segoe UI',
                //                         color: FlutterFlowTheme.of(context)
                //                             .primaryBackground,
                //                         fontSize: 16,
                //                         useGoogleFonts: false,
                //                       ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'Your address',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF7FE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: textController1,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController1',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter postcode',
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 20,
                            ),
                            // suffixIcon: textController1?.text.isNotEmpty
                            //     ? InkWell(
                            //         onTap: () async {
                            //           textController1?.clear();
                            //           setState(() {});
                            //         },
                            //         child: Icon(
                            //           Icons.clear,
                            //           color: Color(0xFF757575),
                            //           size: 22,
                            //         ),
                            //       )
                            //     : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: houseNameNumber,
                          onChanged: (_) => EasyDebounce.debounce(
                            'houseNameNumber',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter House name/number',
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 20,
                            ),
                            suffixIcon: houseNameNumber!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      textController1?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Container(
                                width: 157,
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
                                    'Search Postcode',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Segoe UI',
                                          color: Colors.white,
                                          fontSize: 16,
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
                                  'Enter Manually',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Segoe UI',
                                        color: Colors.white,
                                        fontSize: 16,
                                        useGoogleFonts: false,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'Flat or apartment number',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: textController2,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '-',
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEBEBEB),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'Housing or building name',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: textController3,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '-',
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEBEBEB),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'Street',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: textController4,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '-',
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEBEBEB),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'City',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: textController5,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '-',
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEBEBEB),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'Postcode',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: textController6,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '-',
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEBEBEB),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'When did you start living at this address?',
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: TextFormField(
                              controller: textController7,
                              readOnly: true,
                              obscureText: false,
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
                                  textController7?.text =
                                      '${date!.day.toString()}/${date!.month.toString()}/${date!.year.toString()}';
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'DD/MM/YYYY',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Text(
                    'What type of occupant are you?',
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
                      'Home Owner',
                      'Currently Renting',
                      'Living with parents/ partner/ family'
                    ],
                    onChanged: (val) => setState(() => dropDownValue = val),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          color: Color(0xFF979797),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                    hintText: dropDownValue,
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
                              textController4?.text != "" &&
                              textController5?.text != "" &&
                              textController6?.text != "" &&
                              textController7?.text != "" &&
                              dropDownValue != null) {
                            await addApplicantAddress();
                          } else {
                            print("alll details not filled");
                            Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: "Please fill all the empty fields");
                          }
                          // await showDialog(
                          //     context: context,
                          //     builder: (_) => CurrentAddressWidget());
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
          ),
        ],
      ),
    );
  }
}
