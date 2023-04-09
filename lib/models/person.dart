import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country;
    @HiveField(2)
    final String role;

  @HiveField(3)
   final String passWord;

  @HiveField(4)
   final String gender;
    @HiveField(5)
     final String emailAddress;
      @HiveField(6)
       final String mobileNumber;
        @HiveField(7)
         final String panCard;
          @HiveField(8)
           final String designation;
  Person({
    required this.name,
    required this.country,
   required this.role,
   required this.passWord,
   required this.gender,
   required this.emailAddress,
   required this.mobileNumber,
   required this.panCard,
   required this.designation, 
  });
}
