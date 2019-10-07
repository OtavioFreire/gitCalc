import 'package:flutter/material.dart';

class Pessoa{

double peso;
double altura;
int genero;
dynamic color;
var resultado;

  Pessoa(double peso, double altura, int genero,String resultado){

      this.altura = altura;
      this.peso = peso;
      this.genero = genero;
      this.resultado = resultado;
  }

  double calcularImc(){


    return peso / (altura * altura);
    
  }

  void verificar(){

    if( genero == 0){
  
      resultado = "IMC = ${calcularImc().toStringAsPrecision(2)}\n";
      if (calcularImc() < 18.6){
        resultado += "Abaixo do peso";
        color = Colors.red[200];}
      else if (calcularImc() < 25.0){
        resultado += "Peso ideal";
        color = Colors.blue[500];}
      else if (calcularImc() < 30.0){
        resultado += "Levemente acima do peso";
        color = Colors.red[100];}
      else if (calcularImc() < 35.0){
        resultado += "Obesidade Grau I";
        color = Colors.red[300];}
      else if (calcularImc() < 40.0){
        resultado += "Obesidade Grau II";
        color = Colors.red[500];}
      else{
        resultado += "Obesidade Grau IIII";
        color = Colors.red[700];}
    }else{

    
        resultado = "IMC = ${calcularImc().toStringAsPrecision(2)}\n";
        if (calcularImc() < 19.1){
          resultado += "Abaixo do peso";
          color = Colors.red[200];}
        else if (calcularImc() < 25.8){
          resultado += "Peso ideal";
          color = Colors.blue[500];}
        else if (calcularImc() < 27.3){
          resultado += "Levemente acima do peso";
           color = Colors.red[100];}
        else if (calcularImc() < 32.3){
          resultado += "Obesidade Grau I";
          color = Colors.red[300];}
        else if (calcularImc() < 35){
          resultado += "Obesidade Grau II";
          color = Colors.red[500];}
        else{
          resultado += "Obesidade Grau III";
           color = Colors.red[700];}
      
  }
  }


}