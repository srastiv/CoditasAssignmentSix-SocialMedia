import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/provider/bookmark_provider.dart';
import 'network_model/network_model_class.dart';
import 'utilities/constants.dart';

class BookmarkedPosts extends StatefulWidget {
  List<UserNetworkHelper>? originalListFromAPI;
  BookmarkedPosts(this.originalListFromAPI);

  @override
  State<BookmarkedPosts> createState() => _BookmarkedPostsState();
}

class _BookmarkedPostsState extends State<BookmarkedPosts> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<BookmarkProvider>(context).bookmarkedPosts.length);
    List toUseList = Provider.of<BookmarkProvider>(context).bookmarkedPosts;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: MediaQuery.of(context).size.height - 242,
      child: ListView.separated(
        itemCount: toUseList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: kPostBoxDecoration,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        NetworkImage(toUseList[index].picture.thumbnail),
                  ),
                  title: Text(
                      '${toUseList[index].name.first} ${toUseList[index].name.last}'),
                  subtitle: Text(toUseList[index].login.username),
                ),
                Stack(
                  children: [
                    Container(
                      child: Image.asset("assets/images/feed1.png"),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(23, 138, 138, 138)
                              .withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        width: 345,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: kCommentIcon,
                              onPressed: () {},
                            ),
                            const Text(
                              "10",
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(onPressed: () {}, icon: kHeartIcon),
                            const Text(
                              "122",
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(onPressed: () {}, icon: kSendIcon),
                            IconButton(
                              onPressed: () {
                                Provider.of<BookmarkProvider>(context,
                                        listen: false)
                                    .addRemoveBookmarks(
                                  widget.originalListFromAPI![index],
                                );
                              },
                              icon: const Icon(
                                Icons.bookmark,
                                color:
                                    // Provider.of<BookmarkProvider>(context,
                                    //             listen: false)
                                    //         .bookmarkedPosts[index]
                                    //         .bookmarkAdded
                                    //     ? Colors.black
                                    // :
                                    Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 10),
      ),
    );
  }
}
