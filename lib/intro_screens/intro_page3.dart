import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signin.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 390,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40)),
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 130),
                      const Text(
                        "Chào mừng đến với ứng dụng",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Chăm Sóc Thú Cưng",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Icon(
                        Icons.pets,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(SignIn());
                        },
                        child: Text(
                          'Bắt đầu'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue[300]),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Image.asset(
                'assets/anhthuy/images/sc3.jpg',
                height: 390,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
