import 'package:contactapp/search.dart';
import 'package:flutter/material.dart';
import 'package:contactapp/Model/contactModel.dart';

class contactspage extends StatefulWidget {
  @override
  State<contactspage> createState() => _contactspageState();
}

class _contactspageState extends State<contactspage> {
  TextEditingController nam = TextEditingController();
  TextEditingController surnam = TextEditingController();
  TextEditingController phon = TextEditingController();
  /*
  List contact = [
    {
      'name': 'Name1',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_missed,
        color: Colors.red,
        size: 17,
      ),
    },
    {
      'name': 'Name2',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_made,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name3',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name4',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_missed,
        color: Colors.red,
        size: 17,
      ),
    },
    {
      'name': 'Name5',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name6',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_made,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name7',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_missed,
        color: Colors.red,
        size: 17,
      ),
    },
    {
      'name': 'Name8',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name9',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name10',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_made,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name11',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_missed,
        color: Colors.red,
        size: 17,
      ),
    },
    {
      'name': 'Name12',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_made,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name13',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_missed,
        color: Colors.red,
        size: 17,
      ),
    },
    {
      'name': 'Name14',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name15',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_made,
        color: Colors.green,
        size: 17,
      ),
    },
    {
      'name': 'Name16',
      'surname': 'SurName',
      'phone': '+998  _ _   _ _ _   _ _   _ _',
      'icn': Icon(
        Icons.call_made,
        color: Colors.green,
        size: 17,
      ),
    },
  ];
  */
  addNewContact(context) {
    setState(() {
      Navigator.pop(context);
      contact.add({
        "name": nam.text,
        "surname": surnam.text,
        "phone": phon.text,
      });
      nam.clear();
      surnam.clear();
      phon.clear();
    });
  }

  deleteAllContact(context) {
    setState(() {
      Navigator.pop(context);
      contact.clear();
    });
  }

  sortAllContact(context) {
    setState(() {
      Navigator.pop(context);
      contact.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SearchBarScreen()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              )),
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: GestureDetector(
                        onTap: () {
                          deleteAllContact(context);
                        },
                        child: Text('Delete All'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: GestureDetector(
                        onTap: () {
                          sortAllContact(context);
                        },
                        child: Text('Sort By'),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('Search'),
                    ),
                  ]),
        ],
      ),
      body: ListView.builder(
          itemCount: contact.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Text(
                    '${contact[index]['name']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${contact[index]['surname']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              subtitle: Text(
                '${contact[index]['phone']}',
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/assets.webp'),
              ),
              trailing: contact[index]['icn'],
              // contact[index]['icn'],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Add Contact"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*first portion start here*/
                  Container(
                    child: TextField(
                      controller: nam,
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        fillColor: Color(0xffD9D9D9),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                    ),
                  ),
                  /*first portion end here*/
                  SizedBox(
                    height: 20,
                  ),
                  /*second portion start here*/
                  Container(
                    child: TextField(
                      controller: surnam,
                      decoration: InputDecoration(
                        labelText: 'Enter Surname',
                        fillColor: Color(0xffD9D9D9),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                    ),
                  ),
                  /*second portion end here*/
                  SizedBox(
                    height: 20,
                  ),
                  /*third portion start here*/

                  Container(
                    child: TextField(
                      controller: phon,
                      decoration: InputDecoration(
                        labelText: 'Enter Phone Number',
                        fillColor: Color(0xffD9D9D9),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                    ),
                  ),
                  /*third portion end here*/
                ],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey),
                    )),
                TextButton(
                  onPressed: () {
                    addNewContact(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },
        child: Text(
          '+',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
