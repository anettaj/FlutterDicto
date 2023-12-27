import 'package:flutter/material.dart';

import '../../main.dart';
import '../Api_view.dart';

class ApiReadCall extends StatelessWidget {
  const ApiReadCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Api Read call api',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Api_view()

                ),
                    (route)=>false
            );
          },
          icon: Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
    '''
    import 'package:http/http.dart';
    import 'dart:convert';

    class Alert_api {
    Alert_api(this.N);

    final N;

    Future getData() async {
    Uri uri = Uri.parse('http://atstesting.in/app/alert.php');
    Response response = await get(uri);
    print(response.body);
    String data = response.body;
    var decodeData = jsonDecode(data);
    return decodeData;

    }

    Future<String> getAlertTitle() async {
    try {
    Map<String, dynamic> decodedData = await getData();
    String description = decodedData["data"][N]["title"];
    return description;
    } catch (e) {
    print('Error fetching Alert Title: ');
    return ''; // Provide a default value or handle the error accordingly
    }
    }

    Future<String> getAlertDescription() async {
    try {
    Map<String, dynamic> decodedData = await getData();
    String description = decodedData["data"][N]["description"];
    return description;
    } catch (e) {
    print('Error fetching FAQ description: ');
    return ''; // Provide a default value or handle the error accordingly
    }
    }

    Future<String> getAlertTime() async {
    try {
    Map<String, dynamic> decodedData = await getData();
    String description = decodedData["data"][N]["dateTime"];
    return description;
    } catch (e) {
    print('Error fetching FAQ description: ');
    return ''; // Provide a default value or handle the error accordingly
    }
    }

    }




    '''
                // print('Error fetching FAQ description:$e ');
              ),
            ),
          ),
        ),
      ),
    );
  }
}
