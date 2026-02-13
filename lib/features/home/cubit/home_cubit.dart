import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>
{
  HomeCubit() : super(HomeInitial());

  int counter = 0;
  int activeIndex = 0;

  void changeActiveIndex(int index)
  {
    activeIndex = index;
    emit(ChangeActiveIndexState());
  }

  void increment()
  {
    counter++;
    emit(IncrementState());
  }

  void decrement()
  {
    counter--;
    emit(DecrementState());
  }

  void reset()
  {
    counter = 0;
    emit(ResetState());
  }
}