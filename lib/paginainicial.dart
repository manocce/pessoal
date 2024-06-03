import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao jogo sobre sustentabilidade dos Oceanos'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/wallpaper_ocean.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Jogo para pensar sobre o oceano',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Um jogo de perguntas sobre sustentabilidade nos oceanos é uma ferramenta educativa e envolvente. Ao desafiar os jogadores a testar seu conhecimento sobre questões como poluição, sobrepesca e acidificação dos oceanos, ele aumenta a conscientização e o entendimento sobre esses problemas críticos. Além disso, o jogo oferece uma oportunidade divertida de aprender sobre essas questões complexas de uma maneira acessível. Ao se envolverem ativamente no jogo, os jogadores podem desenvolver um senso de responsabilidade e motivação para agir em prol da preservação dos oceanos.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/jogo');
                  },
                  child: Text('Iniciar Jogo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
