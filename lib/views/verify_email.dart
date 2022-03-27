import 'package:flutter/material.dart';
import 'package:notesapp/constants/routes.dart';
import 'package:notesapp/services/auth/auth_services.dart';
import 'package:notesapp/services/auth/bloc/auth_event.dart';
import 'package:notesapp/services/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}
class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(children: [
        const Text('We\'ve sent you an email verification, Please open it to verify your account'),
        const Text('If you haven\'t received a verification email yet, Press the button below'),
        TextButton(
         onPressed: () {
            context.read<AuthBloc>().add(
                  const AuthEventSendEmailVerification(),
                );
          },
          child: const Text('Send email verification'),
        ),
        TextButton(
          onPressed: ()async  {
           context.read<AuthBloc>().add(
                  const AuthEventLogout(),
                );
        }, child: const Text('Restart'),
        )
      ]),
    );
  }
}
