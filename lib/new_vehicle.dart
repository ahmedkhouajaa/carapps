import 'package:carriderahmed/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './new_entry.dart';
import './tabs_screen.dart';
import './new_card.dart';

class NewVehicle extends StatefulWidget {
  const NewVehicle({super.key});

  @override
  State<NewVehicle> createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  var ModelName,
      VehicleNumber,
      MobileNumber,
      types,
      NoofSeats,
      prices,
      locations;
  GlobalKey<FormState> redhawk = new GlobalKey<FormState>();
  CollectionReference takenotes =
      FirebaseFirestore.instance.collection("car collection");
  final modelname = TextEditingController();
  final vehiclenumber = TextEditingController();
  final mobilenumber = TextEditingController();
  final type = TextEditingController();
  final price = TextEditingController();
  final seat = TextEditingController();
  final location = TextEditingController();

  addvehicle() {
    Navigator.pushReplacementNamed(context, '/homepage', arguments: {
      'modelname': modelname.text,
      'price': price.text,
      'type': type.text,
      'mobilenumber': mobilenumber.text,
      'seat': seat.text,
      'vehiclenumber': vehiclenumber.text,
      'location': location.text
    });
  }

  vale() async {
    var formdata = redhawk.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("hi");

      await takenotes.add({
        " model": ModelName,
        "VehicleNumber": VehicleNumber,
        "MobileNumber": MobileNumber,
        // "userid": FirebaseAuth.instance.currentUser!.uid,
        "types": types,
        "NoofSeats": NoofSeats,
        "price": prices,
        "locations": locations,
      });

      addvehicle();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        title: Text(
          'Add Vehicle ',
          style: TextStyle(
            fontFamily: 'Bowlby',
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.aspectRatio * 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: redhawk,
        child: SafeArea(
          child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        onSaved: (val) {
                          ModelName = val;
                        },
                        controller: modelname,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Model Name',
                          suffixIcon: Icon(Icons.car_rental_rounded),
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
                        onSaved: (val) {
                          VehicleNumber = val;
                        },
                        controller: vehiclenumber,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Vehicle Number',
                          suffixIcon: Icon(Icons.numbers_rounded),
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
                        onSaved: (val) {
                          MobileNumber = val;
                        },
                        controller: mobilenumber,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          suffixIcon: Icon(Icons.phone_android_rounded),
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
                        onSaved: (val) {
                          types = val;
                        },
                        controller: type,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Type',
                          suffixIcon: Icon(Icons.select_all_sharp),
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
                        onSaved: (val) {
                          NoofSeats = val;
                        },
                        controller: seat,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'No.of Seats',
                          suffixIcon: Icon(Icons.chair),
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
                        onSaved: (val) {
                          prices = val;
                        },
                        controller: price,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          //labelText: 'Price',
                          hintText: 'Price/Day',
                          prefixIcon: Icon(Icons.attach_money),
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
                        onSaved: (val) {
                          locations = val;
                        },
                        controller: location,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Your Location',
                          suffixIcon: Icon(Icons.pin_drop),
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
                        onPressed: () async {
                          await vale();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          'Confirm',
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
              ]),
        ),
      ),
    );
  }
}
