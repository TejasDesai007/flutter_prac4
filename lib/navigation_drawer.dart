import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'registration_form.dart';
import 'company_details.dart';
import 'my_details.dart';
import 'user_details.dart';

class AppDrawer extends StatelessWidget {
  // Renamed from NavigationDrawer to AppDrawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.indigo],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Registration Form'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationForm()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Company Details'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompanyDetails()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('My Details'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyDetails(
                        userDetails: ModalRoute.of(context)!.settings.arguments
                            as UserDetails)),
              );
            },
          ),
        ],
      ),
    );
  }
}
