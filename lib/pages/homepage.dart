import 'package:flutter/material.dart';
import 'package:music/Components/mydrawer.dart';
import 'package:provider/provider.dart';

import '../models/playlist.dart';
import '../models/song.dart';
import 'SongPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final dynamic playistprovider;
  @override
  void initState() {
    super.initState();
    // get playlistprovider
    playistprovider=Provider.of<playList>(context,listen: false);

  }
  void goToSong(int index){
    playistprovider.currentSongIndex=index;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SongPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 3,
        title: const SafeArea(
          child:  Text(
            'P L A Y L I S T',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer:const MyDrawer(),
      body: Consumer<playList>(
        builder: (context, value, child) {
          final List<Song> playlistdata = value.playlist;
          return ListView.builder(
              itemCount:playlistdata.length,
              itemBuilder: (context, index) {
            final Song songs = playlistdata[index];
            return ListTile(
              title:Text(songs.songName),
              subtitle: Text(songs.artistName),
              leading: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(4.0)),child: Image.asset(songs.albumArtImagePath,)),
              onTap: ()=>goToSong(index),
            );
          });
        },
      ),
    );
  }
}
