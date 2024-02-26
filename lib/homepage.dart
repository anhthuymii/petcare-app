import 'dart:convert';

import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import 'info_user.dart';
import 'signin.dart';
import 'style/button.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> contactData;

  @override
  void initState() {
    super.initState();
    contactData = getContactData();
  }

  Future<List<dynamic>> getContactData() async {
    var url = 'http://192.168.234.56/login/view.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90CAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        title: const Text(
          'Chăm sóc thú cưng',
          style: TextStyle(
            fontSize: 28,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 60,
            child: FutureBuilder<List<dynamic>>(
              future: getContactData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    List<dynamic> list = snapshot.data!;
                    return GestureDetector(
                      onTap: () {
                        Get.to(const InfoUser());
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Text(
                              list[index]['username']
                                  .toString()
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
                    : const SizedBox();
              },
            ),
          ),
        ],
      ),
      body: const Body(),
      drawer: Drawer(
        child: FutureBuilder<List<dynamic>>(
          future: getContactData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    snapshot.data![0]['username'],
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text(
                    snapshot.data![0]['email'],
                    style: TextStyle(fontSize: 16),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Text(
                      snapshot.data![0]['username']
                          .toString()
                          .substring(0, 1)
                          .toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Trang chủ',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(
                    Icons.home,
                    size: 30,
                    color: Color(0xFF42A5F5),
                  ),
                  onTap: () {
                    Get.to(const HomePage());
                  },
                ),
                const ListTile(
                  title: Text(
                    'Thông tin thú cưng',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(
                    Icons.dashboard,
                    size: 30,
                    color: Color(0xFF42A5F5),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Nhắc nhở chăm sóc',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Color(0xFF42A5F5),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Lịch sử chăm sóc',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: Color(0xFF42A5F5),
                  ),
                ),
                const Divider(
                  color: Color(0xFF1976D2),
                ),
                ListTile(
                  title: const Text(
                    'Đăng xuất',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    size: 30,
                    color: Color(0xFF42A5F5),
                  ),
                  onTap: () {
                    // logout();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn()));
                  },
                ),
              ],
            )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}

class SeeAll extends StatelessWidget {
  final icon;
  final String TitleName;
  final String subTitleName;

  const SeeAll({
    Key? key,
    this.icon,
    required this.TitleName,
    required this.subTitleName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF64B5F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 60,
                height: 60,
                color: Colors.white,
                child: Icon(
                  icon,
                  size: 40,
                  color: Color(0xFF64B5F6),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TitleName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        subTitleName,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )),
            const Icon(
              Icons.navigate_next,
              size: 35,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
          ),
          HomeBanner(size: size),
          const SizedBox(height: 5.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Thể loại',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image(
                            image: AssetImage("assets/anhthuy/images/dog.jpg"),
                            height: 70,
                            width: 70),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Cún',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image(
                            image: AssetImage("assets/anhthuy/images/cat.png"),
                            height: 70,
                            width: 70),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mèo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image(
                            image: AssetImage("assets/anhthuy/images/hamster.jpg"),
                            height: 70,
                            width: 70),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Chuột',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image(
                            image: AssetImage("assets/anhthuy/images/rabbit.jpg"),
                            height: 70,
                            width: 70),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Thỏ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        children:  [
                          InkWell(
                            onTap: () {
                              Get.toNamed('/pet_care_notification');
                            },
                            child: const SeeAll(
                              icon: Icons.favorite,
                              TitleName: 'Nhắc nhở chăm sóc',
                              subTitleName:
                              'Cho thú cưng ăn vào khoảng thời gian nhất định',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(InfoUser());
                            },
                            child: const SeeAll(
                              icon: Icons.person,
                              TitleName: 'Thông tin thành viên',
                              subTitleName:
                              'Cập nhật thông tin của bản thân và thú cưng của bạn',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                           //   Get.to(const LogHomePage());
                            },
                            child: const SeeAll(
                              icon: Icons.calendar_today,
                              TitleName: 'Lịch sử chăm sóc',
                              subTitleName:
                              'Xem lịch sử tránh sai sót khi chăm sóc thú cưng',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/anhthuy/images/home2.JPG',
              width: 180,
              height: 200,
            ),
          ),
          Expanded(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5, right: 10),
                  child: Column(
                    children: [
                      const Text('Nơi chăm sóc thú cưng đáng tin cậy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                              color: Color(0xFF64B5F6))),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        style: buttonPrimary,
                        onPressed: () {},
                        child: Text(
                          'Tại đây',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
