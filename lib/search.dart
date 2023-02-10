import 'package:contactapp/contact.dart';
import 'package:flutter/material.dart';
import 'package:contactapp/Model/contactModel.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  // This list holds the data for the list view
  List foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    foundUsers = contact;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = contact;
    } else {
      results = contact
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => contactspage()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        /*Search TextField start here*/
        title: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            hintText: "Search",
            suffixIcon: const Icon(Icons.search),
            // prefix: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(),
            ),
          ),
        ),
        /*Search TextField end here*/
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: foundUsers.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: foundUsers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [
                              Text(
                                '${foundUsers[index]['name']}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${foundUsers[index]['surname']}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '${foundUsers[index]['phone']}',
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/assets.webp'),
                          ),
                          trailing: foundUsers[index]['icn'],
                        );
                      })
                  : const Text(
                      'No results found Please try with different search',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
