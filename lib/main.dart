import 'package:easy_quran/src/screens/surat_details_screen.dart';
import 'package:easy_quran/src/screens/surat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends GetMaterialApp {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'QuranEasy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        getPages: [
          GetPage(name: '/', page: () => const SuratScreen()),
          GetPage(name: '/surat_detail', page: () => SuratDetailsScreen( suratNumber: 1 ) )
        ],
        home: const Material(  
            child: SuratScreen() 
        ));
  }
}
