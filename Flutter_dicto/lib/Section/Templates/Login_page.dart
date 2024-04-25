import 'package:flutter/material.dart';

import '../Form_view.dart';
//import 'package:login/auth_controller.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC69749),
        title: const Text(
          'Login page',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Form_view()

                ),
                    (route)=>false
            );
          },
          icon: const Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Form/login.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(

              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hello',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Text('Sign into your account',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                  const Text('Email'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  const Text('Password'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)

                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot your Password?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          //AuthController.instance.register(emailController as String, passwordController);
                        },
                        child: Container(

                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.indigo[900],
                          ),
                          child:const Text('Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
