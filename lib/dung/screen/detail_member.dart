import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;
import 'package:newlogin/dung/controller/member_controller.dart';
import 'package:newlogin/dung/screen/update_member.dart';

class Details extends StatefulWidget {
final List list;
//final int index;

  
  Details({super.key, required this.list,});
  @override
  _DetailsState createState() => _DetailsState();

}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    MemberService controller = Get.put(MemberService());
    return Scaffold(
        appBar:AppBar(
          title: const Center(
            child: Text('Thông Tin Thú Cưng',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body:FutureBuilder(
          future: getContactdata(),
          builder: (context,snapshot){
            if(snapshot.hasError)
              print(snapshot.error);
            return snapshot.hasData ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                 List list = snapshot.data;
                  return SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.maxFinite,
                            height: 270,
                            alignment: Alignment.topCenter,
                            child: Image.asset(list[index]['image']),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 600,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )
                            ),
                            child:Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 30,
                                  ),
                                  child: const Text(
                                    'Thông tin cụ thể',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 220,
                                  width: 390,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                      color:Colors.white,
                                      border:Border.all(
                                        color: Colors.blue,
                                        width: 4,
                                      )

                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Tên: ',
                                              style: (
                                                  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  )
                                              ),
                                            ),
                                            Container( margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 60,
                                            ),
                                              child: Text(list[index]['name'],
                                                style: (
                                                    const TextStyle(
                                                      fontSize: 25,
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Loài: ',
                                              style: (
                                                  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  )
                                              ),
                                            ),
                                            Container( margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 60,
                                            ),
                                              child: Text(
                                                list[index]['type'],
                                                style: (
                                                    const TextStyle(
                                                      fontSize: 20,
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Tuổi: ',
                                              style: (
                                                  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  )
                                              ),
                                            ),
                                            Container( margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 60,
                                            ),
                                              child:Text(
                                                list[index]['age'],
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Cân Nặng: ',
                                              style: (
                                                  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24,
                                                  )
                                              ),
                                            ),
                                            Container( margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 10,
                                            ),
                                              child: Text(
                                                list[index]['weight'],
                                                style: (
                                                    const TextStyle(
                                                      fontSize: 25,
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: const Text(
                                    'Tóm tắt về thú cưng',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 10,
                                  ),

                                  height: 150,
                                  width:380,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: Color(0xFF90CAF9),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      list[index]['descs'],
                                      style: (
                                          const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: (){
                                       // print("Click Chỉnh sửa");
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FormUpdatePet(list: list, index: index),),);
                                          debugPrint('Edit buton clicked');
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: const Center(child: Text(
                                          "Chỉnh Sửa",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              ],

                            ),
                          ),
                        ),

                      ],
                    ),
                  );


                }

            ): const Center(child: CircularProgressIndicator(),);
          },
        )

    );
  }

  Future getContactdata()async{
    var url = 'http://192.168.234.132/login/getdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);

  }


}