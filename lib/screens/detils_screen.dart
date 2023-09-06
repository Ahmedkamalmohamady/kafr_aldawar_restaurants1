import 'package:flutter/material.dart';

import '../widgets/details_screen_widgets.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  Color orangeColor = const Color(0xffEF9E28);
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Color(0xffF4F5F7),
        body: Column(children: [
          Stack(
            children: [
              SizedBox(
                width: width,
                height: (380 / 923) * height,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                child: CustomNetworkImage(
                    imageUrl:
                    'https://scontent-lax3-2.xx.fbcdn.net/v/t39.30808-6/306097180_406548858289783_8439672170480249772_n.png?_nc_cat=101&ccb=1-7&_nc_sid=52f669&_nc_ohc=Yuk-jaNI7ZAAX-S8-69&_nc_ht=scontent-lax3-2.xx&oh=00_AfAl6GT4xznCKilwk7cdTMaejYvH9jWKqlHSUNcvXxJN7g&oe=64F8919F',
                    height: height,
                    orangeColor: orangeColor),
              ),
              Positioned(
                top: 190,
                left: 100,
                right: 100,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white10,
                  child: ClipOval(
                    child: CustomNetworkImage(
                        orangeColor: orangeColor,
                        imageUrl:
                        'https://scontent-lax3-1.xx.fbcdn.net/v/t39.30808-6/306956689_406548861623116_8188228039607414689_n.png?_nc_cat=104&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=z7H5J9N4gD0AX83CXiO&_nc_ht=scontent-lax3-1.xx&oh=00_AfAFB88RJ6zy4qqzsSddoFJuI9qepYYTViZg16k1tvVPTQ&oe=64F8917C'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'CHUNKY - تشانكي',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          CustomButtonTapBar(
              tabController: _tabController,
              orangeColor: orangeColor,
              width: width),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ///اول حاجه خاصه بالمنيو
                ///الصور محتاجه ترجع فى ليست برضو والهيرو دى عاوزه تتظبط فى الصفحة اللى بيتعرض فيها الصوره كامله
                PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Spacer(flex: 2),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    imageUrl:
                                    'https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-6/329126097_1556236998213901_9082040199403998335_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=37c68a&_nc_ohc=Bv3pOkK7-SwAX-XQPHk&_nc_ht=scontent.fcai19-5.fna&oh=00_AfAkn9C9Owqi8sa21BiO6qronj45JpefbjV1LAx10Cfblg&oe=64FA9784',
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    transitionOnUserGestures: true,
                                    tag: 'image1',
                                    child: CustomNetworkImage(
                                      orangeColor: orangeColor,
                                      imageUrl:
                                      'https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-6/329126097_1556236998213901_9082040199403998335_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=37c68a&_nc_ohc=Bv3pOkK7-SwAX-XQPHk&_nc_ht=scontent.fcai19-5.fna&oh=00_AfAkn9C9Owqi8sa21BiO6qronj45JpefbjV1LAx10Cfblg&oe=64FA9784',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(flex: 1),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    imageUrl:
                                    'https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-6/329126097_1556236998213901_9082040199403998335_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=37c68a&_nc_ohc=Bv3pOkK7-SwAX-XQPHk&_nc_ht=scontent.fcai19-5.fna&oh=00_AfAkn9C9Owqi8sa21BiO6qronj45JpefbjV1LAx10Cfblg&oe=64FA9784',
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: 'image2',
                                    child: CustomNetworkImage(
                                      orangeColor: orangeColor,
                                      imageUrl:
                                      'https://scontent.fcai19-5.fna.fbcdn.net/v/t39.30808-6/329126097_1556236998213901_9082040199403998335_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=37c68a&_nc_ohc=Bv3pOkK7-SwAX-XQPHk&_nc_ht=scontent.fcai19-5.fna&oh=00_AfAkn9C9Owqi8sa21BiO6qronj45JpefbjV1LAx10Cfblg&oe=64FA9784',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ],
                ),

                ///تانى حاجه بتاعة البيانات
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLocationContainer(height: height, width: width),
                        ExpansionTile(
                          textColor: orangeColor,
                          iconColor: orangeColor,
                          title: Text(
                            'الارقام',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            ///المفروض ليست فيها رقم التليفون والفانكشن بتاعة الكول تتعمل وممكن نزود اوبشن ارقم تلبفون انهى فرع لو فى فروع تانيه
                            ///وممكن نخليها ليست فيو لو منفعتش expansiontile دى
                            CustomNumberContainer(
                                height: height,
                                width: width,
                                orangeColor: orangeColor),
                            CustomNumberContainer(
                                height: height,
                                width: width,
                                orangeColor: orangeColor),
                            CustomNumberContainer(
                                height: height,
                                width: width,
                                orangeColor: orangeColor),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>

                            ///المفروض هنعمل ليست راجع فيها موديل شايل الاسم والايقون
                            CustomCategoryIcon(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                ///العروض
                const Center(
                  child:
                  Text('انتظر العروض قريبا ', style: TextStyle(fontSize: 26)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}