import 'package:flutter/material.dart';
import 'package:luxe_desires/app/constants/app_color.dart';

class MusicPlayListWidget extends StatelessWidget {
  const MusicPlayListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: DarkThemeColor.primary,
            centerTitle: true,
            title: const Text('Music List'),
            bottom: const TabBar(
              tabs: [
                Text(
                  'Songs',
                ),
                Text(
                  'Playlist',
                ),
                Text(
                  'Artists',
                ),
                Text(
                  'Album',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            songMethod(),
            songMethod(),
            songMethod(),
            songMethod(),
          ])),
    );
  }
}

songMethod() {
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {},
          title: Text(
            'To ema aqa delo',
            style: TextStyle(color: DarkThemeColor.primaryText),
          ),
          subtitle: Text(
            'To ema aqa delo',
            style: TextStyle(color: DarkThemeColor.secondaryText),
          ),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png",
            ),
          ),
        );
      });
}
