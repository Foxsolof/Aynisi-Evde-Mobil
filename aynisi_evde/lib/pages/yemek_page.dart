import 'package:flutter/material.dart';

class YemekPage extends StatelessWidget {
  const YemekPage({super.key});
//String Namex="Doner";
//String desc="10 mavi kolayı iyice çalkalayın\nİçine azar azar meybuz eklemesi için döner ustasını kullanın\n20. meybuzu da koyduktan sonra yeterince bilim varsa\nafiyet olsun";
String satirla(){ // Bu tarifin başına aşama sayılarını yazmak için fonksiyon
  String x="10 mavi kolayı iyice çalkalayın\nİçine azar azar meybuz eklemesi için döner ustasını kullanın\n20. meybuzu da koyduktan sonra yeterince bilim varsa\nafiyet olsun";
  String yeni="1. ";
  int count =1;
  for(int i =0;i<x.length;i++){
  yeni+=x[i];
  if(x[i]=="\n"){
    count++;
    yeni+=count.toString()+". ";
  }
  }
 return yeni;
}
String Malzemeler(){ // Bu malzemelerin başına emoji koyarak listemek için kullanılacak fonksiyon
  String emote="\u{1F962}";
  String x="10 tane mavi kolayı\n20 tane meybuz\n1 döner ustası\nBir tutam da bilim";
  String yeni=emote;
  for(int i =0;i<x.length;i++){
  yeni+=x[i];
  if(x[i]=="\n"){
    yeni+=emote;
  }
  }
 return yeni;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekler Sayfası'),
        backgroundColor: Colors.green.shade400,
      ),
      body: Center(
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Doner",style: TextStyle(fontSize: 22,color: Colors.deepPurpleAccent)),
          //Image.asset('Assets/images/doner.png', width: 50,),
          Image.network("https://yemeksepeti.dhmedia.io/image/fd-tr/Products/24324517.jpg",width: 200,),// Doner fotoğrafı
          Container( width: 400,  // kutuyu ayarlayan yer
  //height: 250, 
  padding: const EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    color: Colors.grey.shade200, 
    borderRadius: BorderRadius.circular(12), 
    border: Border.all(color: Colors.deepPurpleAccent, width: 1)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
Align( // aligmenti değiştirmek için
            alignment: Alignment.centerRight,
            child: Text("Ali Efe SONMEZ",style: TextStyle(fontSize: 15,color:  Colors.deepPurpleAccent),),
          ),

          Text("Doner icin gerekli malzemeler:",style: TextStyle(fontSize: 22,color: Colors.deepPurpleAccent)),
          Align(alignment: Alignment.centerLeft,child: Text(Malzemeler(),style: TextStyle(fontSize: 22,color: Colors.deepPurpleAccent)),),
          
          Text("Doner Yapilisi:",style: TextStyle(fontSize: 22,color: Colors.deepPurpleAccent)),
          Text(satirla(),style: TextStyle(fontSize: 22,color: Colors.deepPurpleAccent)),

          ],),),
          
        ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Bir önceki sayfaya (Ana Sayfaya) geri dön
          Navigator.pop(context);
        },
        child: const Text('Geri'),
      ),
    );
  }
}