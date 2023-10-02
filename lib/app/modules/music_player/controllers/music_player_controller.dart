import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class MusicPlayerController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  var duration = '0:00:00'.obs;
  var position = '0:00:00'.obs;
  var max = 0.0.obs;
  var value = 0.0.obs;

  updatePosition() {
    audioPlayer.onDurationChanged.listen((Duration d) {
      duration.value = d.toString().split('.')[0];
      max.value = d.inSeconds.toDouble();
    });
    audioPlayer.onPositionChanged.listen(
      (Duration p) {
        position.value = p.toString().split('.')[0];
        value.value = p.inSeconds.toDouble();
      },
    );
    update();
  }

  updatePage() {
    audioPlayer.pause();
    isPlaying = false;
    update();
  }

  changeDurationToSeconds(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  playAndStopAudio({required String url}) async {
    if (isPlaying == false) {
      await audioPlayer.play(UrlSource(url));
    } else {
      audioPlayer.pause();
    }
    updatePosition();
    isPlaying = !isPlaying;
    update();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    updatePosition();
    super.onReady();
  }

  @override
  void onInit() {
    updatePosition();
    super.onInit();
  }
}
