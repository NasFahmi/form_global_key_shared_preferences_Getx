import 'package:flutter/material.dart';
import 'package:form_global_key_shared_preferences/controller/sharedController.dart';
import 'package:get/get.dart';

class SharedTest extends StatelessWidget {
  SharedTest({super.key});
  final SharedController sharedController = Get.put(SharedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Form Globl Key Using Getx'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Shared Preferences & Form Using Getx'),
              Obx(
                () => Form(
                  key: sharedController.formKey.value,
                  child: Column(
                    children: [
                      const Text('Percobaan TextField dan Shared Preferences'),
                      Obx(
                        () => TextFormField(
                          controller: sharedController.nama.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text awodwadj';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade500,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue.shade400,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.green.shade400,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.red.shade400,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (sharedController.formKey.value.currentState
                                  ?.validate() ??
                              false) {
                            sharedController.addStringNama();
                            print(
                                "input dengan ${sharedController.nama.value.text}");
                          }
                        },
                        child: const Text('Save'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await sharedController.getStringNama();
                          print(sharedController.dataNama.value);
                        },
                        child: Text('Show Shared Preferences'),
                      ),
                    ],
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
