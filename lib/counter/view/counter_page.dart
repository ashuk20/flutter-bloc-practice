import 'package:bloc_practice/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => TextShowCubit()),
        BlocProvider(create: (_) => AdditionCubit()),
        BlocProvider(create: (_) => SubtractionCubit()),
      ],
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    TextEditingController num1 = TextEditingController();
    TextEditingController num2 = TextEditingController();

    TextEditingController num3 = TextEditingController();
    TextEditingController num4 = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Counter - cubit")),
      body: Center(
        child: Column(
          children: [
            // BlocBuilder<CounterCubit, int>(
            //   builder: (context, count) {
            //     return Text("$count", style: const TextStyle(fontSize: 60));
            //   },
            // ),

            // BlocBuilder<TextShowCubit, String>(
            //   builder: (context, text) {
            //     return Text(text.isEmpty ? "noting to show," : "hello...$text");
            //   },
            // ),
            // TextField(
            //   controller: controller,
            //   decoration: const InputDecoration(labelText: 'Enter your name'),
            // ),

            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       context.read<TextShowCubit>().showText(controller.text);
            //     },
            //     child: const Text("show text"),
            //   ),
            // ),
            TextField(
              controller: num1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Number",
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 10),
            TextField(
              controller: num2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Number",
              ),
            ),
            SizedBox(height: 10),
            BlocBuilder<AdditionCubit, int>(
              builder: (context, sum) {
                return Text("Sum of Two Numbers:  ${sum}");
              },
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AdditionCubit>().addition(
                    int.parse(num1.text),
                    int.parse(num2.text),
                  );
                },
                child: Text("Sum"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AdditionCubit>().reset();
                  num1.clear();
                  num2.clear();
                },
                child: Text('Reset'),
              ),
            ),

            TextField(
              controller: num3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Number',
              ),
            ),
            TextField(
              controller: num4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Number',
              ),
            ),

            BlocBuilder<SubtractionCubit, int>(
              builder: (context, sub) {
                return Text("SubTraction of your Numbers: ${sub}");
              },
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SubtractionCubit>().subtract(
                    int.parse(num3.text),
                    int.parse(num4.text),
                  );
                },
                child: Text("Subtraction"),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => context.read<CounterCubit>().increment(),
      //       child: const Icon(Icons.add),
      //     ),
      //     const SizedBox(height: 10),
      //     FloatingActionButton(
      //       onPressed: () => context.read<CounterCubit>().decrement(),
      //       child: const Icon(Icons.remove),
      //     ),
      //     const SizedBox(height: 10),
      //     FloatingActionButton(
      //       onPressed: () => context.read<CounterCubit>().reset(),
      //       child: const Icon(Icons.refresh),
      //     ),
      //   ],
      // ),
    );
  }
}

class AdditonView extends StatelessWidget {
  const AdditonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
