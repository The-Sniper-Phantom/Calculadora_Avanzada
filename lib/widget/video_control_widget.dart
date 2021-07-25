import 'package:calculadora_imc/model/exercise.dart';
import 'package:flutter/material.dart';

class VideoControlsWidget extends StatelessWidget {
  const VideoControlsWidget(
      {Key key,
      @required this.exercise,
      @required this.onRewindVideo,
      @required this.onNextVideo,
      @required this.onTogglePlaying})
      : super(key: key);

  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.95),
        ),
        height: 142,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildText(
                  title: 'Duracion',
                  value: '${exercise.duration.inSeconds} Segundos',
                ),
                buildText(
                  title: 'Repeticiones',
                  value: '${exercise.noOfReps} Rep.',
                ),
              ],
            ),
            buildButtons(context),
          ],
        ),
      );

  Widget buildText({
    @required String title,
    @required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: onRewindVideo,
            icon: Icon(
              Icons.fast_rewind,
              color: Colors.black87,
              size: 32,
            ),
          ),
          buildPlayButton(context),
          IconButton(
            onPressed: onNextVideo,
            icon: Icon(
              Icons.fast_forward,
              color: Colors.black87,
              size: 32,
            ),
          ),
        ],
      );

  Widget buildPlayButton(BuildContext context) {
    final isLoading =
        exercise.controller == null || !exercise.controller.value.isInitialized;

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (exercise.controller.value.isPlaying) {
      return buildButton(
        context,
        icon: Icon(Icons.pause, size: 30, color: Colors.white),
        onClicked: () => onTogglePlaying(false),
      );
    } else {
      return buildButton(
        context,
        icon: Icon(Icons.play_arrow, size: 30, color: Colors.white),
        onClicked: () => onTogglePlaying(true),
      );
    }
  }

  Widget buildButton(BuildContext context,
          {@required Widget icon, @required VoidCallback onClicked}) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 24,
            child: icon,
          ),
        ),
      );
}
