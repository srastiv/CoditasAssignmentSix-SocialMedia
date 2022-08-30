import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/bookmarkedposts.dart';
import 'package:social_media_app/network_model/network_model_class.dart';
import 'package:social_media_app/provider/bookmark_provider.dart';
import 'myfeed.dart';

class HomePage extends StatefulWidget {
  List<UserNetworkHelper> originalListFromAPI;
  HomePage(this.originalListFromAPI);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      MyFeed(
          Provider.of<BookmarkProvider>(context).ProviderOfOriginalListFromAPI),
      BookmarkedPosts(
        (Provider.of<BookmarkProvider>(context).ProviderOfOriginalListFromAPI),
      )
    ];
    return Scaffold(
      extendBody: true,

      bottomNavigationBar: CurvedBottomNavigationBar(),

      // CurvedBottomNavigationBar(),
      body: tabs[_currentIndex],
      //BookmarkedPosts(widget.originalListFromAPI),
      // MyFeed(widget.originalListFromAPI),
    );
  }

  CurvedNavigationBar CurvedBottomNavigationBar() {
    return CurvedNavigationBar(
      buttonBackgroundColor: Colors.transparent.withOpacity(0.1),
      backgroundColor: Colors.transparent.withOpacity(0),
      color: Colors.transparent.withOpacity(0.2),
      items: const <Widget>[
        Icon(
          Icons.home_filled,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.bookmark,
          size: 30,
          color: Colors.white,
        ),
      ],
      index: 0,
      animationDuration: Duration(milliseconds: 200),
      onTap: (indexx) {
        _currentIndex = indexx;
        debugPrint("current index is $indexx");
      },
    );
  }
}




// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.home_filled),
//         onPressed: () {},
//       ),
// BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 15,
//         color: Colors.blue,
//         child: Container(
//           height: 60,
//         ),
//       ),