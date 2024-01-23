import 'package:flutter/material.dart';
import 'package:music/Components/neu_box.dart';
import 'package:music/models/playlist.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<playList>(builder: (context, value, child) {
      // get playlist
      final playlists = value.playlist;

      // get current song index
      final currentsong = playlists[value.currentSongIndex ?? 0];

      // return Scaffold
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Text("P L A Y L I S T"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Neubox(
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(currentsong.albumArtImagePath)),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentsong.songName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(currentsong.artistName),
                              ],
                            ),
                            const Icon(Icons.favorite, color: Colors.red),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text("0:00"),
                          //shuffle icon
                          Icon(Icons.shuffle),
                          // repeat icon
                          Icon(Icons.repeat),
                          // end time
                          Text("0:00"),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 0,
                      )),
                      child: Slider(
                        value: 50,
                        min: 0,
                        max: 100,
                        activeColor: Colors.deepPurple,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Neubox(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // skip previous
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Neubox(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.play_arrow),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // play/pause
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Neubox(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ),
                    //skip forward
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
