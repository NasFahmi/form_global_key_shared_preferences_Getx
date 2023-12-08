import 'package:flutter/material.dart';
import 'package:form_global_key_shared_preferences/view/SharedView.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SharedTest(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nama = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? textfield;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Percobaan TextField dan Shared Preferences'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Percobaan TextField dan Shared Preferences'),
                TextFormField(
                  controller: nama,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
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
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('nama', nama.text);
                      print('Input anda berikan adalah ${nama.text}');
                    }
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      textfield = prefs.getString('nama');
                    });
                  },
                  child: Text('Show Shared Preferences'),
                ),
                Text('Shared Text = ${textfield ?? ""}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
