import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final cityName = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xffF2F2F2),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 18),
              margin: const EdgeInsets.only(bottom: 17),
              child: TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: 'Type city name',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(175, 174, 175, 1),
                  ),
                ),
                cursorColor: const Color.fromRGBO(17, 51, 102, 1),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(36, 40, 45, 1),
                ),
                controller: cityName,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context, cityName.text);
                },
                minSize: 56,
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                color: const Color.fromRGBO(17, 51, 102, 1),
                child: const Text(
                  'Get weather',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
