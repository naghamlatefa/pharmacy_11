import 'package:rxdart/rxdart.dart';
import 'package:pharmacy_1/addareminder.dart';

class NewEntryBloc {
  BehaviorSubject<int>? _selectedhour$;
  BehaviorSubject<int>? get selecthour => _selectedhour$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay$=> _selectedTimeOfDay$;
  NewEntryBloc(){
    _selectedTimeOfDay$=BehaviorSubject<String>.seeded('none');
    _selectedhour$=BehaviorSubject<int>.seeded(0);

  }
  void dispose(){
    _selectedTimeOfDay$!.close();
    _selectedhour$!.close();
  }
void updatehour(int hour){
    _selectedhour$!.add(hour);
}
void updateTime(String time){
    _selectedTimeOfDay$!.add(time);
}
}