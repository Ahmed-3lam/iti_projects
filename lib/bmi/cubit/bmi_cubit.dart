import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'bmi_state.dart';


class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  Gender selectedGender = Gender.male;
  double height = 160;
  double weight = 60;

  void changeGender(Gender gender) {
    if (gender == Gender.male) {
      selectedGender = Gender.male;
    } else {
      selectedGender = Gender.female;
    }
    emit(BmiGenderChanged());
  }

  void changeHeight(double newValue) {
    height = newValue;
    emit(BmiHeightChanged());
  }

  void decrementWeight(){
    weight--;
    emit(BmiDecrementState());
  }

  void incrementWeight(){
    weight++;
    emit(BmiIncrementState());
  }

}

enum Gender {
  male,
  female,
}
