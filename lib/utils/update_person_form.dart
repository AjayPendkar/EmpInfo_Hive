import 'package:class1_ui_29_03/models/person.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UpdatePersonForm extends StatefulWidget {
  final int index;
  final Person person;

  const UpdatePersonForm({
    required this.index,
    required this.person,
  });

  @override
  _UpdatePersonFormState createState() => _UpdatePersonFormState();
}

class _UpdatePersonFormState extends State<UpdatePersonForm> {
  final _personFormKey = GlobalKey<FormState>();

  late final _nameController;
  late final _countryController;
  late final _roleController;
  late final _passWordController;
  late final _genderController;
  late final _emailAddressController;
  late final _mobileNumberController;
  late final _panCardController;
  late final _designationController;

  late final Box box;


  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

bool isEmail(String input) => EmailValidator.validate(input);




  

  // Update info of people box
  _updateInfo() {
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

    box.putAt(widget.index, newPerson);

    print('Info updated in box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
    _nameController = TextEditingController(text: widget.person.name);
    _countryController = TextEditingController(text: widget.person.country);
    _roleController = TextEditingController(text: widget.person.role);
    _passWordController = TextEditingController(text: widget.person.passWord);
    _genderController = TextEditingController(text: widget.person.gender);
    _emailAddressController =
        TextEditingController(text: widget.person.emailAddress);
    _mobileNumberController =
        TextEditingController(text: widget.person.mobileNumber);
    _panCardController = TextEditingController(text: widget.person.panCard);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            items: <String>[
              'Executive',
              'Manager',
            ].map((String value) {
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
              border: OutlineInputBorder(
                // <--- this line
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
            items: <String>[
              'Male',
              'Female',
            ].map((String value) {
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
              border: OutlineInputBorder(
                // <--- this line
                borderRadius: BorderRadius.circular(10), // <--- this line
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Text('Email Address'),
          TextFormField(
            controller: _emailAddressController,
            validator:(value) {
    if (!isEmail(_emailAddressController)) {
      return 'Please enter a valid email or phone number.';
    }
    return null;
  },
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
          SizedBox(height: 24.0),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_personFormKey.currentState!.validate()) {
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
