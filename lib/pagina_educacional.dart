import 'package:flutter/material.dart';

class PaginaEducacional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações Educacionais sobre os Oceanos'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/fundooceano.jpg', // imagem de fundo
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.black.withOpacity(0.5), // Adiciona um fundo semitransparente preto
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oceans 20:',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'O Oceans 20 é um grupo formado por governos e organizações internacionais '
                        'que trabalham para promover a conservação e o uso sustentável dos oceanos. '
                        'Eles se concentram em questões como poluição marinha, proteção da vida marinha '
                        'e sustentabilidade dos recursos oceânicos.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.black.withOpacity(0.5), // Adiciona um fundo semitransparente preto
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Economia Azul:',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'A Economia Azul refere-se ao uso sustentável dos recursos oceânicos para '
                        'promover o desenvolvimento econômico e a preservação ambiental. Isso inclui '
                        'atividades como aquicultura, turismo costeiro, geração de energia renovável '
                        'e transporte marítimo, entre outros.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
