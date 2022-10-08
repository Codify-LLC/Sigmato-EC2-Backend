import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/components/dependent_widget.dart';
import 'package:freedom/dependent_details/dependent_details_widget.dart';
import 'package:freedom/flutter_flow/flutter_flow_drop_down.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;

import '../app_state.dart';
import '../backend/api.dart';

class DependentDetails extends StatefulWidget {
  final PageController? pageController;
  DependentDetails({Key? key, required this.pageController}) : super(key: key);

  @override
  State<DependentDetails> createState() => _DependentDetailsState();
}

class _DependentDetailsState extends State<DependentDetails> {
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;

  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;

  bool add = false;
  bool add2 = false;

  List<DependentWidget> dynamicList = [
    DependentWidget(),
  ];

  List<Object> data = [{}];

  List<String> relationship = [];
  List<String> age = [];

  // addDynamic() {
  //   if (relationship.length != 0) {
  //     floatingIcon = new Icon(Icons.add);

  //     Product = [];
  //     Price = [];
  //     dynamicList = [];
  //   }
  //   setState(() {});
  //   if (dynamicList.length >= 10) {
  //     return;
  //   }
  //   dynamicList.add(new DependentWidget());
  // }
  addDynamic() {
    dynamicList.add(new DependentWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: Image.asset(
                  'assets/images/Untitled-8.png',
                  width: 49,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Add your dependent details below',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Segoe UI',
                      color: Color(0xFF979797),
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Padding(
        //       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //       child: Container(
        //         width: 42,
        //         height: 70,
        //         decoration: BoxDecoration(
        //           color: Color(0xFFEEF7FE),
        //           borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(10),
        //             bottomRight: Radius.circular(0),
        //             topLeft: Radius.circular(10),
        //             topRight: Radius.circular(0),
        //           ),
        //         ),
        //         child: Align(
        //           alignment: AlignmentDirectional(0, 0),
        //           child: Text(
        //             '1',
        //             style: FlutterFlowTheme.of(context).bodyText1,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //       child: Container(
        //         height: 70,
        //         decoration: BoxDecoration(
        //           color: FlutterFlowTheme.of(context).secondaryBackground,
        //           border: Border.all(
        //             color: Color(0xFF979797),
        //             width: 0.25,
        //           ),
        //         ),
        //         child: FlutterFlowDropDown(
        //           options: ['Husband', 'Wife', 'Child', 'Father', 'Mother'],
        //           onChanged: (val) => setState(() => dropDownValue1 = val),
        //           width: 180,
        //           height: 50,
        //           textStyle: FlutterFlowTheme.of(context).bodyText1.override(
        //                 fontFamily: 'Segoe UI',
        //                 color: Color(0xFF263238),
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.normal,
        //                 useGoogleFonts: false,
        //               ),
        //           hintText: 'Select Relationship',
        //           icon: Icon(
        //             Icons.keyboard_arrow_down,
        //             color: Color(0xFF4B65B2),
        //             size: 20,
        //           ),
        //           fillColor: Colors.white,
        //           elevation: 2,
        //           borderColor: Colors.transparent,
        //           borderWidth: 0,
        //           borderRadius: 0,
        //           margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
        //           hidesUnderline: true,
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //       child: Container(
        //         width: 100,
        //         height: 70,
        //         decoration: BoxDecoration(
        //           color: FlutterFlowTheme.of(context).secondaryBackground,
        //           borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(0),
        //             bottomRight: Radius.circular(10),
        //             topLeft: Radius.circular(0),
        //             topRight: Radius.circular(10),
        //           ),
        //           border: Border.all(
        //             color: Color(0xFF979797),
        //             width: 0.25,
        //           ),
        //         ),
        //         child: Row(
        //           mainAxisSize: MainAxisSize.max,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Expanded(
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color:
        //                       FlutterFlowTheme.of(context).secondaryBackground,
        //                 ),
        //                 child: Padding(
        //                   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        //                   child: TextFormField(
        //                     controller: textController1,
        //                     autofocus: true,
        //                     obscureText: false,
        //                     decoration: InputDecoration(
        //                       hintText: 'Enter',
        //                       enabledBorder: UnderlineInputBorder(
        //                         borderSide: BorderSide(
        //                           color: Color(0x00000000),
        //                           width: 1,
        //                         ),
        //                         borderRadius: const BorderRadius.only(
        //                           topLeft: Radius.circular(4.0),
        //                           topRight: Radius.circular(4.0),
        //                         ),
        //                       ),
        //                       focusedBorder: UnderlineInputBorder(
        //                         borderSide: BorderSide(
        //                           color: Color(0x00000000),
        //                           width: 1,
        //                         ),
        //                         borderRadius: const BorderRadius.only(
        //                           topLeft: Radius.circular(4.0),
        //                           topRight: Radius.circular(4.0),
        //                         ),
        //                       ),
        //                     ),
        //                     style:
        //                         FlutterFlowTheme.of(context).bodyText1.override(
        //                               fontFamily: 'Segoe UI',
        //                               color: Color(0xFF263238),
        //                               fontSize: 16,
        //                               fontWeight: FontWeight.normal,
        //                               useGoogleFonts: false,
        //                             ),
        //                     keyboardType: TextInputType.number,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: dynamicList.length,
        //     itemBuilder: (_, index) {
        //       return dynamicList[index];
        //     },
        //   ),
        // ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'S.No',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: 42,
                    height: 70,
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
                      child: Text(
                        '1',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: add,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: 42,
                      height: 70,
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
                        child: Text(
                          '2',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: add2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: 42,
                      height: 70,
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
                        child: Text(
                          '3',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Relationship',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: Color(0xFF979797),
                        width: 0.25,
                      ),
                    ),
                    child: FlutterFlowDropDown(
                      options: ['Husband', 'Wife', 'Child', 'Father', 'Mother'],
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Segoe UI',
                                color: Color(0xFF263238),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                      hintText: 'Select Relationship',
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF4B65B2),
                        size: 20,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                ),
                Visibility(
                  visible: add,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: Color(0xFF979797),
                          width: 0.25,
                        ),
                      ),
                      child: FlutterFlowDropDown(
                        options: [
                          'Husband',
                          'Wife',
                          'Child',
                          'Father',
                          'Mother'
                        ],
                        onChanged: (val) =>
                            setState(() => dropDownValue2 = val),
                        width: 180,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 16,
                                  color: Color(0xFF263238),
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        hintText: 'Select Relationship',
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF4B65B2),
                          size: 20,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: add2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: Color(0xFF979797),
                          width: 0.25,
                        ),
                      ),
                      child: FlutterFlowDropDown(
                        options: [
                          'Husband',
                          'Wife',
                          'Child',
                          'Father',
                          'Mother'
                        ],
                        onChanged: (val) =>
                            setState(() => dropDownValue3 = val),
                        width: 180,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 16,
                                  color: Color(0xFF263238),
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        hintText: 'Select Relationship',
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF4B65B2),
                          size: 20,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Age',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: 100,
                    height: 70,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: TextFormField(
                                controller: textController1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter',
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
                                      color: Color(0xFF263238),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional
                        //       .fromSTEB(0, 0, 10, 0),
                        //   child: Container(
                        //     width: 24,
                        //     height: 24,
                        //     clipBehavior: Clip.antiAlias,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: Image.asset(
                        //       'assets/images/Untitled-9.png',
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: add,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: 100,
                      height: 70,
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: TextFormField(
                                  controller: textController2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter',
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
                                        color: Color(0xFF263238),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: add && !add2,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  add = false;
                                });
                              },
                              child: Image.asset(
                                "assets/images/delete.png",
                                height: 17,
                                width: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional
                          //       .fromSTEB(0, 0, 10, 0),
                          //   child: Container(
                          //     width: 24,
                          //     height: 24,
                          //     clipBehavior: Clip.antiAlias,
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //     ),
                          //     child: Image.asset(
                          //       'assets/images/Untitled-9.png',
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: add2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: 100,
                      height: 70,
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: TextFormField(
                                  controller: textController3,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter',
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
                                        color: Color(0xFF263238),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                add2 = false;
                              });
                            },
                            child: Image.asset(
                              "assets/images/delete.png",
                              height: 17,
                              width: 17,
                            ),
                          ),
                          SizedBox(
                            width: 5,
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
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            if (add == false && add2 == false) {
              setState(() {
                add = true;
              });
            } else if (add == true && add2 == false) {
              setState(() {
                add2 = true;
              });
            }
            // addDynamic();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Add",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Segoe UI',
                      color: Color(0xFF37474F),
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
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
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 111,
                      height: 26,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            setState(() => FFAppState().currentFormPageNumber =
                                FFAppState().currentFormPageNumber + -1);
                            await widget.pageController?.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
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
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              setState(
                                  () => FFAppState().currentFormPageNumber = 6);
                              await widget.pageController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              await addApplicantDependentDetails();
                            },
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
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
    );
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
        await widget.pageController?.nextPage(
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
}

List<Object> data = [];

class DependentWidget extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? data;
  final int? sr;

  const DependentWidget(
      {Key? key, this.textEditingController, this.data, this.sr})
      : super(key: key);
  @override
  State<DependentWidget> createState() => _DependentWidgetState();
}

class _DependentWidgetState extends State<DependentWidget> {
  String? relationship;
  TextEditingController age = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            width: 42,
            height: 70,
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
              child: Text(
                widget.sr.toString(),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              border: Border.all(
                color: Color(0xFF979797),
                width: 0.25,
              ),
            ),
            child: FlutterFlowDropDown(
              options: ['Husband', 'Wife', 'Child', 'Father', 'Mother'],
              onChanged: (val) => setState(() => relationship = val),
              width: 180,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Segoe UI',
                    color: Color(0xFF263238),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: false,
                  ),
              hintText: 'Select Relationship',
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF4B65B2),
                size: 20,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            width: 100,
            height: 70,
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: TextFormField(
                        controller: age,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter',
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
                              color: Color(0xFF263238),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
