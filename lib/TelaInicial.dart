import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _resultado = '';

var imagem;
String textoResult = "";

class TelaIncial extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return TelaInicialState();
  }

}


class TelaInicialState extends State<TelaIncial>{
  String _textoResultado = "IMC: ";
  TextEditingController _controllerPeso = new TextEditingController();
  TextEditingController  _controllerAltura = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora de IMC"),),
      body: Column(
        children: <Widget>[
          criarCampoTexto("Peso (kg):", _controllerPeso), criarCampoTexto("Altura (cm):", _controllerAltura),
          Text(_textoResultado, style: TextStyle(fontSize: 25.0),),
          
         Container(
           height: 50.0, width: 200.0,
           child: ElevatedButton(
              onPressed: (){
                  var peso = double.tryParse(_controllerPeso.text);
                  var altura = double.tryParse(_controllerAltura.text);

                  debugPrint('Peso: $peso');
                  debugPrint('Peso: $altura');

                  if(peso !=null && altura != null){
                    altura = altura /100.0;
                    double _imc = (peso / (altura *altura));
                    setState(() {
                       if (_imc < 18.5) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nAbaixo do Peso";
                        imagem = "img/abaixodopeso.jpg";
                      } else if (_imc >= 18.5 && _imc <= 24.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nPeso Normal";
                        imagem = "img/pesonormal.jpg";
                      } else if (_imc >= 25.0 && _imc <= 29.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nSobrepeso";
                        imagem = "img/sobrepeso.jpg";
                      } else if (_imc >= 30.0 && _imc <= 34.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau l";
                        imagem = "img/obesidadegrau1.png";
                      } else if (_imc >= 35 && _imc <= 39.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau ll";
                        imagem = "img/obesidadegrau2.jpeg";
                      } else if (_imc > 39.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau lll (Mórbida)";
                        imagem = "img/obesidadegrau3.jpeg";
                      }
                    });

                  } else{
                    setState(() {
                      _textoResultado = 'Preencha os campos para IMC';
                    });

                  }

              },

             child: Text("Calcular IMC"),
           ),
         ),
        Container(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: imagem != null ? Image.asset(imagem) : null,
            )
        ],
        
      ),

    );
  }

  TextField criarCampoTexto(String texto, TextEditingController controller) {
    return TextField(
          controller: controller ,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: texto,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              fontSize: 25.0, color: Colors.blue
            )
          ),
        );
  }

}