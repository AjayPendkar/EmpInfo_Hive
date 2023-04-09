import 'package:class1_ui_29_03/models/person.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({Key? key}) : super(key: key);

  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  
  final _personFormKey = GlobalKey<FormState>();



    TextEditingController _roleController =TextEditingController();
    TextEditingController _passWordController=TextEditingController();
    TextEditingController _genderController=TextEditingController();
    TextEditingController _emailAddressController=TextEditingController();
    TextEditingController _mobileNumberController=TextEditingController();
    TextEditingController _panCardController=TextEditingController();
    TextEditingController _designationController=TextEditingController();



  late final Box box;

   final List<String> _dropdownValues = [
    "Executive",

    "Manager"
  ]; 

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  // Add info to people box
  _addInfo() async {
    Person newPerson = Person(
      name: _nameController.text,
      country: _countryController.text,
       role: _roleController.text,
      passWord: _passWordController.text,
      gender: _genderController.text,
      emailAddress: _emailAddressController.text,

      mobileNumber: _mobileNumberController.text,
      panCard: _panCardController.text,
      designation: _designationController.text,
    );

    box.add(newPerson);
    print('Info added to box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFormKey,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Home Country'),
          TextFormField(
            controller: _countryController,
            validator: _fieldValidator,
          ),
            SizedBox(height: 24.0),
          Text('Role'),
        
        DropdownButtonFormField<String>(
      isExpanded: true,
      items:  <String>['Executive', 'Manager',].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
      
      onChanged: (value) {
_roleController.text = value.toString();

print("Role name + ${_roleController.toString()}");
      },
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 40, right: 40, bottom: 15, top: 15),
        labelText: "Sub Category",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder( // <--- this line
          borderRadius: BorderRadius.circular(10), // <--- this line
        ),
      ),
    ),

         
         
         
            SizedBox(height: 24.0),
          Text('PassWord'),
          TextFormField(
            obscureText: true,
enableSuggestions: false,
autocorrect: false,
            controller: _passWordController,
            validator: _fieldValidator,
          ),



            SizedBox(height: 24.0),
          DropdownButtonFormField<String>(
      isExpanded: true,
      items:  <String>['Male', 'Female',].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
      
      onChanged: (value) {
_genderController.text = value.toString();

print("Role name + ${_genderController.toString()}");
      },
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 40, right: 40, bottom: 15, top: 15),
        labelText: "Gender",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder( // <--- this line
          borderRadius: BorderRadius.circular(10), // <--- this line
        ),
      ),
    ),
      
      
            SizedBox(height: 24.0),
          Text('Email Address'),
          TextFormField(
            controller: _emailAddressController,
            validator: _fieldValidator,
          ),
            SizedBox(height: 24.0),
          Text('Mobile Number'),
       
       
       
          TextFormField(
            controller: _mobileNumberController,
            validator: _fieldValidator,
            keyboardType: TextInputType.number,
            
          ),
                      SizedBox(height: 24.0),
        
        
        
          Text('Pan Number'),
          TextFormField(
            controller: _panCardController,
            validator: _fieldValidator,
            
          ),
   SizedBox(height: 24.0),

               Text('Designation'),
          TextFormField(
            controller: _roleController,
            validator: _fieldValidator,
            
          ),











    SizedBox(height: 24.0),
          
          Spacer(),
           Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_personFormKey.currentState!.validate()) {
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
