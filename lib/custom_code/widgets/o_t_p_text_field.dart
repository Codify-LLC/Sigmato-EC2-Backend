// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:pinput/pinput.dart';
import '../../summary/summary_widget.dart';

class OTPTextField extends StatefulWidget {
  const OTPTextField({
    Key? key,
    this.width,
    this.height,
    // required this.authenticatorState,
  }) : super(key: key);

  final double? width;
  final double? height;
  // final AuthenticatorState authenticatorState;

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  TextEditingController _textEditingController = TextEditingController();
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 2)),
    );

    final focusedPinTheme = defaultPinTheme;

    final submittedPinTheme = defaultPinTheme;

    return Pinput(
      controller: _textEditingController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: defaultPinTheme.copyWith(
        textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red.withOpacity(0.5),
            border: Border.all(color: Colors.white, width: 1)),
      ),
      errorBuilder: (error, stacktrace) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have entered an incorrect OTP',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 10,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Frame.png',
                      ).image,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      length: 6,
      validator: (s) {
        return s!.isNotEmpty ? null : 'Pin is necessary';
      },
      cursor: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 1,
        height: 20,
      ),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      forceErrorState: _error,
      onTap: () {
        setState(() {
          _error = false;
          _textEditingController.clear();
        });
      },
      onCompleted: (pin) async {
        try {
          if (FFAppState().signIn) {
            //   await Amplify.Auth.confirmSignIn(confirmationValue: pin);
            //   Amplify.Auth.getCurrentUser().then((user) {
            Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => SummaryWidget()));
            // }).onError((error, stackTrace) {
            //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
            // });
          } else {
            // await Amplify.Auth.confirmSignUp(
            //     username: FFAppState().phoneNumber, confirmationCode: pin);
            // Amplify.Auth.getCurrentUser().then((user) {
            Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => SummaryWidget()));
            // }).onError((error, stackTrace) {
            //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
            // });
          }
        } catch (e) {
          setState(() {
            _error = true;
          });
        }
      },
    );
  }
}
