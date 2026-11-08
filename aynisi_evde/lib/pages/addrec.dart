import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'recipe.dart'; 



class ApiServisi {
  //static const _adres = 'https://10.0.2.2:7100/api/Recipes'; //  'https://localhost:7100/api/Recipes';
  static String getadres(){
   if(kIsWeb){
    return 'https://localhost:7100/api/Recipes';
   }
   else if(Platform.isAndroid){
      return 'https://10.0.2.2:7100/api/Recipes';
   }
   else{
      return 'https://localhost:7100/api/Recipes';
   }
  }
  static Future<bool> tariflereEkle(String recipeName, String recipeVideoUrl,String recipetex,List<Ingredient> malzemeler) async {
   try {
    // 1. getadres() hangi adres üzerinden döneceği
    final String address = getadres(); 
    final Uri url = Uri.parse(address);

    // 2. Map Yapısı gönderilecek veri için
    Recipe recipeData = Recipe(
  recipeId: 0,
  recipeName: recipeName,
  recipeText: recipetex,
  ingredients: malzemeler,
);

    // 3. HTTP POST İsteği
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(recipeData),
    );

    // Response durumuna bak
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('API Hata Kodu: ${response.statusCode}');
      print('API Yanıtı: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Bağlantı Hatası: $e');
    return false;
  }
} 
}



class YemekEklePage extends StatefulWidget {
  const YemekEklePage({super.key});

  @override
  State<YemekEklePage> createState() => _YemekEPageState();
}

class _YemekEPageState extends State<YemekEklePage> {
  
  
final recipename_control = TextEditingController();
final recipevideo_control = TextEditingController();
final recipeing_control = TextEditingController();
final reciperecp_control = TextEditingController();
@override
void dispose(){
  recipename_control.dispose();
  recipevideo_control.dispose();
   recipeing_control.dispose();
   reciperecp_control.dispose();
  super.dispose();
}

  @override
  void initState() {
    super.initState();
     
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekler Sayfası (API)'),
        backgroundColor: Colors.green.shade400,
      ),
      
      body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
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
                          child: Text("Tarif Giren Kisi", style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent)),
                        ),

Text("Yemek Adı:", style: const TextStyle(fontSize: 22, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(width: 150,child: 
                  TextField(controller: recipename_control,
                  maxLines: null,
      decoration: InputDecoration.collapsed(
        hintText: 'Yemek Adini girin',
        border: OutlineInputBorder(),
      ),
    ),),

    Text("Yemek Video:", style: const TextStyle(fontSize: 22, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(width: 150,child: 
                  TextField(controller: recipevideo_control,
                  maxLines: null,
      decoration: InputDecoration.collapsed(
        hintText: 'Yemek video linkini girin',
        border: OutlineInputBorder(),
      ),
    ),),

                        Text("Yemek icin gerekli malzemeler:", style: const TextStyle(fontSize: 18, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        SizedBox(width: 150,child: 
                  TextField(controller: recipeing_control,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
      decoration: InputDecoration.collapsed(
        hintText: 'Yemek Malzemelerini giriniz',
        border: OutlineInputBorder(),
      ),
    ),),
                        
                        const SizedBox(height: 10),
                        Text("Yemegin Yapilisi:", style: const TextStyle(fontSize: 18, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        SizedBox(width: 150,child: 
                  TextField(controller: reciperecp_control,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
      decoration: InputDecoration.collapsed(
        hintText: 'Yemek tarifini giriniz',
        border: OutlineInputBorder(),
      ),
    ),),
                       TextButton(onPressed: () async{print(recipename_control.text); bool sonuc =await ApiServisi.tariflereEkle(recipename_control.text,recipevideo_control.text,reciperecp_control.text,const[]);}, child: Text("TarifEkle", style: const TextStyle(fontSize: 18, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
     
      );
     
  }
}