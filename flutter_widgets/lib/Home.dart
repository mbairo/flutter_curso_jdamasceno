import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _lista = ["Jamilton", "Maria", "João", "Carla"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _lista.length,
            itemBuilder: (context, index) {
              final item = _lista[index];

              // Efeito de arrastar
              return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.delete)],
                    ),
                  ),
                  // direction: DismissDirection.endToStart,
                  
                  onDismissed: (direction) {                    
                    setState(() {
                      _lista.removeAt(index);
                    });
                  },
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  )
                  );
            },
          )),
        ],
      ),
    );
  }
}
