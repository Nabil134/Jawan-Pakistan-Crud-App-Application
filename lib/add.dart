import 'package:contactapp/contact.dart';
import 'package:flutter/material.dart';

class MyAdd extends StatefulWidget {
  @override
  State<MyAdd> createState() => _MyAddState();
}

class _MyAddState extends State<MyAdd> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Add",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => contactspage()));
            },
            icon: Icon(
              Icons.check,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*first portion start here*/
            Text(
              'Name',
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  fillColor: Color(0xffD9D9D9),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ),
              ),
            ),
            /*first portion end here*/
            SizedBox(
              height: 20,
            ),
            /*second portion start here*/
            Text(
              'Surname',
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                controller: surname,
                decoration: InputDecoration(
                  hintText: 'Enter surname',
                  fillColor: Color(0xffD9D9D9),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ),
              ),
            ),
            /*second portion end here*/
            SizedBox(
              height: 20,
            ),
            /*third portion start here*/
            Text(
              'phone Number',
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: '+998  _ _   _ _ _   _ _   _ _',
                  fillColor: Color(0xffD9D9D9),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ),
              ),
            ),
            /*third portion end here*/
          ],
        ),
      ),
    );
  }
}
