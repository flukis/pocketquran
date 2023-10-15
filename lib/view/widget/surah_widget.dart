import 'package:flutter/material.dart';
import 'package:pocketquran/constant/colors.dart';
import 'package:pocketquran/view/surah/surah_screen.dart';

class ListSurahItemWidget extends StatelessWidget {
  const ListSurahItemWidget({
    super.key,
    required this.numOfSurah,
    required this.numOfVerse,
    required this.type,
    required this.arabicName,
    required this.arabic,
    required this.surahTranslation,
    required this.surahRevelation,
  });

  final int numOfSurah;
  final int numOfVerse;
  final String type;
  final String arabicName;
  final String arabic;
  final String surahTranslation;
  final String surahRevelation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SurahScreen(
              numOfSurah: numOfSurah,
              surahName: arabicName,
              surahTranslation: surahTranslation,
              surahRevelation: surahRevelation,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: graySecondaryColor,
              width: 0.7,
            ),
          ),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                border: Border.all(
                  color: secondaryColor,
                  width: 2.1,
                ),
              ),
              child: Text(
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: primaryColor,
                ),
                numOfSurah.toString(),
              ),
            ),
            const SizedBox(width: 21),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.5,
                      color: primaryColor,
                    ),
                    "Surah $arabicName",
                  ),
                  const SizedBox(height: 3.5),
                  Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: grayColor,
                    ),
                    "${type.toUpperCase()} - ${numOfVerse.toString()} VERSES",
                  ),
                ],
              ),
            ),
            Text(
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21,
                color: secondaryColor,
                fontFamily: 'quran',
              ),
              arabic,
            ),
          ],
        ),
      ),
    );
  }
}
