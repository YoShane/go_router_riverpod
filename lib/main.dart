import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Comment out the implementation you're not using
// import 'others/router2.dart';
// import 'others/router3.dart';
import 'router.dart';
import 'user.dart';

void main() {
  //Hello!!
  runApp(const ProviderScope(child: MyAwesomeApp()));
}

class MyAwesomeApp extends ConsumerWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Comment out the implementation you're not using
    final router = ref.watch(routerProvider); // I like this one better
    // final router = ref.watch(router2Provider);
    // final router = ref.watch(router3Provider);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'flutter_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your phenomenal app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is your homepage. Horray!"),
            ElevatedButton(
              onPressed: () {
                ref.read(userProvider.notifier).logout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Looks like you're not logged in. Let's change that."),
            ElevatedButton(
              onPressed: () {
                ref.read(userProvider.notifier).login(
                      "myEmail",
                      "myPassword",
                    );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
