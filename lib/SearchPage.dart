import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'DetailPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController id = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map detail;

  fetchData() async {
    await http.get(Uri.parse(
        "https://611e655b9771bf001785c400.mockapi.io/GST/"+ id.text))
        .then((value) {
          Map result = jsonDecode(value.body);
          setState(() {
            detail = result;
          });

          if(detail.isEmpty || detail == null)
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Not Found',style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold
            ),)));
          else
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detail: detail)));
        });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                            Icons.menu
                        ),
                        onPressed: (){}
                        )
                  ],
                  flexibleSpace: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.green,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select the type of',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'GST Number Search Tool',
                              style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white),
                            ),
                            SizedBox(height: 40,)
                          ]),
                    ),
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 2,
                    tabs: [
                      Tab(text: 'Search GST Number'),
                      Tab(text: 'GST Return Status'),
                    ],
                  ),
                  elevation: 20,
                ),
                body: TabBarView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height *0.01),
                                Text(
                                    'Enter GST number',
                                    style: TextStyle(color: Colors.grey)
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          child: TextFormField(
                                            controller: id,
                                            maxLength: 2,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter GST number';
                                              }
                                              return null;
                                              },
                                            decoration: InputDecoration(
                                              hintText: 'Ex: 3',
                                              border: InputBorder.none,
                                              fillColor: Colors.grey[300],
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.green,
                                  height: 40,
                                  child: TextButton(
                                      onPressed: (){
                                        if (_formKey.currentState.validate()) {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Loading ........',style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold
                                          ),)));
                                          fetchData();
                                        }
                                        },
                                      child: Text('Search',style: TextStyle(color: Colors.white,backgroundColor: Colors.green),)
                                  ),
                                ),
                                SizedBox(height: 50,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text('Internet Should be Connected',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold)),
                                )
                              ]),
                        ),
                      ),
                      Center(child: Text('Comming Soon'))
                    ]),
              ),
            )
        ),
    );
  }
}