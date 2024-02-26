import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart'as http;


import 'package:get/get.dart';
import 'package:newlogin/dung/controller/member_controller.dart';
import 'package:newlogin/dung/screen/detail_member.dart';
import 'package:newlogin/dung/screen/form_add_member.dart';
import 'package:newlogin/info_user.dart';
import 'package:newlogin/model/model_member.dart';

import 'update_member.dart';







class HomeMemberPet extends StatefulWidget {

  HomeMemberPet({Key? key}) : super(key: key);


  @override
  _HomeMemberPetState createState() => _HomeMemberPetState();
}

class _HomeMemberPetState extends State<HomeMemberPet> {
  MemberService memberService = Get.find();

  @override
  Widget build(BuildContext context) {
    MemberService controller = Get.put(MemberService());
    final List<ProductDataModel> productdata =[];
    return Scaffold(
        appBar: AppBar(

          leading: InkWell(
            onTap: () => Navigator.push(
              context,

              MaterialPageRoute(
                builder: (context) => InfoUser(),
              ),
            ),
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
          title: const Center(
            child: Text('Thông tin thú cưng',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            GestureDetector(
            // onTap: () => Navigator.push(
            //         context,
            //
            //         MaterialPageRoute(
            //           builder: (context) => FormAddPet(list:list,index:index),
            //         ),
            //   ),
              child: const CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/Images/cat.png'),
                //child: Padding(padding: EdgeInsets.all(10),),
              ),

            ),

          ],
        ),
        body:FutureBuilder(
          future: getContactdata(),
          builder: (context,snapshot){
            if(snapshot.hasError)
              print(snapshot.error);
            return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.length == null ? 0: snapshot.data.length,
            itemBuilder: (context,index){
              List list = snapshot.data;
              return SingleChildScrollView(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset("assets/Images/pet.png",
                                height: 200,
                                width: 200,),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xFF90CAF9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )
                          ),
                          child: Padding(padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 15),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Thể Loại",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ),

                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // clik add create form
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,

                                              MaterialPageRoute(
                                                builder: (context) => FormAddPet(),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(

                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  // padding: EdgeInsets.all(5),
                                                  width: 70,
                                                  height: 70,

                                                  child: Image.asset('assets/Images/dog2.png'),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  'Cún',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),

                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,

                                              MaterialPageRoute(
                                                builder: (context) => FormAddPet(),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(

                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  // padding: EdgeInsets.all(5),
                                                  width: 70,
                                                  height: 70,

                                                  child: Image.asset('assets/Images/cat2.png'),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  'Mèo',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),

                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,

                                              MaterialPageRoute(
                                                builder: (context) => FormAddPet(),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(

                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  // padding: EdgeInsets.all(5),
                                                  width: 70,
                                                  height: 70,

                                                  child: Image.asset('assets/Images/mouse.jpg'),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  'Chuột',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),

                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,

                                              MaterialPageRoute(
                                                builder: (context) => FormAddPet(),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(

                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  // padding: EdgeInsets.all(5),
                                                  width: 70,
                                                  height: 70,

                                                  child: Image.asset('assets/Images/thỏ.jpg'),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  'Thỏ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),

                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),


                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Thú cưng của tôi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 400,
                                  width: 400,
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                     itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        // clik image
                                        MaterialPageRoute(
                                          builder: (context) =>Details(
                                            list: list,
                                           // index : index,
                                          ),
                                        ),
                                      ),
                                      // Xóa và sửa
                                      child: Slidable(
                                       // key: Key(controller. as String),
                                        startActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FormUpdatePet(list: list, index: index),),);
                                                debugPrint('Edit buton clicked');
                                              },
                                              backgroundColor: Colors.teal,
                                              icon: Icons.edit,
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {

                                                setState(() {
                                                 var  url ='http://192.168.234.132/login/delete.php';
                                                  http.post(Uri.parse(url),body:{
                                                    'id':list[index]['id'],
                                                  });
                                                });
                                              },
                                              backgroundColor: Colors.red,
                                              icon: Icons.delete,
                                            ),
                                          ],
                                        ),
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FormUpdatePet(list: list, index: index),),);
                                                debugPrint('Edit buton clicked');
                                              },
                                              backgroundColor: Colors.teal,
                                              icon: Icons.edit,
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {

                                                setState(() {
                                                  var  url ='http://192.168.234.132/login/delete.php';
                                                  http.post(Uri.parse(url),body:{
                                                    'id':list[index]['id'],
                                                  });
                                                });
                                              },
                                              backgroundColor: Colors.red,
                                              icon: Icons.delete,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          width: 300,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: (Colors.white),
                                          ),
                                          child: Column(children: [
                                            ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              child: Image.asset( list [index]['image']),
                                            ),
                                            const SizedBox(height: 10),

                                            Text(
                                              list [index]['name'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                          ),

                                        ),
                                      ),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

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