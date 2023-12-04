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
    var surahData = quran.getPageData(widget.suratNumber);

    //var jsonData = surahData

    //var verses = quran.getVerse(surahNumber, verseNumber)

    return WillPopScope(
      onWillPop: () async {
        bool allowPop = await showConfirmationDialog(context);

        return allowPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("${quran.getSurahName(widget.suratNumber)}"),
        ),
        body: PageView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(''),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> showConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to leave this screen?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
