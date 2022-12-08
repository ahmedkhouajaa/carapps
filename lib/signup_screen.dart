import 'package:carriderahmed/home_page.dart';
import 'package:carriderahmed/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final address = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repass = TextEditingController();
  var username, passsword;
  GlobalKey<FormState> redhawk = new GlobalKey<FormState>();

  signup() async {
    var formdata = redhawk.currentState;

    if (formdata!.validate()) {
      formdata.save();
      
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: passsword,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
     
     else {
      print('vvvv');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: redhawk,
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                   color: Colors.black12
                  )
                  ,
                   
                    child: Image.asset('asset/gifs/splash_image.gif')
                    ),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 15),
                  width: double.infinity,
                  child: Text(
                    'WELCOME\nLet\'s Start ',
                    style: TextStyle(
                      fontFamily: 'Bowlby',
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (Value) {
                      username = Value;
                    },
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail Address',
                      suffixIcon: Icon(Icons.mail_outline),
                      floatingLabelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            (BorderSide(width: 1.0, color: Colors.black)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            (BorderSide(width: 1.0, color: Colors.blue)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (Value) {
                      passsword = Value;
                    },
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye),
                      floatingLabelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            (BorderSide(width: 1.0, color: Colors.black)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            (BorderSide(width: 1.0, color: Colors.blue)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ElevatedButton(
                    onPressed: () async  {
                      var usered = await signup();
                      if (usered != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginScreen())));
                      }
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'DelaGothic'),
                    ),
                    style: ElevatedButton.styleFrom(
                        enableFeedback: false,
                        elevation: 20,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void sign() {
    Navigator.pop(context);
  }
}
