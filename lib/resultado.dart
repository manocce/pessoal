import 'package:flutter/material.dart';
import './pagina_educacional.dart'; // Importe a nova página educacional

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacaoTotal, this.quandoReiniciarQuestionario, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pontuação Final: $pontuacaoTotal',
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: quandoReiniciarQuestionario,
            child: Text('Reiniciar Questionário'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaginaEducacional(),
                ),
              );
            },
            child: Text('Clique aqui para saber mais sobre os Oceanos'),
          ),
        ],
      ),
    );
  }
}
