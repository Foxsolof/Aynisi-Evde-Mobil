import 'dart:io';
import 'package:flutter/material.dart';
import 'pages/yemek_page.dart';
import 'pages/addrec.dart';
class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
void main() { HttpOverrides.global = DevHttpOverrides();runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AynısıEvde',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(240, 236, 6, 6),
          ),
        ),
        home: const AnaSayfa(),
      );
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

 State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int seciliSekme = 0;
//alt sayfa kısımmı
  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: seciliSekme,
      children: const [
        Anasayfa_content(),
        YemekPage(),
        YemekEklePage(),
        SizedBox.shrink(),
        SizedBox.shrink(),
      ],
    ),

    // Alt menü aynı bırakıldı.
    bottomNavigationBar: NavigationBar(
      selectedIndex: seciliSekme,
      onDestinationSelected: (i) => setState(() => seciliSekme = i),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        NavigationDestination(
          icon: Icon(Icons.restaurant_menu_outlined),
          selectedIcon: Icon(Icons.restaurant_menu),
          label: 'Yemek',
        ),
         NavigationDestination(
          icon: Icon(Icons.hdr_plus),
          selectedIcon: Icon(Icons.hdr_plus),
          label: 'tarif ekle',
        ),
        NavigationDestination(icon: Icon(Icons.access_alarm), label: ''),
        NavigationDestination(icon: Icon(Icons.access_alarm), label: ''),
      ],
    ),
  );
}

class Anasayfa_content extends StatelessWidget {
  const Anasayfa_content({super.key});

@override
//arkaplan
Widget build(BuildContext context) => Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF4E8D0),
        Color(0xFFB6C99B),
        Color.fromARGB(255, 182, 10, 10),
        ],),),
//anasayfa içerik
  child: SafeArea(
    child: Column(
      children: [
        // Hoş geldin mesajı
         const Padding(
          padding: EdgeInsets.only(top:20,bottom:16,left:40,right:40),
          child: Text('aynısı evdeye hoş geldiniz!\nbu sayfa henüz bir prototip, son haline hiçbir şeklide benzemeyebilir!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Color(0xFF008A21),),),),
          // Video çerçevesi
        Expanded(
          child: Center(
            child: Container(
              // Genişlik
              width: double.infinity,
              // Maksimum genişlik
              constraints: const BoxConstraints(maxWidth: 6000),
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
                      ),),),),
                      IconButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => const YemekEklePage(),),);}, icon: const Icon(Icons.airlines))
                      ]
                      
                      ),
                      ), );
}
