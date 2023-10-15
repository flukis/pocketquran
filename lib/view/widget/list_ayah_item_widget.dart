import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(14),
      child: Expanded(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                    color: Colors.black87,
                  ),
                  numOfAyah.toString(),
                ),
                const SizedBox(width: 21),
                Flexible(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Colors.black54,
                    ),
                    ayah,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    translation,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
