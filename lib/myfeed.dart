import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'network_model/network_model_class.dart';
import 'provider/bookmark_provider.dart';
import 'utilities/constants.dart';

class MyFeed extends StatefulWidget {
  List<UserNetworkHelper>? originalListFromAPI;
  MyFeed(this.originalListFromAPI);

  @override
  State<MyFeed> createState() => _MyFeedState();
}

List<UserNetworkHelper> tempList = [];

class _MyFeedState extends State<MyFeed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          ExploreBar(),
          SizedBox(height: 10),
          StoryContainer(context),
          SizedBox(height: 35),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: MediaQuery.of(context).size.height - 242,
            child: ListView.separated(
              itemCount: widget.originalListFromAPI!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: kPostBoxDecoration,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(widget
                              .originalListFromAPI![index].picture.thumbnail),
                        ),
                        title: Text(
                            '${widget.originalListFromAPI![index].name.first} ${widget.originalListFromAPI![index].name.last}'),
                        subtitle: Text(
                            widget.originalListFromAPI![index].login.username),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    icon: kCommentIcon,
                                    onPressed: () {},
                                  ),
                                  const Text(
                                    "10",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {}, icon: kHeartIcon),
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
                                    icon: Icon(
                                      Icons.bookmark,
                                      color:
                                          //  Provider.of<BookmarkProvider>(
                                          //             context,
                                          //             listen: false)
                                          //         .bookmarkedPosts[index]
                                          //         .isBookmarkAdded
                                          //     ? Colors.black
                                          //     :
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
          ),
        ],
      ),
    );
  }

  Row ExploreBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 231, 238, 250),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_rounded,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          "Explore",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 231, 238, 250),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notification_important_sharp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Container StoryContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 610,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.originalListFromAPI!.length,
        itemBuilder: ((context, index) {
          return Row(
            children: [
              Column(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(widget
                              .originalListFromAPI![index].picture.thumbnail),
                        ),
                      ),
                    ),
                  ),
                  Text(widget.originalListFromAPI![index].name.first),
                ],
              ),
            ],
          );
        }),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 30),
      ),
    );
  }
}
