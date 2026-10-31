import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'recipe.dart'; 

// 1. API Servisi (Fonksiyon adı ve veri tipi güncellendi)
class ApiServisi {
  static const _adres = 'https://localhost:7100/api/Recipes';
  
  static Future<List<Recipe>> tarifleriGetir() async {
    final cevap = await http.get(Uri.parse(_adres));
    if (cevap.statusCode != 200) {
      throw Exception('Sunucu hatası: ${cevap.statusCode}');
    }
    final List<dynamic> jsonListesi = jsonDecode(cevap.body);
    return jsonListesi
        .map((eleman) => Recipe.fromJson(eleman as Map<String, dynamic>))
        .toList();
  }
}


class YemekPage extends StatefulWidget {
  const YemekPage({super.key});

  @override
  State<YemekPage> createState() => _YemekPageState();
}

class _YemekPageState extends State<YemekPage> {
  
  late Future<List<Recipe>> futureTarifler;

  @override
  void initState() {
    super.initState();
    futureTarifler = ApiServisi.tarifleriGetir(); 
  }

  
  String malzemeleriFormatla(List<dynamic> ingredients) {
    String emote = "\u{1F962}";
    String sonuc = "";
    for (var ing in ingredients) {
      // Örn: "10 Litre Mavi Kula"
      sonuc += "$emote ${ing.amount} ${ing.unit} ${ing.name}\n";
    }
    return sonuc.isEmpty ? "Malzeme bulunamadı" : sonuc;
  }

  
  String satirla(String talimat) {
    String yeni = "1. ";
    int count = 1;
    for (int i = 0; i < talimat.length; i++) {
      yeni += talimat[i];
      if (talimat[i] == "\n") {
        count++;
        yeni += "$count. ";
      }
    }
    return yeni;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekler Sayfası (API)'),
        backgroundColor: Colors.green.shade400,
      ),
      
      body: FutureBuilder<List<Recipe>>(
        future: futureTarifler,
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          
          else if (snapshot.hasError) {
            return Center(child: Text("Hata Oluştu: ${snapshot.error}\n(Lütfen API'nin açık olduğundan emin olun)"));
          } 
          
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Hiç yemek tarifi bulunamadı."));
          }

          
          final yemek = snapshot.data![0]; // Burada 0 yerine 1,2,3 felan yazarsanız ona göre gelen 
          //Yemek değişiyor ama fotoğraf değişmiyor sonra video olacağı için çok dikkate alınmadı.!

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(yemek.recipeName, style: const TextStyle(fontSize: 22, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Image.network("https://yemeksepeti.dhmedia.io/image/fd-tr/Products/24324517.jpg", width: 200),
                  const SizedBox(height: 10),
                  Container(
                    width: 400,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.deepPurpleAccent, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text("Ali Efe SONMEZ", style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent)),
                        ),
                        Text("${yemek.recipeName} icin gerekli malzemeler:", style: const TextStyle(fontSize: 18, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(malzemeleriFormatla(yemek.ingredients), style: const TextStyle(fontSize: 16, color: Colors.deepPurpleAccent)),
                        ),
                        const SizedBox(height: 10),
                        Text("${yemek.recipeName} Yapilisi:", style: const TextStyle(fontSize: 18, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(satirla(yemek.recipeText), style: const TextStyle(fontSize: 16, color: Colors.deepPurpleAccent)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Geri'),
      ),
    );
  }
}