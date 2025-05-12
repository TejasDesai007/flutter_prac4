import 'package:flutter/material.dart';
import 'navigation_drawer.dart';
import 'user_details.dart';
import 'package:open_file/open_file.dart';

class MyDetails extends StatelessWidget {
  final UserDetails userDetails;

  MyDetails({required this.userDetails});

  @override
  Widget build(BuildContext context) {
    // Check if essential fields are empty to determine if the user is registered
    bool isRegistered = userDetails.name.isNotEmpty &&
        userDetails.email.isNotEmpty &&
        userDetails.contact.isNotEmpty;
    if (userDetails == null) {
      return Scaffold(
        appBar: AppBar(title: Text("My Details")),
        body: Center(
            child: Text("User is not registered. Please register first.")),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.indigo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            'My Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // If the user is not registered, show a message and a button to redirect to the registration form
            if (!isRegistered)
              Column(
                children: [
                  Text(
                    'You are not registered yet. Please register first.',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the registration form
                      Navigator.pushNamed(context,
                          '/registration'); // Assuming the registration route is '/registration'
                    },
                    child: Text("Go to Registration Form"),
                  ),
                ],
              )
            else
              // If the user is registered, show the details in a DataTable
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTable(
                    columns: [
                      DataColumn(
                          label: Text("Field",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text("Details",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("Name")),
                        DataCell(Text(userDetails.name))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Email")),
                        DataCell(Text(userDetails.email))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Contact")),
                        DataCell(Text(userDetails.contact))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Roll No")),
                        DataCell(Text(userDetails.rollNo))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("HSC College")),
                        DataCell(Text(userDetails.hscCollege))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("HSC Year")),
                        DataCell(Text(userDetails.hscYear))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("HSC Marks")),
                        DataCell(Text(
                            "${userDetails.hscTotal} / ${userDetails.hscOutOf}"))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("SSC College")),
                        DataCell(Text(userDetails.sscCollege))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("SSC Year")),
                        DataCell(Text(userDetails.sscYear))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("SSC Marks")),
                        DataCell(Text(
                            "${userDetails.sscTotal} / ${userDetails.sscOutOf}"))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Semester 1")),
                        DataCell(Text(userDetails.sem1.toString()))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Semester 2")),
                        DataCell(Text(userDetails.sem2.toString()))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Semester 3")),
                        DataCell(Text(userDetails.sem3.toString()))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Semester 4")),
                        DataCell(Text(userDetails.sem4.toString()))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Semester 5")),
                        DataCell(Text(userDetails.sem5.toString()))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("CGPA")),
                        DataCell(Text(userDetails.cgpa.toStringAsFixed(2)))
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Additional Courses")),
                        DataCell(Text(userDetails.additionalCourses))
                      ]),
                    ],
                  ),
                  if (userDetails.resumePath != null)
                    Center(
                      child: ElevatedButton(
                        onPressed: () => OpenFile.open(userDetails.resumePath),
                        child: Text("View Resume"),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
