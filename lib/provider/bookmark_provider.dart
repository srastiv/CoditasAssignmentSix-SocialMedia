import 'package:flutter/material.dart';
import 'package:social_media_app/network_model/network_model_class.dart';

class BookmarkProvider extends ChangeNotifier {
  List bookmarkedPosts = [];
  List<UserNetworkHelper>? ProviderOfOriginalListFromAPI;

  addRemoveBookmarks(UserNetworkHelper feedPost) {
    if (feedPost.isBookmarkAdded) {
      print("removed");
      feedPost.isBookmarkAdded = false;
      bookmarkedPosts.remove(feedPost);
      print(bookmarkedPosts);
    } else {
      print("added");
      feedPost.isBookmarkAdded = true;
      bookmarkedPosts.add(feedPost);
      print(bookmarkedPosts);
    }

    notifyListeners();
  }
}
