import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Api_view.dart';

import '../../main.dart';

class ApiRead extends StatelessWidget {
  const ApiRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC69749),
          title: Text(
            'API Read',
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
import 'package:flutter/material.dart';
import 'package:tsdc_v2/Widget/Members/Members_api.dart';

class About_card extends StatefulWidget {
  const About_card({
    super.key,
    required this.H,
    required this.N
  });
  final int N;
  final double H;

  @override
  State<About_card> createState() => _About_cardState();
}

class _About_cardState extends State<About_card> {
  late Memebers_api memeber_api;
  late Future<String> name;
  late Future<String> designation;
  late Future<String> phone;
  late Future<String> address;
  late Future<String> imageurl;

  @override
  void initState(){
    memeber_api = Memebers_api(widget.N);
    name=memeber_api.getMemberName();
    phone=memeber_api.getMemberPhone();
    address=memeber_api.getMemberAddress();
    designation=memeber_api.getMemberDesignation();
    imageurl=memeber_api.getMemberImageUrl();


  }
  Widget build(BuildContext context) {
    return Container(
      height: widget.H*0.15,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 20,bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Colors.grey
          ),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [

          ClipRRect(

            child: FutureBuilder<String>(
        future: imageurl,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ');
          } else {
            return Image.network(
              'http://atstesting.in/software/images/member/',
              height: widget.H * 0.1,
              colorBlendMode: BlendMode.color,
            );
          }
        },
      ),
      borderRadius: BorderRadius.circular(10),
    ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.H*0.017,
              ),

              FutureBuilder(
                future: name,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...'); // or some loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ');
                  } else {
                    return Text(
                      snapshot.data as String,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    );
                  }
                },
              ),

              SizedBox(
                height: 2,
              ),
              FutureBuilder(
                future: designation,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...'); // or some loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ');
                  } else {
                    return Text(
                      snapshot.data as String,
                      textAlign: TextAlign.start,

                    );
                  }
                },
              ),

              SizedBox(
                height: 2,
              ),
              FutureBuilder(
                future: phone,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...'); // or some loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ');
                  } else {
                    return Text(
                      snapshot.data as String,
                      textAlign: TextAlign.start,

                    );
                  }
                },
              ),

              SizedBox(
                height: 2,
              ),
              FutureBuilder(
                future: address,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...'); // or some loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ');
                  } else {
                    return Text(
                      snapshot.data as String,
                      textAlign: TextAlign.start,

                    );
                  }
                },
              ),

            ],
          ),

        ],
      ),


    );
  }
}

                  '''
                    // return Text('Error: {snapshot.error}');
                ),
              ),
            ),
          ),
        ),
    );
  }
}
