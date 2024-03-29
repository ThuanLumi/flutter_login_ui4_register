import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_email);
      print(_password);
      print(_name);
      // Logging in the user with Firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Instagram',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Billabong',
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          validator: (input) => input!.trim().isEmpty
                              ? 'Please enter a valid name'
                              : null,
                          onSaved: (input) => _name = input!,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (input) => !input!.contains('@')
                              ? 'Please enter a valid email'
                              : null,
                          onSaved: (input) => _email = input!,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (input) => input!.length < 6
                              ? 'Must be at least 6 characters'
                              : null,
                          onSaved: (input) => _password = input!,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 250.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            primary: Colors.blue,
                          ),
                          onPressed: _submit,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 250.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            primary: Colors.blue,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
