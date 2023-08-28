import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SuratDetailsScreen extends StatefulWidget {
  SuratDetailsScreen({super.key, required this.suratNumber});

  int suratNumber;

  @override
  State<SuratDetailsScreen> createState() => _SuratDetailsScreenState();
}

class _SuratDetailsScreenState extends State<SuratDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${quran.getSurahName(widget.suratNumber)}"),
      ),
      body: PageView(
        children: const [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child: Text('Surah Text content '),
              ),
            ),
          )
        ],
      ),
    );
  }
}
