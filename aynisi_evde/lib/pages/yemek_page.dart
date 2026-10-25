import 'package:flutter/material.dart';

class YemekPage extends StatelessWidget {
  const YemekPage({super.key});

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
          Text("Doner",selectionColor: Colors.deepPurple ,),
          //Image.asset('Assets/images/doner.png', width: 50,),
          Image.network("https://yemeksepeti.dhmedia.io/image/fd-tr/Products/24324517.jpg",width: 200,)
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