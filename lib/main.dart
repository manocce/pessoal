import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
import './paginainicial.dart';
import './pagina_educacional.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  var _respostaDada = false;
  var _explicacaoAtual = '';
  var _respostaCorreta = false;

  final _perguntas = const [
    {
      'texto': 'Qual é a maior fonte de poluição dos oceanos?',
      'respostas': [
        {'imagem':'assets/images/plastico.jpg','texto': 'Plástico', 'pontuacao': 1},
        {'imagem':'assets/images/industria.jpg', 'texto': 'Esgotos naturais', 'pontuacao': 0},
        {'imagem':'assets/images/petroleo.jpg', 'texto': 'Derramamento de petróleo', 'pontuacao': 0},
      ],
      'explicacao': 'O plástico é a maior fonte de poluição nos oceanos. Ele vem principalmente de lixo mal descartado que acaba indo parar nos mares e oceanos. Animais marinhos podem confundir plásticos com alimentos, o que pode ser fatal para eles. Além disso, o plástico demora centenas de anos para se decompor, causando problemas a longo prazo para o meio ambiente.',
    },
    {
      'texto': 'Qual é a porcentagem da superfície da Terra coberta pelos oceanos?',
      'respostas': [
        {'imagem':'assets/images/plastico.jpg','texto': '51%', 'pontuacao': 0},
        {'imagem':'assets/images/industria.jpg', 'texto': '71%', 'pontuacao': 1},
        {'imagem':'assets/images/petroleo.jpg', 'texto': '91%', 'pontuacao': 0},
      ],
      'explicacao': 'Os oceanos cobrem cerca de 71% da superfície da Terra. Eles desempenham um papel crucial na regulação do clima, fornecem habitat para inúmeras espécies e são uma fonte vital de alimentos e recursos para humanos.',
    },
    {
      'texto': 'Quais são as principais consequências da sobrepesca nos oceanos?',
      'respostas': [
        {'imagem':'assets/images/biodiversidade.jpg','texto': 'Diminuição da biodiversidade marinha', 'pontuacao': 1},
        {'imagem':'assets/images/peixes.jpg', 'texto': 'Aumento da população de peixes', 'pontuacao': 0},
        {'imagem':'assets/images/agua.jpg', 'texto': 'Melhoria na qualidade da água', 'pontuacao': 0},
      ],
      'explicacao': 'A sobrepesca acontece quando pescamos mais peixes do que o oceano pode repor naturalmente. Isso pode levar à diminuição da população de peixes, prejudicando a biodiversidade marinha. Além disso, a sobrepesca pode afetar a cadeia alimentar, causando desequilíbrios ecológicos.',
    },
    {
      'texto': 'O que é uma Zona Morta nos oceanos?',
      'respostas': [
        {'imagem':'assets/images/plastico.jpg','texto': 'Uma área onde não há vida marinha', 'pontuacao': 1},
        {'imagem':'assets/images/industria.jpg', 'texto': 'Um local onde ocorre a formação de recifes de coral', 'pontuacao': 0},
        {'imagem':'assets/images/petroleo.jpg', 'texto': 'Um habitat ideal para várias espécies de peixes', 'pontuacao': 0},
      ],
      'explicacao': 'Uma Zona Morta é uma área no oceano onde os níveis de oxigênio são tão baixos que a vida marinha não pode sobreviver. Isso geralmente é causado por poluição, como escoamento de fertilizantes, que cria grandes crescimentos de algas. Quando essas algas morrem e se decompõem, consomem o oxigênio da água, criando um ambiente inóspito para os organismos marinhos.',
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _pontuacaoTotal += pontuacao;
        _explicacaoAtual = _perguntas[_perguntaSelecionada]['explicacao'] as String;
        _respostaCorreta = pontuacao > 0;
        _respostaDada = true;
      });
    }
  }

  void _proximaPergunta() {
    setState(() {
      _perguntaSelecionada++;
      _respostaDada = false;
      _explicacaoAtual = '';
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
      _respostaDada = false;
      _explicacaoAtual = '';
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaInicial(),
        '/jogo': (context) => Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/oceanobackgroud.jpg',
                fit: BoxFit.cover,
              ),
              temPerguntaSelecionada
                  ? Questionario(
                      perguntas: _perguntas,
                      perguntaSelecionada: _perguntaSelecionada,
                      quandoResponder: _responder,
                      respostaDada: _respostaDada,
                      explicacao: _explicacaoAtual,
                      proximaPergunta: _proximaPergunta,
                      respostaCorreta: _respostaCorreta,
                    )
                  : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
            ],
          ),
        ),
        '/pagina_educacional': (context) => PaginaEducacional(), // Adiciona a rota para a página educacional
      },
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
