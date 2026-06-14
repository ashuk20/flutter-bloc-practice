import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 5);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}

class TextShowCubit extends Cubit<String> {
  TextShowCubit() : super('');

  void showText(String text) => emit(text);
  void clearText()=> emit('');
}


class AdditionCubit extends Cubit<int>{
  AdditionCubit():super(0);

  void addition(int num1,int num2)=>emit(num1+num2);
  void reset()=>emit(0);

}

class SubtractionCubit extends Cubit<int>{
  SubtractionCubit():super(0);

  void subtract(int num3,int num4)=> emit(num3-num4);

}