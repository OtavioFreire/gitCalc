import 'package:calculadora_imc/pessoa.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 var pessoa = Pessoa(0,0,3,"");
  
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  String _result;
  var _radio1;
  var color;
  
  @override
  void initState() {
    super.initState();
    resetFields();
  }
  
  

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      
      _result = 'Informe seus dados';
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0), child: buildForm()));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Calculadora de IMC'),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            resetFields();
          },
        )
      ],
    );
  }

  


  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
              label: "Peso (kg)",
              error: "Insira seu peso!",
              controller: _weightController),
          buildTextFormField(
              label: "Altura (cm)",
              error: "Insira uma altura!",
              controller: _heightController),
          Row(mainAxisAlignment: MainAxisAlignment.center, //
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radio1,
                  onChanged: (value) {
                    setState(() {
                      _radio1 = value;
                    });
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(top: 36.0),
                    child: Container(
                      
                    ),


                ),
                new Text("Homem", style: new TextStyle(fontSize: 16.0)),

                new Radio(
                  value: 1,
                  groupValue: _radio1,
                  onChanged: (value) {
                    setState(() {
                      _radio1 = value;
                    });
                  },
                ),
                new Text("Mulher", style: new TextStyle(fontSize: 16.0))
              ]),
          buildTextResult(),
          buildCalculateButton(),

        ],
      ),
    );
  }



  void calculateImc() {
     if(_radio1 > 1){
        _result = "ESCOLHA O SEXO";
        }else{
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100.0;

    pessoa = Pessoa(weight, height, _radio1,"");
   
  setState((){
     
      pessoa.verificar();
      _result = pessoa.resultado;
      color = pessoa.color;
       
    });
    }
  
  }



  Widget buildCalculateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            calculateImc();
          }
        },
        child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
        style:TextStyle(color: color)
       
      ),
    );
  }

  Widget buildTextFormField(
      {TextEditingController controller, String error, String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (text) {
        return text.isEmpty ? error : null;
      },
    );
  }
}