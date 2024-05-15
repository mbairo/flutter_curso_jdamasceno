import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _seletorNotificacoes = false;
  bool _seletorImagens = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          SwitchListTile( // *** Só funciona em Column!
            title: Text("Receber notificações? "),
              value: _seletorNotificacoes,
              onChanged: (bool click){
                setState(() {
                  _seletorNotificacoes = click;
                });
              }
          ),
          SwitchListTile( // *** Só funciona em Column!
              title: Text("Carregar imagens automaticamente? "),
              value: _seletorImagens,
              onChanged: (bool click){
                setState(() {
                  _seletorImagens = click;
                });
              }
          ),

          // Text("Receber notificações? "),
          // Switch( // se for utilizar apenas o Switch é bom mudar para Row
          //     value: _seletor,
          //     onChanged: (bool click){
          //       setState(() {
          //       _seletor = click;
          //       });
          //     }
          // ),

          ElevatedButton(
            child: Text("Salvar"),
            onPressed: (){
              if(_seletorNotificacoes) {
                print("Notificações ativada");
              } else {
                print("Notificações não ativas");
              }

              if(_seletorImagens) {
                print("Carregar imagens automaticamente ativada");
              } else {
                print("Não carregar imagens");
              }
            },
          ),
        ],
      ),
    );
  }
}
