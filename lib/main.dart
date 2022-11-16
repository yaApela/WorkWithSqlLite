import 'package:flutter/material.dart';
import 'core/db/data_base_helper.dart';

void main() async {
  await DataBaseHelper.instance.init();
  runApp(Container());
}