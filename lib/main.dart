import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpaswordgenerator/generatePassword.dart';

final controller = TextEditingController();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskelet(),
    );
  }
}

class Iskelet extends StatefulWidget {
  const Iskelet({Key? key}) : super(key: key);

  @override
  _IskeletState createState() => _IskeletState();
}

class _IskeletState extends State<Iskelet> {
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Random Password Generator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: controller,
              readOnly: true,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      final data = ClipboardData(text: controller.text);
                      Clipboard.setData(data);
                      final snackBar = SnackBar(
                          content: Text(
                            controller.text == ""
                                ? 'Password Empty!'
                                : ' Password Copied',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: controller.text == ""
                              ? Colors.red
                              : Colors.green);
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }
}

Widget buildButton() {
  final backgroundColor = MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.pressed) ? Colors.pink : Colors.black);
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: backgroundColor),
    child: Text('Generate Password'),
    onPressed: () {
      final password = generatePassword();
      controller.text = password;
    },
  );
}
