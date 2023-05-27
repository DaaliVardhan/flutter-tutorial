import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.indigo[600],
        centerTitle: true,
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                print(user);

                return Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        print("login pressed");
                        return;
                      },
                      child: const Text("LogIn"),
                    ),
                    TextButton(
                      onPressed: () {
                        print("register pressed");
                        return;
                      },
                      child: const Text("Register"),
                    ),
                  ],
                );

              default:
                return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
