import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;
  final bool respostaDada;
  final String explicacao;
  final VoidCallback proximaPergunta;
  final bool respostaCorreta;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    required this.respostaDada,
    required this.explicacao,
    required this.proximaPergunta,
    required this.respostaCorreta,
    Key? key,
  }) : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>>
        : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!respostaDada) ...[
          Questao(perguntas[perguntaSelecionada]['texto'] as String),
          ...respostas.map((resp) {
            return Resposta(
              resp['texto'] as String,
              resp['imagem'] as String,
              () => quandoResponder(resp['pontuacao'] as int),
            );
          }).toList(),
        ] else ...[
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Column(
              children: [
                Text(
                  respostaCorreta ? 'Você acertou!' : 'Você errou!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: respostaCorreta ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  explicacao,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: proximaPergunta,
                  child: Text('Próxima Pergunta'),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
