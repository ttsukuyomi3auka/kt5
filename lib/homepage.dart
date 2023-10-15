import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kt5/core/network_status.dart';
import 'package:kt5/models/cars.dart';
import 'package:kt5/models/this_car.dart';
import 'package:kt5/widgets/product_information.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://myfakeapi.com/api/cars';
  Dio client = Dio();
  List<Car> cars = [];
  NetworkStatus networkStatus = NetworkStatus.values[0];

  void getNetworkData() async {
    networkStatus = NetworkStatus.loading;
    setState(() {});
    var response = await client.get(url);
    cars = CarData.fromJson(response.data).cars;
    networkStatus = NetworkStatus.success;
    setState(() {});
  }

  @override
  void initState() {
    getNetworkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (networkStatus == NetworkStatus.loading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                    onPressed: getNetworkData,
                    child: const Text(
                      "Обновить",
                    )),
              const SizedBox(height: 20),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    return ProductInformation(car: cars[index], index: index+1,);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
