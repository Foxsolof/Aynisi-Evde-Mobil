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
      body: const Center(
        child: Text('Burası Yemek Sayfası!', style: TextStyle(fontSize: 22)),
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