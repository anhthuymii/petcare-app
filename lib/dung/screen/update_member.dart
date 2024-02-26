
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newlogin/dung/controller/add_controller_member.dart';
import 'package:newlogin/dung/controller/member_controller.dart';
import 'package:newlogin/model/model_member.dart';

class FormUpdatePet extends StatefulWidget {
  final List list;
  final int index;


  FormUpdatePet({Key? key, required this.list, required this.index}) : super(key: key);
  SignUpController signUpController = Get.find();


  @override
  State<FormUpdatePet> createState() => _FormUpdatePetState();

}
class _FormUpdatePetState extends State<FormUpdatePet> {

  update(ProductDataModel productDataModel) async {
    await MemberService().updateMember(productDataModel).then((success) {
      Fluttertoast.showToast(
          msg: "Update thông tin thành công",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue[400],
          textColor: Colors.white,
          fontSize: 16);
    });
  }
  @override
  void initState(){
    super.initState();
    if(widget.index != null){
      //id: widget.list[widget.index]['id'];
      nameText.text = widget.list[widget.index]['name'];
      typeText.text = widget.list[widget.index]['type'];
      breedText.text = widget.list[widget.index]['breed'];
      sexText.text = widget.list[widget.index]['sex'];
      descsText.text = widget.list[widget.index]['descs'];
      ageText.text = widget.list[widget.index]['age'];
      weightText.text = widget.list[widget.index]['weight'];
      imageText.text = widget.list[widget.index]['image'];
    }
  }
  TextEditingController nameText = TextEditingController();
  TextEditingController typeText = TextEditingController();
  TextEditingController breedText = TextEditingController();
  TextEditingController descsText= TextEditingController();
  TextEditingController imageText = TextEditingController();
  TextEditingController sexText= TextEditingController();
  TextEditingController ageText= TextEditingController();
  TextEditingController weightText= TextEditingController();
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  SignUpController signUpController = Get.find();


  Widget build(BuildContext context) {
    //  final items = ['Đực','Cái'];
    MemberService memberService = Get.put(MemberService());
    return Scaffold(
        appBar:AppBar(
          title: const Center(
            child: Text('Update Thông Tin Thú Cưng',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        imagesTextField(context),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text("Update thông tin thú cưng ",style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            )

                        )
                      ],
                    ),
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
                    child: Padding(padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                nameTextField(),
                                const SizedBox(height: 10,),
                                typesTextField(),
                                const SizedBox(height: 10,),
                                const SizedBox(height: 10,),
                                SpeciesTextField(),
                                const SizedBox(height: 10,),
                                sexTextField(),
                                const SizedBox(height: 10,),
                                DesTextField(),
                                const SizedBox(height: 10,),
                                AgeTextField(),
                                const SizedBox(height: 10,),
                                weightTextField(),
                                const SizedBox(height: 10,),
                                Buttomupdate(),
                                const SizedBox(height: 10,),
                              ],
                            ),
                          )
                        ],
                      ),

                    ),

                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
  Widget Buttomupdate(){
    return Container(
      child: InkWell(
        onTap:(){
          if (nameText.text.isEmpty) {
            Fluttertoast.showToast(
                msg: "Hãy nhập thông tin",
                // toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red[400],
                textColor: Colors.white,
                fontSize: 16);
          } else {
            ProductDataModel productDataModel = ProductDataModel(
                id: widget.list[widget.index]['id'],
                name: nameText.text,
                type: typeText.text,
                breed: breedText.text,
                sex:  sexText.text,
                descs: descsText.text,
                age: ageText.text,
                weight: weightText.text,
                image: imageText.text
            );
            update(productDataModel);
          }
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(child: Text(
            "Update",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),

          ),
          ),
        ),
      ),
    );
  }

  Widget imagesTextField(BuildContext context){
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => CircleAvatar(
            radius: 60.0,
            backgroundImage: signUpController.isProfilePicPathSet.value== true?
            FileImage(File(signUpController.profilePicPath.value))
            as ImageProvider
                :const AssetImage('assets/Images/dog.png'),
          )),
          Positioned(
            bottom: 5.0,
            right: 5.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),

                );
              },
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          const Text("Choose Profile Photo",style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera),
                    Text("Camera",style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
                onTap: (){
                  takePhoto(ImageSource.camera);
                },
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image),
                    Text("Gallery",style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                ),
                onTap: (){
                  takePhoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        ],
      ),

    );
  }

  Widget nameTextField(){
    return TextField(
      controller: nameText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Tên thú cưng',
        prefixIcon: Icon(
          Icons.person_pin_circle_sharp,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }

  Widget typesTextField(){
    return TextField(
      controller: typeText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Loài thú cưng',
        prefixIcon: Icon(
          Icons.pets_rounded,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }

  Widget sexTextField(){
    return TextField(
      controller: sexText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Giới tính thú cưng',
        prefixIcon: Icon(
          Icons.person_pin_rounded,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }

  Widget AgeTextField(){
    return TextField(
      controller: ageText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Tuổi thú cưng',
        prefixIcon: Icon(
          Icons.cake_outlined,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }


  Widget SpeciesTextField(){
    return TextField(
      controller: breedText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Loài thú cưng',
        prefixIcon: Icon(
          Icons.pets_outlined,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }

  Widget weightTextField(){
    return TextField(
      controller: weightText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Cân Nặng',
        prefixIcon: Icon(
          Icons.monitor_weight_outlined,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }



  Widget DesTextField(){
    return TextField(
      controller: descsText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Mô tả',
        prefixIcon: Icon(
          Icons.description_outlined,
          color: Colors.blue[300],
          size: 30.0,
        ),
      ),
    );
  }


  // tạo ảnh
  Future<void>takePhoto(ImageSource source) async {
    final pickedImage =
    await imagePicker.pickImage(source: source,imageQuality: 100);
    pickedFile= File(pickedImage!.path);
    signUpController.setProfileImagePath(pickedFile!.path);
    Get.back();
    //print(pickedFile);
  }


}

