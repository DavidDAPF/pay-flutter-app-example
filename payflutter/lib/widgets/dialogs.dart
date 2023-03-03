import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return WillPopScope(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.lightBlue[50],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dissmiss(BuildContext context) {
    Navigator.pop(context);
  }
}
