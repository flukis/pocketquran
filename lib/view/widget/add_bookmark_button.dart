import 'package:flutter/material.dart';
import 'package:pocketquran/constant/colors.dart';

class AddToBookmarkButton extends StatefulWidget {
  const AddToBookmarkButton({super.key});

  @override
  State<AddToBookmarkButton> createState() => _AddToBookmarkButtonState();
}

class _AddToBookmarkButtonState extends State<AddToBookmarkButton> {
  _onPressButton() {}

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressButton,
      color: secondaryColor,
      icon: const Icon(Icons.bookmark_add_rounded),
    );
  }
}
