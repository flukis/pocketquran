import 'package:flutter/material.dart';
import 'package:pocketquran/data/response/api_status.dart';
import 'package:pocketquran/view/widget/list_ayah_item_widget.dart';
import 'package:pocketquran/viewmodel/list_ayah_of_surah_vm.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatefulWidget {
  static const String id = "surah_screen";

  const SurahScreen(
      {super.key, required this.numOfSurah, required this.surahName});
  final int numOfSurah;
  final String surahName;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final AyahListInSurahVM ayahListVM = AyahListInSurahVM();

  @override
  void initState() {
    ayahListVM.fetchAyahList(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah ${widget.surahName}'),
      ),
      body: ChangeNotifierProvider<AyahListInSurahVM>.value(
        value: ayahListVM,
        child: Consumer<AyahListInSurahVM>(builder: (context, ayahListVM, _) {
          switch (ayahListVM.listAyah.status) {
            case Status.loading:
              return const Text("Loading...");
            case Status.error:
              return Text(ayahListVM.listAyah.msg ?? "NA");
            case Status.completed:
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 21, 0, 21),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ayahListVM.listAyah.data!.verses.length,
                  itemBuilder: (context, index) {
                    return ListAyahItem(
                      numOfAyah: ayahListVM
                          .listAyah.data!.verses[index].number.inQuran,
                      ayah: ayahListVM.listAyah.data!.verses[index].text.arab,
                      translation: ayahListVM
                          .listAyah.data!.verses[index].translation.id,
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
