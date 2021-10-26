import 'package:flutter/material.dart';
import 'package:providerhttp/pixabay.dart';

class HomeViewModel with ChangeNotifier {
  final PixaBay pixaBay;
  HomeViewModel(this.pixaBay);

  get picControl => _picControl;

  // set picControl(value) {
  //   _picControl = value;
  // }

  int _counter = 0;
  final _picControl = TextEditingController();

  @override
  void dispose() {
    _picControl.dispose();
    super.dispose();
  }


  }


