import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/constants/apifct.dart';

import '../constants/cars.dart';

class ApiCars extends StatefulWidget {
  const ApiCars({super.key});

  @override
  State<ApiCars> createState() => _State();
}

class _State extends State<ApiCars> {
  List<Cars> cars = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cars.isEmpty?Center(child: CircularProgressIndicator(),):
      ListView.builder(itemCount: cars.length,itemBuilder: (context,index){
        return Text(cars[index].nome);
      }),
    );
  }

  init() async {
    cars = await getCars();
    setState(() {

    });
  }
}
