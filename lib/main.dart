import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/homepage.dart';
import 'package:social_media_app/network_model/network_helper.dart';
import 'package:social_media_app/network_model/network_model_class.dart';
import 'package:social_media_app/provider/bookmark_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => BookmarkProvider()),
      child: MaterialApp(
          home: FutureBuilder<List<UserNetworkHelper>>(
        future: getUserData(),
        builder: (context, AsyncSnapshot<List<UserNetworkHelper>> snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text("snapshot has error"),
            );
          } else if (snapshot.hasData) {
            Provider.of<BookmarkProvider>(context)
                .ProviderOfOriginalListFromAPI = snapshot.data;
            return HomePage(snapshot.data!);
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      )),
    );
  }
}
