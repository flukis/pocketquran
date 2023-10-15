import 'package:flutter/material.dart';
import 'package:pocketquran/view/surah/surah_screen.dart';

class ListSurahItemWidget extends StatelessWidget {
  const ListSurahItemWidget({
    super.key,
    required this.numOfVerseArabic,
    required this.latinName,
    required this.arabicName,
    required this.arabic,
  });

  final int numOfVerseArabic;
  final String latinName;
  final String arabicName;
  final String arabic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SurahScreen(
              numOfSurah: numOfVerseArabic,
              surahName: arabicName,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
                color: Colors.black87,
              ),
              numOfVerseArabic.toString(),
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
                      color: Colors.black87,
                    ),
                    latinName,
                  ),
                  Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    arabicName,
                  ),
                ],
              ),
            ),
            Text(
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17.5,
                color: Colors.black87,
              ),
              arabic,
            ),
          ],
        ),
      ),
    );
  }
}
