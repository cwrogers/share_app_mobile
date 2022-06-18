import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    var authProvider = Provider.of<AuthProvider>(context);
    var emailFieldController = TextEditingController();
    var passwordFieldController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              margin: EdgeInsets.all(10),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: emailFieldController,
            ),
            Container(
              margin: EdgeInsets.all(10),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: passwordFieldController,
            ),
            Container(
              margin: EdgeInsets.all(10),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    authProvider.authenticate(emailFieldController.text, passwordFieldController.text);
                  },
                  child: Text('Login'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                ),
                ElevatedButton(
                  onPressed: () {
                    authProvider.registerAccount(emailFieldController.text, passwordFieldController.text);
                  },
                  child: Text('Register'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
