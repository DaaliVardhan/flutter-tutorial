import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tut1/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          title: const Text("Register"),
          backgroundColor: Colors.indigo[600],
          centerTitle: true,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 10,
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                {
                  return Column(
                    children: [
                      TextField(
                        controller: _email,
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: "Enter your email",
                            labelText: "Email",
                            border: OutlineInputBorder()),
                        autofillHints: const [AutofillHints.email],
                      ),
                      TextField(
                        autocorrect: false,
                        obscureText: true,
                        // obscuringCharacter: ".",
                        enableSuggestions: false,
                        decoration: const InputDecoration(
                            hintText: "Enter your password",
                            labelText: "Password",
                            border: OutlineInputBorder()),
                        autofillHints: const [AutofillHints.password],
                        controller: _password,
                      ),
                      TextButton(
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;
                            try {
                              final user = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                              print(user);
                            } on FirebaseAuthException catch (e) {
                              print(e.code);
                            }
                          },
                          child: const Text("Register")),
                    ],
                  );
                }
              default:
                {
                  return const Center(child: Text("Loading..."));
                }
            }
          },
        ));
  }
}
