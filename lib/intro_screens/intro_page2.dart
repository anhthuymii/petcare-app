import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Center(
                      child: Image.asset(
                        "assets/anhthuy/images/screen2.jpg",
                        height: 360,
                        width: 400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFF90CAF9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        // topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Icon(
                          Icons.pets,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Hãy cùng khám phá các tính năng và lợi ích của ứng dụng chăm sóc thú cưng của chúng tôi.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 20),
                        const Text(
                          "Ứng dụng PetCare cung cấp cho chủ nuôi thú cưng một loạt các tính năng hữu ích để giúp mọi người chăm sóc và nuôi dưỡng thú cưng của mình một cách tốt nhất.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
