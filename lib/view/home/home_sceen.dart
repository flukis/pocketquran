import 'package:flutter/material.dart';
import 'package:pocketquran/constant/colors.dart';
import 'package:pocketquran/data/response/api_status.dart';
import 'package:pocketquran/view/widget/surah_widget.dart';
import 'package:pocketquran/viewmodel/list_surah_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SurahListVM surahListVM = SurahListVM();

  @override
  void initState() {
    surahListVM.fetchListSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pocket Quran"),
      ),
      body: ChangeNotifierProvider<SurahListVM>.value(
        value: surahListVM,
        child: Consumer<SurahListVM>(builder: (context, surahListVM, _) {
          switch (surahListVM.listSurah.status) {
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
              return Text(surahListVM.listSurah.msg ?? "NA");
            case Status.completed:
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 21, 0, 21),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surahListVM.listSurah.data!.listSurah!.length,
                  itemBuilder: (context, index) {
                    final data = surahListVM.listSurah.data!.listSurah![index];
                    return ListSurahItemWidget(
                      key: Key(data.number.toString()),
                      numOfSurah:
                          surahListVM.listSurah.data!.listSurah![index].number,
                      numOfVerse: data.numberOfVerses,
                      type: data.revelation.id,
                      arabicName: surahListVM.listSurah.data!.listSurah![index]
                          .name.transliteration['id']!,
                      arabic: data.name.short,
                      surahTranslation: data.name.translation["id"]!,
                      surahRevelation: data.revelation.id,
                    );
                  },
                ),
              );
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
