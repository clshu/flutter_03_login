import "package:flutter/material.dart";
import "../mixins/validation_mixin.dart";

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email = "";
  String? password = "";

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(bottom: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false, // For instruction pourpose
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    // RaisedButton is deprecated
    // ElevatedButton is suggested
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          print("POST email: $email password: $password");
          _formKey.currentState!.reset();
        }
      },
      child: Text('Submit'),
    );
  }
}
