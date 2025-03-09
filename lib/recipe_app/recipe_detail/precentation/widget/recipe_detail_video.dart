import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class RecipeDetailVideo extends StatefulWidget {
  const RecipeDetailVideo({super.key, required this.videoManzil});

  final String videoManzil;

  @override
  State<RecipeDetailVideo> createState() => _RetseptVideoHolat();
}

class _RetseptVideoHolat extends State<RecipeDetailVideo> {
  late final VideoPlayerController boshqaruvchi;
  double ovoz = 1.0;
  bool toliqEkran = false;

  @override
  void initState() {
    super.initState();
    boshqaruvchi = VideoPlayerController.networkUrl(Uri.parse(widget.videoManzil))
      ..initialize().then((_) {
        setState(() {
          boshqaruvchi.play();
        });
      });
  }

  @override
  void dispose() {
    boshqaruvchi.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void oldingaOtkaz() {
    final yangiHolat = boshqaruvchi.value.position + const Duration(seconds: 15);
    boshqaruvchi.seekTo(yangiHolat);
  }

  void orqagaOtkaz() {
    final yangiHolat = boshqaruvchi.value.position - const Duration(seconds: 15);
    boshqaruvchi.seekTo(yangiHolat);
  }

  void toliqEkranniAlmashtir() {
    setState(() {
      toliqEkran = !toliqEkran;
      if (toliqEkran) {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
        );
      } else {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    });
  }

  String vaqtniFormatlash(Duration vaqt) {
    String ikkitaRaqam(int n) => n.toString().padLeft(2, "0");
    final daqiqa = ikkitaRaqam(vaqt.inMinutes.remainder(60));
    final soniya = ikkitaRaqam(vaqt.inSeconds.remainder(60));
    return "$daqiqa:$soniya";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: boshqaruvchi.value.isInitialized
                  ? AspectRatio(
                aspectRatio: boshqaruvchi.value.aspectRatio,
                child: VideoPlayer(boshqaruvchi),
              )
                  : const CircularProgressIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                VideoProgressIndicator(
                  boshqaruvchi,
                  allowScrubbing: true,
                  colors: const VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Colors.white54,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: boshqaruvchi,
                      builder: (context, VideoPlayerValue qiymat, child) {
                        return Text(
                          vaqtniFormatlash(qiymat.position),
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    Text(
                      vaqtniFormatlash(boshqaruvchi.value.duration),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10, color: Colors.white, size: 32),
                      onPressed: orqagaOtkaz,
                    ),
                    IconButton(
                      icon: Icon(
                        boshqaruvchi.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          boshqaruvchi.value.isPlaying ? boshqaruvchi.pause() : boshqaruvchi.play();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.forward_10, color: Colors.white, size: 32),
                      onPressed: oldingaOtkaz,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        toliqEkran ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: toliqEkranniAlmashtir,
                    ),
                    Expanded(
                      child: Slider(
                        value: ovoz,
                        min: 0,
                        max: 1,
                        onChanged: (qiymat) {
                          setState(() {
                            ovoz = qiymat;
                            boshqaruvchi.setVolume(ovoz);
                          });
                        },
                      ),
                    ),
                    const Icon(Icons.volume_up, color: Colors.white, size: 28),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}