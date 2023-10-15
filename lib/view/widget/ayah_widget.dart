import 'package:flutter/material.dart';
import 'package:pocketquran/constant/colors.dart';
import 'package:pocketquran/view/widget/add_bookmark_button.dart';
import 'package:pocketquran/view/widget/play_audio_button.dart';

class ListAyahItem extends StatelessWidget {
  const ListAyahItem({
    super.key,
    required this.numOfAyah,
    required this.ayah,
    required this.translation,
  });

  final int numOfAyah;
  final String ayah;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: graySecondaryColor,
            width: 0.7,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 7),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(14, 3.5, 7, 3.5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              color: graySecondaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: backgroundColor,
                    ),
                    numOfAyah.toString(),
                  ),
                ),
                const Row(
                  children: [
                    PlayAudioButton(),
                    AddToBookmarkButton(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
          SizedBox(
            width: double.infinity,
            child: Text(
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: primaryColor,
                  fontFamily: 'quran',
                  height: 2.45),
              ayah,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Text(
                  style: const TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                  ),
                  translation,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
