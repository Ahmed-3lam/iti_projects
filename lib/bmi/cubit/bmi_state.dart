part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiGenderChanged extends BmiState {}

class BmiHeightChanged extends BmiState {}


class BmiDecrementState extends BmiState {}


class BmiIncrementState extends BmiState {}
