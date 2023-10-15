import 'package:flutter/material.dart';
import 'package:pocketquran/constant/colors.dart';
import 'package:pocketquran/data/response/api_status.dart';
import 'package:pocketquran/view/widget/ayah_widget.dart';
import 'package:pocketquran/viewmodel/list_ayah_of_surah_vm.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatefulWidget {
  static const String id = "surah_screen";

  const SurahScreen({
    super.key,
    required this.numOfSurah,
    required this.surahName,
    required this.surahTranslation,
    required this.surahRevelation,
  });
  final int numOfSurah;
  final String surahName;
  final String surahTranslation;
  final String surahRevelation;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen>
    with SingleTickerProviderStateMixin {
  final AyahListInSurahVM ayahListVM = AyahListInSurahVM();
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    ayahListVM.fetchAyahList(widget.numOfSurah);
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah ${widget.surahName}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            )),
      ),
      body: ChangeNotifierProvider<AyahListInSurahVM>.value(
        value: ayahListVM,
        child: Consumer<AyahListInSurahVM>(builder: (context, ayahListVM, _) {
          switch (ayahListVM.listAyah.status) {
            case Status.loading:
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(70),
                  child: LinearProgressIndicator(
                    backgroundColor: graySecondaryColor,
                    valueColor: AlwaysStoppedAnimation(secondaryColor),
                    minHeight: 14,
                  ),
                ),
              );
            case Status.error:
              return Text(ayahListVM.listAyah.msg ?? "NA");
            case Status.completed:
              return SingleChildScrollView(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.5),
                          color: secondaryColor,
                        ),
                        child: Column(
                          children: [
                            Text(
                              widget.surahName,
                              style: const TextStyle(
                                color: backgroundColor,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Divider(
                              color: backgroundColor,
                              height: 42,
                            ),
                            Text(
                              widget.surahTranslation,
                              style: const TextStyle(
                                color: backgroundColor,
                              ),
                            ),
                            Text(
                              "${widget.surahRevelation} - ${ayahListVM.listAyah.data!.numberOfVerses}",
                              style: const TextStyle(
                                color: backgroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ayahListVM.listAyah.data!.numberOfVerses,
                        itemBuilder: (context, index) {
                          final data = ayahListVM.listAyah.data!.verses[index];
                          return ListAyahItem(
                            numOfAyah: data.number.inSurah,
                            ayah: data.text.arab,
                            translation: data.translation.id,
                          );
                        },
                      )
                    ],
                  ));
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
