import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      body: Text("Conteudo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        // Efeito diferente para arredondar / mudar pontas
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(50),
        // ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),

        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
      ),
      // mini: true,
      // child: Icon(Icons.add),
      // onPressed: () {
      //   print("Resultado: Botão pressionado!");
      // },
      // ),
      // bottomNavigationBar: BottomNavigationBar(items: [],),
      bottomNavigationBar: BottomAppBar(
          // shape: CircularNotchedRectangle(),// recorta o bottomAppBar
          child: Row(
        children: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      )),
    );
  }
}
