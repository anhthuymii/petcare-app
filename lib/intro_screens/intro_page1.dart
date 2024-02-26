import 'package:flutter/material.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Image.asset(
              'assets/anhthuy/images/login.png',
              height: 250,
            ),
            Text(
              'Chăm sóc thú cưng'.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: Colors.lightBlue[900]),
            ),
            const SizedBox(height: 15),
            Text(
              'Nơi chăm sóc đáng tin cậy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue[700]),
            ),
            Expanded(
              child: Stack(
                children: [
                  // SizedBox(height: 10),
                  Positioned(
                    child: Transform.translate(
                      offset:
                          Offset(0.0, MediaQuery.of(context).size.width) / 1.2,
                      child: Transform.scale(
                        scale: 2.5,
                        child: Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 110, left: 15, right: 15),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.pets,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Nơi dành cho thú cưng của bạn, \n Nơi để cùng chăm sóc thú cưng. ',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
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
