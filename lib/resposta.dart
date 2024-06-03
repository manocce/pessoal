import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final String imagemPath; // Caminho da imagem
  final void Function() quandoSelecionado;

  const Resposta(
    this.texto,
    this.imagemPath,
    this.quandoSelecionado, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200, // Definindo um tamanho mínimo para o botão
        height: 200, // Definindo um tamanho mínimo para o botão
        child: ElevatedButton(
          onPressed: quandoSelecionado,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero, // Remove o preenchimento interno do botão
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Define a borda como zero para torná-la quadrada
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Remove a área de toque adicional
            elevation: 0, // Remove a sombra do botão
            backgroundColor: Colors.transparent, // Define o plano de fundo como transparente
          ),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(
                  imagemPath, // Utilizamos o caminho da imagem fornecido
                ),
                fit: BoxFit.cover, // Ajusta a imagem para cobrir completamente o botão
              ),
              Container(
                color: Colors.black.withOpacity(0.5), // Fundo semitransparente
                child: Center(
                  child: Text(
                    texto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, // Cor do texto
                      fontSize: 20, // Tamanho da fonte do texto
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
