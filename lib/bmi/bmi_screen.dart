import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti_projects/bmi/cubit/bmi_cubit.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  // Function to calculate BMI
  double calculateBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: BlocConsumer<BmiCubit, BmiState>(
        listener: (context, state) {
          if (state is BmiGenderChanged) {
            Get.snackbar("Gender is changed", "Done");
          }
          if (state is BmiHeightChanged) {
            Get.snackbar("Height is changed", "Done");
          }
        },
        builder: (context, state) {
          final cubit = context.read<BmiCubit>();
          return _body(cubit, context);
        },
      ),
    );
  }

  Padding _body(BmiCubit cubit, BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeGender(Gender.male);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: cubit.selectedGender == Gender.male
                                    ? const Color(0xFF1D1E33)
                                    : const Color(0xFF111328),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 80,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'MALE',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeGender(Gender.female);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: cubit.selectedGender == Gender.female
                                    ? const Color(0xFF1D1E33)
                                    : const Color(0xFF111328),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: 80,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'FEMALE',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                cubit.height.toStringAsFixed(0),
                                style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Slider(
                            value: cubit.height,
                            min: 100,
                            max: 220,
                            onChanged: (newValue) {
                              cubit.changeHeight(newValue);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            cubit.weight.toStringAsFixed(0),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  cubit.decrementWeight();
                                },
                                child: const Icon(Icons.remove),
                                mini: true,
                              ),
                              const SizedBox(width: 16.0),
                              FloatingActionButton(
                                onPressed: () {
                                  cubit.incrementWeight();
                                },
                                child: const Icon(Icons.add),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      double bmi = calculateBMI(
                        cubit.height,
                        cubit.weight,
                      );
                      String message;
                      if (bmi < 18.5) {
                        message = 'Underweight';
                      } else if (bmi >= 18.5 && bmi < 24.9) {
                        message = 'Normal';
                      } else if (bmi >= 25 && bmi < 29.9) {
                        message = 'Overweight';
                      } else {
                        message = 'Obese';
                      }

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('BMI Result'),
                            content: Text(
                                'Your BMI is: ${bmi.toStringAsFixed(
                                    2)}\n\nYou are $message.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Calculate BMI'),
                  ),
                ],
              ),
            );
  }
}
