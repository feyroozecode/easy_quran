import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SuratScreen extends StatefulWidget {
  const SuratScreen({super.key});

  @override
  State<SuratScreen> createState() => _SuratScreenState();
}

class _SuratScreenState extends State<SuratScreen> {
  @override
  Widget build(BuildContext context) {
    //list all surates
    for (var i = 1; i <= 114; i++) {
      print("${quran.getSurahName(i)}");
      // save it at list
      var list = [];
      list.add("${quran.getSurahName(i)}");
    }

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Surat",
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
                          Navigator.pushNamed(context, '/suratdetail',
                              arguments: {
                                'surat': quran.getSurahName(index + 1),
                                'ayat': quran.getVerseCount(index + 1),
                                'number': index + 1
                              });
                        },
                        title: Text(
                          "${quran.getSurahName(index + 1)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${quran.getSurahNameArabic(index + 1)}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "${quran.getVerseCount(index + 1)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                    })
              ], 
              
            )
          )
        )
      );
  }
}
