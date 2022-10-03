import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
      },
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == PassArgumentsScreen.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as ScreenArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Navigation with Arguments',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Made'),
                subtitle: Text('0866571373'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Dodi'),
                subtitle: Text('08452214516'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Andi'),
                subtitle: Text('0865713613'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Reza'),
                subtitle: Text('085563713'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            ElevatedButton(
            onPressed: () {
             Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Create Contacts',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
          },
              child: const Text('Create New Contact'),
          ),
        ],
      ),
    );
  }
}

// A Widget that extracts the necessary arguments from
// the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

// A Widget that accepts the necessary arguments via the
// constructor.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor
  // parameters. It does not extract the arguments from
  // the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute
  // function provided to the MaterialApp widget.
  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}