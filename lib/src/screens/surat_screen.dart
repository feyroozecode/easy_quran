import 'package:easy_quran/src/screens/surat_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:quran/quran.dart' as quran;

class SuratScreen extends StatefulWidget {
  const SuratScreen({super.key});

  @override
  State<SuratScreen> createState() => _SuratScreenState();
}

class _SuratScreenState extends State<SuratScreen> {
  var list = [];

  @override
  void initState() {
    super.initState();

    populateSurates(list);
  }

  populateSurates(slist) {
    //list all surates
    for (var i = 1; i <= 114; i++) {
      //print("${quran.getSurahName(i)}");

      // save it at list
      slist.add("${quran.getSurahName(i)}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Surat(EasyQuran)",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 114,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/surat_detail',
                              arguments: {
                                'surat': quran.getSurahName(index + 1),
                                'ayat': quran.getVerseCount(index + 1),
                                'number': index + 1
                              });

                         Get.to(SuratDetailsScreen(suratNumber: (index +1 ) ));     
                        },
                        title: Text(
                          quran.getSurahName(index + 1),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          quran.getSurahNameArabic(index + 1),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "${quran.getVerseCount(index + 1)} vers.",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      );
                    })
              ],
            ))));
  }
}
