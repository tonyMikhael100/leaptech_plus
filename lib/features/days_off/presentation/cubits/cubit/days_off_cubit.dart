import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'days_off_state.dart';

class DaysOffCubit extends Cubit<DaysOffState> {
  DaysOffCubit() : super(DaysOffInitial());
}
