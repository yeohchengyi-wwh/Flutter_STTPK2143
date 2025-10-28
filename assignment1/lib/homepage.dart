import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //variable
  late double width;
  TextEditingController distanceController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();
  double estimatedCost = 0.0;

  //https://stackoverflow.com/questions/52030797/making-a-dropdown-menu-in-flutter-with-a-map
  String fuelType = 'RON95';
  final Map<String, double> fuelPrices = {
    'RON95': 2.60,
    'RON97': 3.14,
    'Diesel': 2.89,
  };

  String distanceErrorMsg = '';
  String efficiencyErrorMsg = '';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    if (width > 400) {
      width = 400;
    } else {
      width = width;
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Trip Fuel Cost Estimator'),
            SizedBox(width: 10),
            Image.asset("assets/images/fuelIcon.png", height: 32),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter Trip Details'),
              SizedBox(height: 20),
              TextField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Distance (km)",
                  hintText: 'Enter the Distance',
                  prefixIcon: Icon(Icons.roundabout_left),
                  border: OutlineInputBorder(),
                  errorText: distanceErrorMsg.isEmpty ? null : distanceErrorMsg,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: efficiencyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Fuel  Efficiency (km/L)",
                  hintText: 'Enter the Fuel Efficiency',
                  prefixIcon: Icon(Icons.speed),
                  border: OutlineInputBorder(),
                  errorText: efficiencyErrorMsg.isEmpty
                      ? null
                      : efficiencyErrorMsg,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Fuel Type:'),
                        DropdownButton<String>(
                          value: fuelType,
                          items: fuelPrices.keys.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              fuelType = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('FuelPrice (RM/L): '),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            fuelPrices[fuelType]!.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: calculateCost,
                    child: Text('Calculate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      distanceController.clear();
                      efficiencyController.clear();
                      estimatedCost = 0.0;
                      fuelType = 'RON95';
                      setState(() {});
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Result',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 1, 57, 48),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Distance (km):'),
                        Text('${distanceController.text} km'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fuel Efficiency:'),
                        Text('${efficiencyController.text} km/L'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Fuel Type:'), Text('$fuelType')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fuel Price (RM/L):'),
                        Text('RM ${fuelPrices[fuelType]!.toStringAsFixed(2)}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Estimated Fuel Cost:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'RM ${estimatedCost.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateCost() {
    setState(() {
      distanceErrorMsg = '';
      efficiencyErrorMsg = '';
    });//Empty the wrong information

    //https://dart.dev/language/operators
    double? distance = double.tryParse(distanceController.text.trim());
    double? efficiency = double.tryParse(efficiencyController.text.trim());
    double price = fuelPrices[fuelType]!;
    bool error = false;

    if (distance == null) {
      distanceErrorMsg = 'Please Enter A Valid Number';
      error = true;
    }
    if (efficiency == null || efficiency < 0) {
      efficiencyErrorMsg = 'Please Enter A Number greater than 0';
      error = true;
    }
    if (error) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please insert all the curent fields correctly.'),
        ),
      );
      return;
    }

    setState(() {
      estimatedCost = (distance! / efficiency!) * price;
    });
  }
}
