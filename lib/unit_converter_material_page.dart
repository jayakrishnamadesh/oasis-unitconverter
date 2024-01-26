import 'package:flutter/material.dart';

class UnitConverterMaterialPage extends StatefulWidget {
  const UnitConverterMaterialPage({Key? key}) : super(key: key);

  @override
  State<UnitConverterMaterialPage> createState() =>
      _UnitConverterMaterialPageState();
}

class _UnitConverterMaterialPageState
    extends State<UnitConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController =
      TextEditingController();
  String selectedValue = 'Centimeters to Meters';
  List<String> dropdownItems = [
    'Centimeters to Meters',
    'Grams to Kilograms',
    'Meters to Centimeters',
    'Kilograms to grams'
  ];

  void convert() {
    if (selectedValue == 'Centimeters to Meters') {
      result = double.parse(textEditingController.text) / 100;
      setState(() {});
    }

    else if  (selectedValue == 'Grams to Kilograms') {
      result = double.parse(textEditingController.text) / 1000;
      setState(() {});
    }

    else if (selectedValue == 'Meters to Centimeters') {
      result = double.parse(textEditingController.text) * 100 ;
      setState(() {});
  }

  else if (selectedValue == 'Kilograms to grams') {
      result = double.parse(textEditingController.text) * 1000 ;
      setState(() {});}
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    print('rebuilt');

    final border = OutlineInputBorder(
      borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('CURRENCY CONVERTER'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the Value',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedValue,
                items: dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                  print(selectedValue);
                },
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: convert,
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.black),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.white),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text('CONVERT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UnitConverterMaterialPage(),
  )
  );
}
  