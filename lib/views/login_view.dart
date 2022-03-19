import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
     body: Column(children: [
                      TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Enter your E-mail',
                        ),
                        controller: _email,
                      ),
                      TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Password',
                        ),
                        controller: _password,
                      ),
                      TextButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;
                          try {
                            final userCredential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                            print(userCredential);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('user not found');
                            } else if (e.code == 'wrong-password') {
                              print('Invalid password');
                            }
                          }
                        },
                        child: const Text('Login'),
                      ),
                      TextButton(onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/register/', 
                          (route) => false);
                      }, child: const Text('Not registered yet? Rgister here!'),)
                    ],
                    ),
    );
  }
}
