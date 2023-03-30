import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoImc = '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
         IconButton(icon: Icon(Icons.refresh), onPressed: () {  },)
        ],
      ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculadora de IMC',
              ),
                const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso *',
                  hintText: 'Digite seu Peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))
                  )),
              ),

               const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: controllerAltura,
                decoration: const InputDecoration(
                  labelText: 'Altura *',
                  hintText: 'Digite sua Altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))
                  )),
              ),
              
              const SizedBox(height: 32),
              Text(resultadoImc, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

          const SizedBox( height: 16),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    num numAux = (num.parse(controllerPeso.text) / (num.parse(controllerAltura.text) * 
                  num.parse(controllerAltura.text)));

                  resultadoImc = numAux.toStringAsFixed(2);
                  });

                }, 
                child: const Text('Calcular')),
            )
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            resultadoImc = '';
          });
        },
        
        tooltip: 'Increment',
        child: Text('Limpar'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
