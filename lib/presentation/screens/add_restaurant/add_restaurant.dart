import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafr_aldawar_restaurants/presentation/screens/add_restaurant/choose_categories.dart';

import '../../../data/models/branches_model.dart';


class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {

  final _formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  String? _errorMessage;

  bool coverSelected = false;
  bool logoSelected = false;
  bool menuImagesSelected = false;
  bool resImagesSelected = false;
  bool timeSelected = false;
  bool dateSelected = false;
  bool categoriesSelected = false;

  final _titleController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  File coverImage = File('');
  File logoImage = File('');
  List<File> menuImages = [];
  List<File> resImages = [];

  List<Branch> branches = [
    Branch(address: 'احمد عرابي', phoneNumber: '01287654321'),
    Branch(address: 'احمد خميس', phoneNumber: '01125468793'),
  ];
  List<String> features = ['WiFi'];
  List<String> categories = [];



  @override
  void dispose() {
    _titleController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),

                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).shadowColor,),
                ),

                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: size.height * 0.02),

                        Text('Adding Restaurant', style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(height: size.height * 0.01),

                        const Text('please enter the required data', style: TextStyle(fontSize: 15, color: Colors.grey),),
                        SizedBox(height: size.height * 0.05),

                        //title
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            labelText: 'Restaurant Title',
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            prefixIcon: Icon(Icons.restaurant, color: Theme.of(context).primaryColor,),
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) => value == null || value.isEmpty ? 'Please enter Restaurant Title' : null,
                        ),
                        SizedBox(height: size.height * 0.02,),

                        //cover + logo
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.3,
                          child: Stack(
                              children: [
                                InkWell(
                                  onTap: () => getCoverImage(),
                                  child: SizedBox(
                                    width: size.width,
                                    height: size.height * 0.25,
                                    child: Card(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: coverSelected?
                                          Image.file(coverImage,fit: BoxFit.cover,) :
                                          const Icon(Icons.add)
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: InkWell(
                                    onTap: () => getLogoImage(),
                                    child: SizedBox(
                                      width: size.height * 0.1,
                                      height: size.height * 0.1,
                                      child: Card(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: logoSelected?
                                          Image.file(logoImage,fit: BoxFit.cover,) :
                                          const Icon(Icons.add)
                                        ),
                                      )
                                    ),
                                  )
                                )
                              ]
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        //menu image list
                        Center(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                              backgroundColor: Theme.of(context).focusColor,
                              foregroundColor: Theme.of(context).primaryColor,
                            ),
                            icon: const Icon(Icons.add),
                            label: const Text('Select Image from Gallery'),
                            onPressed: () => getMenuImages(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.3,
                          child: menuImages.isEmpty ?
                          const Center(child: Text('Sorry nothing selected!!')) :
                          ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: menuImages.length,
                            separatorBuilder: (ctx, ind) => Padding(padding: EdgeInsets.all(size.height * 0.01),),
                            itemBuilder: (ctx, index) => Center(
                              child: kIsWeb ?
                              Image.network(menuImages[index].path) :
                              Image.file(menuImages[index])),
                            ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        //restaurant images list
                        Center(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                              backgroundColor: Theme.of(context).focusColor,
                              foregroundColor: Theme.of(context).primaryColor,
                            ),
                            icon: const Icon(Icons.add),
                            label: const Text('Select Image from Gallery'),
                            onPressed: () => getResImages(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.3,
                          child: resImages.isEmpty ?
                          const Center(child: Text('Sorry nothing selected!!')) :
                          ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: resImages.length,
                            separatorBuilder: (ctx, ind) => Padding(padding: EdgeInsets.all(size.height * 0.01),),
                            itemBuilder: (ctx, index) => Center(
                                child: kIsWeb ?
                                Image.network(resImages[index].path) :
                                Image.file(resImages[index])),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        //work hours
                        //start + end
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: size.height * 0.08,
                                child: TextFormField(
                                  controller: _startTimeController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) => value == null || value.isEmpty || int.parse(value) > 24 ? 'Please Enter Valid Number' : null,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    prefixIcon: const Icon(Icons.access_time),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                    hintText: 'Start',
                                    hintStyle: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.03),
                            Expanded(
                              child: SizedBox(
                                height: size.height * 0.08,
                                child: TextFormField(
                                  controller: _endTimeController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) => value == null || value.isEmpty || int.parse(value) > 24 ? 'Please Enter Number less than 25': null,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    prefixIcon: const Icon(Icons.access_time),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    hintText: 'end',
                                    hintStyle: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),

                        //branches + features + categories
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                child: SizedBox(
                                    height: size.height * 0.15,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        elevation: 0,
                                        backgroundColor: Theme.of(context).focusColor,
                                        foregroundColor: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Add Branch', textAlign: TextAlign.center,),
                                    )
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                child: SizedBox(
                                    height: size.height * 0.15,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        elevation: 0,
                                        backgroundColor: Theme.of(context).focusColor,
                                        foregroundColor: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Add Features', textAlign: TextAlign.center,),
                                    )
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                child: SizedBox(
                                    height: size.height * 0.15,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        elevation: 0,
                                        backgroundColor: Theme.of(context).focusColor,
                                        foregroundColor: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => const ChooseCategories())
                                        ).then((value) {
                                          if(value != null) categories = value as List<String>;
                                        });
                                      },
                                      child: const Text('Add Categories', textAlign: TextAlign.center,),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),

                        if (_errorMessage != null) Text(_errorMessage!,style: const TextStyle(color: Colors.red)),
                        SizedBox(height: size.height * 0.02),

                        SizedBox(height: size.height * 0.02),
                        //add or cancel
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                                child: SizedBox(
                                    height: size.height * 0.08,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        elevation: 0,
                                        backgroundColor: Theme.of(context).focusColor,
                                        foregroundColor: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    )
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                                child: SizedBox(
                                  height: size.height * 0.08,
                                  child: ElevatedButton(
                                    onPressed: () async{
                                      await uploadRestaurant(context);
                                    },
                                    child: const Text('Add'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future getCoverImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        coverImage = File(pickedFile.path); coverSelected = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nothing is selected')));
      }
    });
  }

  Future getLogoImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        logoImage = File(pickedFile.path); logoSelected = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nothing is selected')));
      }
    });
  }

  Future getMenuImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xFilePick = pickedFile;

    setState(() {
      if (xFilePick.isNotEmpty) {
        for (var i = 0; i < xFilePick.length; i++) {
          menuImages.add(File(xFilePick[i].path));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nothing is selected')));
      }
    },
    );
  }

  Future getResImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xFilePick = pickedFile;

    setState(() {
      if (xFilePick.isNotEmpty) {
        for (var i = 0; i < xFilePick.length; i++) {
          resImages.add(File(xFilePick[i].path));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nothing is selected')));
      }
    },
    );
  }

  FirebaseStorage storage = FirebaseStorage.instance;

  Future uploadRestaurant(BuildContext context) async{

    String title = _titleController.text;

    try {

      //upload cover and get the url
      TaskSnapshot snapshot = await storage.ref().child('Restaurants/$title').putFile(coverImage);
      String coverUrl = await snapshot.ref.getDownloadURL();

      //upload logo and get the url
      snapshot = await storage.ref().child('Restaurants/$title').putFile(logoImage);
      String logoUrl = await snapshot.ref.getDownloadURL();

      //upload menu and get the urls
      List<String> menuImagesList = [];
      String a;
      for(var i in menuImages){
        snapshot = await storage.ref().child('Restaurants/$title/menu').putFile(i);
        a = await snapshot.ref.getDownloadURL();
        menuImagesList.add(a);
      }

      //upload res and get the urls
      List<String> restaurantImagesList = [];
      for(var i in resImages){
        snapshot = await storage.ref().child('Restaurants/$title/res').putFile(i);
        a = await snapshot.ref.getDownloadURL();
        restaurantImagesList.add(a);
      }

      CollectionReference restaurantCollection = FirebaseFirestore.instance.collection('Restaurants');

      Map<String, dynamic> map = {
        "title": title,

        "coverUrl": coverUrl,
        "logoImageUrl": logoUrl,

        "menuImagesList": menuImagesList,
        "restaurantImagesList": restaurantImagesList,

        "lastUpdate": DateTime.now().toIso8601String(),

        "startTime": int.parse(_startTimeController.text),
        "endTime": int.parse(_endTimeController.text),

        "branches": Branch.encode(branches),

        "features": features,
        "categories": categories,

        "views": 0,
        "verified": false,
      };

      // Add the data to Firestore
      await restaurantCollection.add(map);

      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Restaurant added to Firestore successfully')));
      }

    } catch (e) {
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading Restaurant: $e')));
      }
    }

  }
}