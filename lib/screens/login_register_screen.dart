import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();

  void initState() {
    bool _passwordVisible = false;
  }
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  late String? errorMessage = '';
  bool isLogin = true;
  bool _passwordVisible = false;

  void initState() {
    _passwordVisible = false;
  }

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        _controllerEmail.text,
        _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          errorMessage = e.message;
        },
      );
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        _controllerEmail.text,
        _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          errorMessage = e.message;
        },
      );
    }
  }

  Widget _entryField(String hint, TextEditingController controller) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextField(
        obscureText: controller == _controllerEmail ? false : !_passwordVisible,
        obscuringCharacter: '*',
        cursorColor: custom_colors.primaryDarkPurple,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: custom_colors.primaryDarkPurple.withOpacity(0.2)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                controller == _controllerEmail
                    ? Icons.email_outlined
                    : (_passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                color: custom_colors.secondaryLightPurple,
                size: 26,
              ),
              onPressed: (() {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              }),
            )),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Hmm? $errorMessage',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: custom_colors.primaryDarkPurple,
        fontSize: 14,
      ),
    );
  }

  Widget _submitButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(),
        width: 220,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: custom_colors.secondaryLightPurple),
          onPressed: (() => isLogin
              ? signInWithEmailAndPassword()
              : createUserWithEmailAndPassword()),
          child: Text(
            isLogin ? 'LOG IN' : 'SIGN UP',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: (() {
        setState(() {
          isLogin = !isLogin;
        });
      }),
      child: Text(
        isLogin ? 'SIGN UP' : 'LOGIN',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 14,
            color: custom_colors.primaryDarkPurple,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: custom_colors.primaryDarkPurple,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top, left: 32),
                height: 160,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  isLogin ? "LOG IN" : 'SIGN UP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: custom_colors.backgroundPurple,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            custom_colors.secondaryLightPurple.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      _entryField(
                        'email address...',
                        _controllerEmail,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      _entryField(
                        'your password...',
                        _controllerPassword,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: _errorMessage(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: _submitButton(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                height: 1,
                                color: custom_colors.primaryDarkPurple,
                              ),
                            ),
                          ),
                          Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 18,
                              color: custom_colors.primaryDarkPurple,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 1,
                                color: custom_colors.primaryDarkPurple,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      GestureDetector(
                        onTap: () => Auth().signInWithGoogle(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: custom_colors.secondaryLightPurple,
                                  width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/google_logo.png',
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Sign In With Google',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: custom_colors.primaryDarkPurple,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLogin
                                ? 'Don\'t have an account?'
                                : 'Already a user?',
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          _loginOrRegisterButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
