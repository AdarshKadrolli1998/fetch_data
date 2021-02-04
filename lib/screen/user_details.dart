import 'package:flutter/material.dart';
import 'package:network_api/model/user_model.dart';
import 'package:network_api/service/user_data.dart';
import 'package:network_api/utills/fetch_data_helper.dart';

class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {

  final dbHelper=DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch data'),
      ),
      body: FutureBuilder<List<Users>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data.map((user) => Card(
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    child: Text("User Details",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Row(
                    children: [
                      Text('Name: '+user.name),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Address: '+user.address.city),
                    ],
                  ),
                  Row(
                    children: [
                      Text('City: '+user.address.city),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Zipcode: '+user.address.zipcode),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Phone: '+user.phone),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Company name: '+user.company.name),
                    ],
                  )
                ],
              ),
            ),
            )
                .toList(),
          );
        },
      ),
    );
  }

//   void _insert() async{
//     Map<String, dynamic> row = {
//
//     };
//     final id = await dbHelper.create(Users());
//     print('inserted row id: $id');
//   }
//
//   void _query() async{
//     final allRows = await dbHelper.queryAllRows();
//     print('query all rows:');
//     // myList = allRows.toList();
//     allRows.forEach((row) => print(row));
//     // print(myList);
//   }
}