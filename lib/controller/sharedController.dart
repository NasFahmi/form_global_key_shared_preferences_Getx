import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedController extends GetxController {
  Rx<TextEditingController> nama = TextEditingController().obs;
  var dataNama = ''.obs;
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Future<void> addStringNama() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nama.value.text);
  }

  Future<void> getStringNama() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dataNama.value = prefs.getString('nama') ?? '';
  }
}
