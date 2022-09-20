import 'package:country_picker/country_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../otp/otp_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  _PhoneNumberWidgetState createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? flag;
  String? code;
  TextEditingController? textController1;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
  }

  Future addUserNumber(String number) async {
    final prefs = await SharedPreferences.getInstance();
    print(number);

    try {
      var response = await http.post(
        Uri.parse(
            "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/user/add"),
        body: {"phonenumber": "$number"},
      );

      print(response.body);

      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await prefs.setString("user_id", body["_id"]);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpWidget(),
          ),
        );
      } else {
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 70, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                      child: Text(
                        'Enter the Mobile No. to recieve OTP',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                  child: Container(
                    width: 336,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF979797),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              onSelect: (Country country) {
                                // country.phoneCode;
                                print('Select country: ${country.displayName}');
                                print('Flag: ${country.flagEmoji}');
                                setState(() {
                                  flag = country.flagEmoji;
                                  code = country.phoneCode;
                                });
                              },
                            );
                          },
                          child: flag != null
                              ? Text(
                                  "$flag",
                                  style: TextStyle(fontSize: 18),
                                )
                              : Container(
                                  width: 34,
                                  height: 22,
                                  child:
                                      Image.asset("assets/images/ukflag.png"),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Container(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          child: Text(
                            code != null ? "+$code" : "+44",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                      color: Color(0xFF979797),
                                    ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Center(
                            child: TextFormField(
                              controller: textController1,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              keyboardType: TextInputType.number,
                            ),
                            // TextFormField(
                            //   controller: textController1,
                            //   autofocus: true,
                            //   obscureText: false,
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //     errorBorder: InputBorder.none,
                            //     enabledBorder: InputBorder.none,
                            //     focusedBorder: InputBorder.none,
                            //     disabledBorder: InputBorder.none,

                            //   ),
                            //   style: FlutterFlowTheme.of(context)
                            //       .bodyText1
                            //       .override(
                            //         fontFamily: 'Segoe UI',
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.normal,
                            //         useGoogleFonts: false,
                            //       ),
                            //   keyboardType: TextInputType.number,
                            // ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: InkWell(
                  onTap: () async {
                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OtpWidget(),
                    //   ),
                    // );
                    if (textController1?.text != null &&
                        textController1?.text != "") {
                      await addUserNumber(textController1!.text);
                    } else {
                      Fluttertoast.showToast(
                        msg: "Enter a valid number",
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: Container(
                    width: 340,
                    height: 50,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Button.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 380, 0, 0),
                child: Container(
                  width: 111,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(
                        'assets/images/Group_25034.png',
                      ).image,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
