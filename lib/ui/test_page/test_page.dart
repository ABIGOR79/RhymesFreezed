import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poem/ui/test_page/auth.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Provider Example")),
      body: Center(
        child: authProvider.userEmail == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You are not signed in"),
                  ElevatedButton(
                    onPressed: () {
                      authProvider.signIn("user@example.com");
                    },
                    child: const Text("Sign In"),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Signed in as: ${authProvider.userEmail}"),
                  ElevatedButton(
                    onPressed: authProvider.signOut,
                    child: const Text("Sign Out"),
                  ),
                ],
              ),
      ),
    );
  }
}
