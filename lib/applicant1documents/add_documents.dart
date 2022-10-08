import 'package:dotted_line/dotted_line.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/backend/document.dart';
import 'package:freedom/components/british_passport_widget.dart';
import 'package:freedom/components/document_uploaded_successfully.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDocuments extends StatefulWidget {
  const AddDocuments({Key? key}) : super(key: key);

  @override
  _AddDocumentsState createState() => _AddDocumentsState();
}

class _AddDocumentsState extends State<AddDocuments> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String employement = "";
  bool identityDoc = false;
  bool addProof = false;
  bool employ = false;
  bool bankState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Text(
                            'Applicant 1 documents',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Container(
                  width: double.infinity,
                  // height: 138,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      color: Color(0xFF979797).withOpacity(0.5),
                      width: 0.25,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                          child: Text(
                            'Identity document',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF263238),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
                            'British passport',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: DottedLine(
                            dashGapLength: 5,
                            dashColor: Color(0xff263238).withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: FFAppState().identityDoc.isEmpty
                              // !identityDoc
                              ? Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upload Document',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Seoge UI',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final value =
                                            await showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          context: context,
                                          builder: (_) {
                                            return BritishPassportWidget();
                                          },
                                        );

                                        setState(() {
                                          identityDoc = value;
                                        });
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/uploaddoc.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: FFAppState().identityDoc.length * 42,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: FFAppState().identityDoc.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7),
                                        child: Row(
                                          children: [
                                            Text(
                                              FFAppState()
                                                  .identityDoc[index]
                                                  .name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Seoge UI',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Spacer(),
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
                                                    .identityDoc
                                                    .removeAt(index);
                                                if (FFAppState()
                                                        .identityDoc
                                                        .length ==
                                                    0) {
                                                  setState(() {
                                                    identityDoc = false;
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                "assets/images/delete.png",
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            FFAppState().identityDoc.last ==
                                                    FFAppState()
                                                        .identityDoc[index]
                                                ? InkWell(
                                                    onTap: () async {
                                                      final value =
                                                          await showModalBottomSheet(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(18),
                                                        ),
                                                        context: context,
                                                        builder: (_) {
                                                          return BritishPassportWidget();
                                                        },
                                                      );

                                                      setState(() {
                                                        identityDoc = value;
                                                      });
                                                    },
                                                    child: Image.asset(
                                                      "assets/images/Untitled-9.png",
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 24,
                                                    width: 24,
                                                  )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Container(
                  width: double.infinity,
                  // height: 138,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      color: Color(0xFF979797).withOpacity(0.5),
                      width: 0.25,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                          child: Text(
                            'Proof of Address',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
                            'Council tax or utility bill or Bank statement',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: DottedLine(
                            dashGapLength: 5,
                            dashColor: Color(0xff263238).withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: FFAppState().addressProof.isEmpty
                              ? Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upload Document',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Seoge UI',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (result != null) {
                                          // print(file.names);
                                          final name = result.names[0];
                                          setState(() {
                                            FFAppState().addressProof.add(
                                                Document(
                                                    name: name!,
                                                    link: "no link"));
                                            addProof = true;
                                          });
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "No file selected");
                                        }
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/uploaddoc.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: FFAppState().addressProof.length * 40,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: FFAppState().addressProof.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7),
                                        child: Row(
                                          children: [
                                            Text(
                                              FFAppState()
                                                  .addressProof[index]
                                                  .name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Seoge UI',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Spacer(),
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
                                                    .addressProof
                                                    .removeAt(index);
                                                if (FFAppState()
                                                        .addressProof
                                                        .length ==
                                                    0) {
                                                  setState(() {
                                                    addProof = false;
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                "assets/images/delete.png",
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            FFAppState().addressProof.last ==
                                                    FFAppState()
                                                        .addressProof[index]
                                                ? InkWell(
                                                    onTap: () async {
                                                      FilePickerResult? result =
                                                          await FilePicker
                                                              .platform
                                                              .pickFiles();

                                                      if (result != null) {
                                                        // print(file.names);
                                                        final name =
                                                            result.names[0];
                                                        setState(() {
                                                          FFAppState()
                                                              .addressProof
                                                              .add(Document(
                                                                  name: name!,
                                                                  link:
                                                                      "no link"));
                                                          addProof = true;
                                                        });
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "No file selected");
                                                      }
                                                    },
                                                    child: Image.asset(
                                                      "assets/images/Untitled-9.png",
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 24,
                                                    width: 24,
                                                  )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Container(
                  width: double.infinity,
                  // height: 185,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      color: Color(0xFF979797).withOpacity(0.5),
                      width: 0.25,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Employment',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    setState(() {
                                      employement = "Employed";
                                    });
                                  },
                                  text: 'Employed',
                                  options: FFButtonOptions(
                                    width: 140,
                                    height: 50,
                                    color: employement == "Employed"
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : Color(0xFFEEF7FE),
                                    textStyle: employement == "Employed"
                                        ? FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Seoge UI',
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
                                onPressed: () {
                                  setState(() {
                                    employement = "Self Employed";
                                  });
                                },
                                text: "Self Employed",
                                options: FFButtonOptions(
                                  width: 158,
                                  height: 50,
                                  color: employement == "Self Employed"
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : Color(0xFFEEF7FE),
                                  textStyle: employement == "Self Employed"
                                      ? FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Seoge UI',
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
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: DottedLine(
                            dashGapLength: 5,
                            dashColor: Color(0xff263238).withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: FFAppState().employmentSlip.isEmpty
                              ? Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upload Document',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Seoge UI',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (result != null) {
                                          // print(file.names);
                                          final name = result.names[0];
                                          setState(() {
                                            FFAppState().employmentSlip.add(
                                                Document(
                                                    name: name!,
                                                    link: "no link"));
                                            employ = true;
                                          });
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "No file selected");
                                        }
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/uploaddoc.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height:
                                      FFAppState().employmentSlip.length * 40,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        FFAppState().employmentSlip.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7),
                                        child: Row(
                                          children: [
                                            Text(
                                              FFAppState()
                                                  .employmentSlip[index]
                                                  .name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Seoge UI',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Spacer(),
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
                                                    .employmentSlip
                                                    .removeAt(index);
                                                if (FFAppState()
                                                        .employmentSlip
                                                        .length ==
                                                    0) {
                                                  setState(() {
                                                    employ = false;
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                "assets/images/delete.png",
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            FFAppState().employmentSlip.last ==
                                                    FFAppState()
                                                        .employmentSlip[index]
                                                ? InkWell(
                                                    onTap: () async {
                                                      FilePickerResult? result =
                                                          await FilePicker
                                                              .platform
                                                              .pickFiles();

                                                      if (result != null) {
                                                        // print(file.names);
                                                        final name =
                                                            result.names[0];
                                                        setState(() {
                                                          FFAppState()
                                                              .employmentSlip
                                                              .add(Document(
                                                                  name: name!,
                                                                  link:
                                                                      "no link"));
                                                          employ = true;
                                                        });
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "No file selected");
                                                      }
                                                    },
                                                    child: Image.asset(
                                                      "assets/images/Untitled-9.png",
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 24,
                                                    width: 24,
                                                  )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '3 Months payslip',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Container(
                  width: double.infinity,
                  // height: 138,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      color: Color(0xFF979797).withOpacity(0.5),
                      width: 0.25,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                          child: Text(
                            'Bank Statement',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
                            '3 month bank statement',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF979797),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: DottedLine(
                            dashGapLength: 5,
                            dashColor: Color(0xff263238).withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: FFAppState().bankStatement.isEmpty
                              ? Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upload Document',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Seoge UI',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (result != null) {
                                          // print(file.names);
                                          final name = result.names[0];
                                          setState(() {
                                            FFAppState().bankStatement.add(
                                                Document(
                                                    name: name!,
                                                    link: "no link"));
                                            bankState = true;
                                          });
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "No file selected");
                                        }
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/uploaddoc.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height:
                                      FFAppState().bankStatement.length * 40,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        FFAppState().bankStatement.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7),
                                        child: Row(
                                          children: [
                                            Text(
                                              FFAppState()
                                                  .bankStatement[index]
                                                  .name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Seoge UI',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Spacer(),
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
                                                    .bankStatement
                                                    .removeAt(index);
                                                if (FFAppState()
                                                        .bankStatement
                                                        .length ==
                                                    0) {
                                                  setState(() {
                                                    bankState = false;
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                "assets/images/delete.png",
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            FFAppState().bankStatement.last ==
                                                    FFAppState()
                                                        .bankStatement[index]
                                                ? InkWell(
                                                    onTap: () async {
                                                      FilePickerResult? result =
                                                          await FilePicker
                                                              .platform
                                                              .pickFiles();

                                                      if (result != null) {
                                                        // print(file.names);
                                                        final name =
                                                            result.names[0];
                                                        setState(() {
                                                          FFAppState()
                                                              .bankStatement
                                                              .add(Document(
                                                                  name: name!,
                                                                  link:
                                                                      "no link"));
                                                          bankState = true;
                                                        });
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "No file selected");
                                                      }
                                                    },
                                                    child: Image.asset(
                                                      "assets/images/Untitled-9.png",
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 24,
                                                    width: 24,
                                                  )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Seoge UI',
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        // setState(() {});
                        await showDialog(
                            context: context,
                            builder: (_) {
                              return DocumentUploadedSuccessfully();
                            });
                        Navigator.pop(context,
                            [identityDoc, addProof, employ, bankState]);
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
      ),
    );
  }
}
