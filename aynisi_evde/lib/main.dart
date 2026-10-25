
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
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF16B63B)),
    ),
    home: const AnaSayfa(),
  );
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int seciliSekme = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: seciliSekme,
      children: const [
        AnaSayfaIcerigi(),
        YemekPage(),
        SizedBox.shrink(),
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
        NavigationDestination(icon: Icon(Icons.access_alarm), label: ''),
        NavigationDestination(icon: Icon(Icons.access_alarm), label: ''),
        NavigationDestination(icon: Icon(Icons.access_alarm), label: ''),
      ],
    ),
  );
}

class AnaSayfaIcerigi extends StatelessWidget {
  const AnaSayfaIcerigi({super.key});

  @override
  Widget build(BuildContext context) => Container(
    // Ana sayfanın arka planı.
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFD7C6A0),
          Color(0xFFF4E8D0),
          Color(0xFFB6C99B),
        ],
      ),
    ),
    child: SafeArea(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 720),
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(14),

          // Videoyu çevreleyen basit çerçeve.
          decoration: BoxDecoration(
            color: const Color(0xFFE5F6F3),
            border: Border.all(color: const Color(0xFF008A21), width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: AspectRatio(
            // Video alanının genişlik/yükseklik oranı.
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF9B6542),
                borderRadius: BorderRadius.circular(6),
              ),
              // Şimdilik gerçek video yerine basit bir önizleme gösterilir.
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 72,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
