import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/themes.dart';

enum Sky { midnight, viridian, cerulean, ceruleans }
class ChatItem {
  final Widget widget;
  final String initial;
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;
  final Color color;

  ChatItem({
    Key? key,
    required this.widget,
    required this.initial,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
    required this.color,
  });
  }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xffFFFFFF),
  Sky.viridian: const Color(0xffFFFFFF),
  Sky.cerulean: const Color(0xffFFFFFF),
  Sky.ceruleans: const Color(0xffFFFFFF),
};

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {

  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _FirstScreen()
      ],
    );
  }
}

Widget _FirstScreen() {
  Sky _selectedSegment = Sky.midnight;
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      backgroundColor: kWhiteColor,
      middle: Text('Chats'),
    ),
    child: Column(
      children: <Widget>[
        CupertinoSearchTextField(
          placeholder: 'Seach',
        ),
        Row(
          children: <Widget>[
            CupertinoSlidingSegmentedControl<Sky>(
              backgroundColor: kWhiteColor,
              thumbColor: skyColors[_selectedSegment]!,
              // This represents the currently selected segmented control.
              groupValue: _selectedSegment,
              // Callback that sets the selected segmented control.
              onValueChanged: (Sky? value) {
                if (value != null) {
                    _selectedSegment = value;
                }
              },
              children: const <Sky, Widget>{
                Sky.midnight: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'All Chats',
                    style: TextStyle(color: CupertinoColors.lightBackgroundGray),
                  ),
                ),
                Sky.viridian: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Work',
                    style: TextStyle(color: CupertinoColors.lightBackgroundGray),
                  ),
                ),
                Sky.cerulean: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Unread',
                    style: TextStyle(color: CupertinoColors.lightBackgroundGray),
                  ),
                ),
                Sky.ceruleans: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Personal',
                    style: TextStyle(color: CupertinoColors.lightBackgroundGray),
                  ),
                ),
              },
            )
          ],
        ),
      CupertinoScrollbar(
        child: ListView(
          children: [
            CupertinoListTile(
              title: Text('One-line'),
              onTap: () => Navigator.of(context).pushNamed('/one-line'),
            ),
            CupertinoListTile(
              title: Text('One-line with leading widget'),
              onTap: () => Navigator.of(context).pushNamed('/one-leading'),
            ),
            CupertinoListTile(
              title: Text('One-line with trailing widget'),
              onTap: () => Navigator.of(context).pushNamed('/one-trailing'),
            ),
            CupertinoListTile(
              title: Text('One-line with both widgets'),
              onTap: () => Navigator.of(context).pushNamed('/one-both'),
            ),
            CupertinoListTile(
              title: Text('Two-line'),
              onTap: () => Navigator.of(context).pushNamed('/two-line'),
            ),
            CupertinoListTile(
              title: Text('Three-line'),
              onTap: () => Navigator.of(context).pushNamed('/three-line'),
            ),
          ],
        ),
      ],
    )
  );
}
