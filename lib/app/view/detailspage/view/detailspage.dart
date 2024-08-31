import 'package:flutter/material.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Row(
            children: [
              Icon(Icons.chevron_left_sharp),
              Text('Back'),
            ],
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // width: size.width * 0.9,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Constants.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(Icons.favorite),
                  ),
                ],
              ),
              Constants.height5,
              const Text(
                'data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 18,
                    color: Constants.grey,
                  ),
                  Text(
                    'dsdwdwdw',
                    style: TextStyle(
                      color: Constants.grey,
                    ),
                  ),
                ],
              ),
              Constants.height10,
              const Text(
                  'cbfjhbge efv ehfberu ufb uhyf fdhucbduhcdw cwe cew cweyuwyvubwevweugfbwjhfb sdufdyfdyufsdyuvbsd'),
            ],
          ),
        ),
      ),
    );
  }
}
