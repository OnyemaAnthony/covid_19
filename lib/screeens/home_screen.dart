import 'dart:convert';

import 'package:covid_19/utilities.dart';
import 'package:covid_19/widgets/most_affect_panel.dart';
import 'package:covid_19/widgets/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map worldData;

  fetchAllData() async {
    var response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));

    if (response.statusCode == 200) {
      setState(() {
        worldData = json.decode(response.body);
      });
    }
  }

  late List countryDate;

  fetchCountryData() async {
    var response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));

    if (response.statusCode == 200) {
      setState(() {
        countryDate = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchAllData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                Utilities.quote,
                style: TextStyle(
                  color: Colors.orange[100],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WorldWide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Regional',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null || worldData.length <= 0
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'most Affected Countries',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10,),
            countryDate == null || countryDate.length <= 0
                ? Container()
                : MostAffectedPanel(
                    countryData: countryDate,
                  ),
          ],
        ),
      ),
    );
  }
}
