import 'package:flutter/material.dart';
import 'package:kt5/models/this_car.dart';

class ProductInformation extends StatelessWidget {
  final Car car;
  final int index;
  const ProductInformation({super.key, required this.car, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 149, 216, 151),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        isThreeLine: true,
        title: Text(car.car),
        subtitle: Text("${car.model} price: ${car.price}"),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward),
          ],
        ),
        leading: Column(
          children: [
            Icon(Icons.star,color: Colors.orange,),
            SizedBox(height: 5),
            Text(index.toString())
          
          ],
        ),
        
        ),
      );
  }
}
