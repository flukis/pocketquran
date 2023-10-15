import 'package:flutter/material.dart';
import 'package:pocketquran/data/response/api_status.dart';
import 'package:pocketquran/view/widget/list_surah_widget.dart';
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
      body: ChangeNotifierProvider<SurahListVM>.value(
        value: surahListVM,
        child: Consumer<SurahListVM>(builder: (context, surahListVM, _) {
          switch (surahListVM.listSurah.status) {
            case Status.loading:
              return const Text("Loading...");
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
                    return ListSurahItemWidget(
                      numOfVerseArabic:
                          surahListVM.listSurah.data!.listSurah![index].number,
                      latinName: surahListVM.listSurah.data!.listSurah![index]
                          .name.translation['id']!,
                      arabicName: surahListVM.listSurah.data!.listSurah![index]
                          .name.transliteration['id']!,
                      arabic: surahListVM
                          .listSurah.data!.listSurah![index].revelation.arab,
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
