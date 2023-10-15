import 'package:flutter/material.dart';
import 'package:pocketquran/constant/colors.dart';

class PlayAudioButton extends StatefulWidget {
  const PlayAudioButton({super.key});

  @override
  State<PlayAudioButton> createState() => _PlayAudioButtonState();
}

class _PlayAudioButtonState extends State<PlayAudioButton> {
  _onPressButton() {}

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressButton,
      color: secondaryColor,
      icon: const Icon(Icons.play_arrow_rounded),
    );
  }
}
