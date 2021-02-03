import 'package:flutter/material.dart';
import 'package:network_api/model/user_model.dart';
import 'package:network_api/service/user_data.dart';

class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {
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
}