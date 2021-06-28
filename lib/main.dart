import 'package:drawer/pages/account_page.dart';
import 'package:drawer/pages/chat_page.dart';
import 'package:drawer/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //目前索引值
  int _currentIndex = 0;

  final pages = [HomePage(), ChatPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Name"),
                accountEmail: Text("mail.com")),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("首頁"),
              onTap: (){_onItemClick(0);},
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.chat)),
              title: Text("聊天室"),
              onTap: (){_onItemClick(1);},
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.account_circle)),
              title: Text("個人資料頁"),
              onTap: (){_onItemClick(2);},
            )
          ],
        ),
      ),
      body: pages[_currentIndex],
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop();
    });
  }
}
