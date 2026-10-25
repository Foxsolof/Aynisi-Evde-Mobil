import 'package:flutter/material.dart';
import 'pages/yemek_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AynısıEvde',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16B63B),
          ),
        ),
        home: const AnaSayfa(),
      );
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

@override
Widget build(BuildContext context) => Scaffold(
  body: const anasayfa_content(),
  // Alt buton
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => const YemekPage(),),);},
      child: const Text('Yemek'),),);}

class anasayfa_content extends StatelessWidget {
  const anasayfa_content({super.key});

@override
Widget build(BuildContext context) => Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF4E8D0),
        Color(0xFFB6C99B),],),),
  child: SafeArea(
    child: Column(
      children: [
        // Hoş geldin mesajı
         const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 16),
          child: Text('Hoş Geldin!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Color(0xFF008A21),),),),

          // Video çerçevesi
        Expanded(
          child: Center(
            child: Container(
              // Genişlik
              width: double.infinity,
              // Maksimum genişlik
              constraints: const BoxConstraints(maxWidth: 480),
              margin: const EdgeInsets.all(12), // Dış boşluk
              padding: const EdgeInsets.all(14), // İç boşluk
              decoration: BoxDecoration(
                color: const Color(0xFFE5F6F3),
                border: Border.all(color: const Color(0xFF008A21),width: 3),
                borderRadius: BorderRadius.circular(12),),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF9B6542),
                    borderRadius: BorderRadius.circular(6),),
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 72,
                      color: Colors.white,),),),
                      ),),),),],),),);
}
