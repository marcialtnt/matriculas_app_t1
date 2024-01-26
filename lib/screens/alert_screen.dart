import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  showPopupInstitucion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Text('hola');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
    );
  }
}
