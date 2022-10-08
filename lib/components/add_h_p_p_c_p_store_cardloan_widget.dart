import 'package:fluttertoast/fluttertoast.dart';

import '../backend/api.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddHPPCPStoreCardloanWidget extends StatefulWidget {
  const AddHPPCPStoreCardloanWidget({Key? key}) : super(key: key);

  @override
  _AddHPPCPStoreCardloanWidgetState createState() =>
      _AddHPPCPStoreCardloanWidgetState();
}

class _AddHPPCPStoreCardloanWidgetState
    extends State<AddHPPCPStoreCardloanWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  bool repaid = true;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  Future addOutstandingStoreLoanDetails() async {
    final id = await ApiFunctions().getApplicantId();
    print(id);

    try {
      var data = {
        "storeLoan": {
          "storeLoanProvider": textController1?.text,
          "currentBalance": textController2?.text,
          "monthlyRepaymentAmout": textController3?.text,
          "repaid": repaid.toString(),
        }
      };

      var listData = {
        "storeLoanProvider": textController1?.text,
        "currentBalance": textController2?.text,
        "monthlyRepaymentAmout": textController3?.text,
        "repaid": repaid.toString(),
      };

      FFAppState().storeCardList.add(listData);

      final jsonData = jsonEncode(data);

      var response = await http.patch(
        Uri.parse(
            "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/applicant/${id}"),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: {
          "outstandingdetails": jsonData,
        },
      );

      print(response);
      print(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Data succesfully saved",
          backgroundColor: Colors.green,
        );
        Navigator.pop(context, true);
        // await showDialog(
        //     context: context, builder: (_) => SuccessfullyWidget());
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
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 345,
        height: 600,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add HP /PCP/ Store Card loan',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Seoge UI',
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: Text(
                      'Enter store card provider',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  TextFormField(
                    controller: textController1,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '-',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Seoge UI',
                                color: Color(0xFF979797),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF979797),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF979797),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Seoge UI',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                    child: Text(
                      'What’s your current outstanding balance?',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Row(
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
                          child: Container(
                            width: 21,
                            height: 21,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/Untitled-20.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                          child: TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '-',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Seoge UI',
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: Text(
                      'What is the Monthly repayment amount?',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Row(
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
                          child: Container(
                            width: 21,
                            height: 21,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/Untitled-20.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                          child: TextFormField(
                            controller: textController3,
                            autofocus: true,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '-',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Seoge UI',
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                    child: Text(
                      'Will this be repaid before the start of the mortgage?',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Seoge UI',
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            repaid = true;
                          });
                        },
                        text: 'Yes',
                        options: FFButtonOptions(
                          width: 140,
                          height: 50,
                          color: repaid
                              ? FlutterFlowTheme.of(context).primaryColor
                              : Color(0xFFEEF7FE),
                          textStyle: repaid
                              ? FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Seoge UI',
                                    color: Colors.white,
                                    useGoogleFonts: false,
                                  )
                              : FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Seoge UI',
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
                      FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            repaid = false;
                          });
                        },
                        text: 'No',
                        options: FFButtonOptions(
                          width: 140,
                          height: 50,
                          color: repaid
                              ? Color(0xFFEEF7FE)
                              : FlutterFlowTheme.of(context).primaryColor,
                          textStyle: repaid
                              ? FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF263238),
                                    useGoogleFonts: false,
                                  )
                              : FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Seoge UI',
                                    color: Colors.white,
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
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      if (textController1?.text != "" &&
                          textController2?.text != "" &&
                          textController3?.text != "") {
                        await addOutstandingStoreLoanDetails();
                      } else {
                        Fluttertoast.showToast(
                          msg: "Pleas fill out all the fields",
                          backgroundColor: Colors.red,
                        );
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
