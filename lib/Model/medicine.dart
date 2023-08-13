class Medicine{
  final List<dynamic>? notificationIDs;
  final String? medicineName;
  final int? hour;
  final String? startTime;
  Medicine({
    this.notificationIDs,
    this.medicineName,
    this.startTime,
    this.hour
});
  String get getName=>medicineName!;
  int get getHour=>hour!;
  String get getstartTime=>startTime!;
 List<dynamic> get getIDs=>notificationIDs!;
 Map<String,dynamic> toJson(){
   return{
     'ids':notificationIDs,
     'name':medicineName,
     'hour':hour,
     'start':startTime
   };
 }
factory Medicine.fromJson(Map<String,dynamic> parsedJson){
   return Medicine(
     notificationIDs: parsedJson['ids'],
     medicineName: parsedJson['name'],
     hour: parsedJson['hour'],
     startTime: parsedJson['start']

   );
}
}