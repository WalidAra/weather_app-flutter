import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../classes/class.dart';
import '../service/api.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherData? weatherData;
  PageColors p_colors = PageColors();

  void change() {
    setState(() {
      p_colors.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final jsonData = await fetchAPI();
      setState(() {
        weatherData = weatherDataFromJson(jsonData);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: p_colors.cone,
        toolbarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
        leading: IconButton(
          color: p_colors.ctwo,
          iconSize: 40,
          onPressed: () => change(), // Removed parentheses
          icon: Icon(Icons.more_vert_rounded),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: p_colors.cone,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Text(
                    weatherData?.country ?? '',
                    style: TextStyle(
                        color: p_colors.ctwo,
                        fontSize: 30,
                        fontFamily: "MonomaniacOne"),
                  ),
                  Text(
                    formattedDate.toUpperCase(),
                    style: TextStyle(
                        color: p_colors.ctwo,
                        fontSize: 30,
                        fontFamily: "MonomaniacOne"),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Icon(
                Icons.nightlight_round_sharp,
                color: p_colors.ctwo,
                size: 150,
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    '${((weatherData?.temp ?? 0) - 273.15).toStringAsFixed(2)} °C',
                    style: TextStyle(
                      fontSize: 40,
                      color: p_colors.ctwo,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Opacity(
                      opacity:
                          0.8, // Set the desired opacity value between 0.0 and 1.0
                      child: Text(
                        "GOOD NIGHT WALID",
                        style: TextStyle(
                          fontSize: 20,
                          color: p_colors.ctwo,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 70,
              child: Divider(
                height: 100,
                color: p_colors.ctwo,
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.adjust, size: 28, color: p_colors.ctwo),
                        Text(
                          'PRESSURE',
                          style: TextStyle(color: p_colors.ctwo),
                        ),
                        Text(
                          weatherData?.pressure.toString() ?? '',
                          style: TextStyle(color: p_colors.ctwo),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            width: 1.0,
                            color: p_colors.ctwo,
                          ), // Add left border
                          right: BorderSide(
                            width: 1.0,
                            color: p_colors.ctwo,
                          ), // Add right border
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.air, size: 28, color: p_colors.ctwo),
                          Text(
                            'WIND',
                            style: TextStyle(color: p_colors.ctwo),
                          ),
                          Text(
                            weatherData?.windDeg.toString() ?? '',
                            style: TextStyle(color: p_colors.ctwo),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          size: 28,
                          color: p_colors.ctwo,
                        ),
                        Text(
                          'HUMIDITY',
                          style: TextStyle(color: p_colors.ctwo),
                        ),
                        Text(
                          weatherData?.humidity.toString() ?? '',
                          style: TextStyle(color: p_colors.ctwo),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
