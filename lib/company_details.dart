import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

class CompanyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            'Company Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List of Companies:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('Tech Companies'),
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Google'),
                    subtitle: Text('Technology, Search Engine'),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Microsoft'),
                    subtitle: Text('Technology, Software'),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Apple'),
                    subtitle: Text('Technology, Consumer Electronics'),
                    isThreeLine: true,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Automobile Companies'),
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Tesla'),
                    subtitle: Text('Electric Cars'),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Toyota'),
                    subtitle: Text('Automobiles, Hybrid Vehicles'),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Ford'),
                    subtitle: Text('Automobiles, Trucks'),
                    isThreeLine: true,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Finance Companies'),
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Goldman Sachs'),
                    subtitle: Text('Investment Banking, Financial Services'),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('JP Morgan Chase'),
                    subtitle: Text('Banking, Financial Services'),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Citibank'),
                    subtitle: Text('Banking, Financial Services'),
                    isThreeLine: true,
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
