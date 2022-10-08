import 'package:flutter/material.dart';

class Reload extends StatefulWidget {
  Reload({Key? key}) : super(key: key);

  @override
  State<Reload> createState() => _ReloadState();
}

class _ReloadState extends State<Reload> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
    );
  }
}
