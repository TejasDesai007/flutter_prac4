import 'package:flutter/material.dart';
import 'navigation_drawer.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:tpo_app/my_details.dart';
import 'package:tpo_app/user_details.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  String? name, email, contact, rollNo;
  String? hscCollege, hscYear, sscCollege, sscYear;
  double? hscTotal, hscOutOf, sscTotal, sscOutOf;
  double? sem1, sem2, sem3, sem4, sem5, cgpa;
  String? additionalCourses;
  File? resumeFile;

  Future<void> pickResume() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'doc']);
    if (result != null) {
      setState(() {
        resumeFile = File(result.files.single.path!);
      });
    }
  }

  Widget buildGradientButton(String text, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPercentageField(String totalLabel, String outOfLabel,
      Function(double) onTotalSave, Function(double) onOutOfSave) {
    return Row(
      children: [
        Expanded(child: _buildNumberField(totalLabel, onTotalSave)),
        SizedBox(width: 10),
        Expanded(child: _buildNumberField(outOfLabel, onOutOfSave)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("Name", (value) => name = value),
              _buildTextField("E-mail", (value) => email = value,
                  keyboardType: TextInputType.emailAddress),
              _buildTextField("Contact", (value) => contact = value,
                  keyboardType: TextInputType.phone),
              _buildTextField("Roll No", (value) => rollNo = value),
              SizedBox(height: 20),
              _buildSectionTitle("HSC Details"),
              _buildTextField("College Name", (value) => hscCollege = value),
              _buildYearDropdown("Year of Passing", (value) => hscYear = value),
              _buildPercentageField("Total Marks", "Out of",
                  (value) => hscTotal = value, (value) => hscOutOf = value),
              SizedBox(height: 20),
              _buildSectionTitle("SSC Details"),
              _buildTextField("College Name", (value) => sscCollege = value),
              _buildYearDropdown("Year of Passing", (value) => sscYear = value),
              _buildPercentageField("Total Marks", "Out of",
                  (value) => sscTotal = value, (value) => sscOutOf = value),
              SizedBox(height: 20),
              _buildSectionTitle("Marks in Semester 1-5"),
              _buildNumberField("Semester 1 CGPA", (value) => sem1 = value),
              _buildNumberField("Semester 2 CGPA", (value) => sem2 = value),
              _buildNumberField("Semester 3 CGPA", (value) => sem3 = value),
              _buildNumberField("Semester 4 CGPA", (value) => sem4 = value),
              _buildNumberField("Semester 5 CGPA", (value) => sem5 = value),
              SizedBox(height: 10),
              _buildTextField(
                "Calculated CGPA (Manual)",
                (value) => cgpa = double.tryParse(value!),
                keyboardType: TextInputType.number,
                enabled: true,
                initialValue: cgpa != null ? cgpa!.toStringAsFixed(2) : '',
              ),
              _buildTextField(
                  "Additional Courses", (value) => additionalCourses = value),
              SizedBox(height: 20),
              buildGradientButton("Upload Resume", pickResume),
              if (resumeFile != null)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Resume Selected: ${resumeFile!.path.split('/').last}"),
                ),
              SizedBox(height: 20),
              buildGradientButton("Submit", () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  UserDetails userDetails = UserDetails(
                    name: name!,
                    email: email!,
                    contact: contact!,
                    rollNo: rollNo!,
                    hscCollege: hscCollege!,
                    hscYear: hscYear!,
                    hscTotal: hscTotal!,
                    hscOutOf: hscOutOf!,
                    sscCollege: sscCollege!,
                    sscYear: sscYear!,
                    sscTotal: sscTotal!,
                    sscOutOf: sscOutOf!,
                    sem1: sem1!,
                    sem2: sem2!,
                    sem3: sem3!,
                    sem4: sem4!,
                    sem5: sem5!,
                    cgpa: cgpa!,
                    additionalCourses: additionalCourses!,
                    resumePath: resumeFile?.path,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyDetails(userDetails: userDetails),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onSave,
      {TextInputType keyboardType = TextInputType.text,
      bool enabled = true,
      String? initialValue}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (value) =>
            value == null || value.isEmpty ? 'Required field' : null,
        onSaved: (value) => onSave(value!),
        enabled: enabled,
        initialValue: initialValue,
      ),
    );
  }

  Widget _buildYearDropdown(String label, Function(String) onSave) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        items: List.generate(10, (index) {
          int year = DateTime.now().year - index;
          return DropdownMenuItem(
              value: year.toString(), child: Text(year.toString()));
        }),
        onChanged: (value) => onSave(value!),
        validator: (value) => value == null ? 'Required field' : null,
      ),
    );
  }

  Widget _buildNumberField(String label, Function(double) onSave) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (value) =>
            (value == null || value.isEmpty || double.tryParse(value) == null)
                ? 'Enter a valid number'
                : null,
        onSaved: (value) => onSave(double.parse(value!)),
      ),
    );
  }
}
