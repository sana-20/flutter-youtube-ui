import 'package:flutter/material.dart';
import 'json.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xFF202020),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const <Padding>[
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '전체',
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '실시간',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF303134),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '음악',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF303134),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '게임',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF303134),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '컴퓨터',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF303134),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '팟캐스트',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF303134),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Chip(
                              label: Text(
                                '요리',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF303134),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Image.network(
                      'https://download.logo.wine/logo/YouTube/YouTube-White-Full-Color-Logo.wine.png',
                      width: 130,
                    ),
                  ],
                ),
                actions: <Widget>[
                  IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
                  const SizedBox(width: 5),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none)),
                  const SizedBox(width: 5),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                        radius: 13,
                        backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/-n5LCi28clDw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclbAcD_6ymocoUF63pxc_48JmnYMg/s128-c/photo.jpg',
                        )),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 60),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final video = videos[index];
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Image.network(
                                  video['thumbnailUrl'],
                                  height: 220,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  color: Colors.black,
                                  child: Text(
                                    video['duration'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  foregroundImage:
                                      NetworkImage(video['channelImage']),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          video['title'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 15),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${video['channelName']} ∙ '
                                          '조회수 ${video['viewCount']}회 ∙ '
                                          '${video['postTime']} 전',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.more_vert, size: 20)
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: videos.length,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Shorts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined), label: '구독'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined), label: '보관함'),
        ],
      ),
    );
  }
}
