import 'package:flutter/material.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool theme = false;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),


            Text('الاعدادات', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: size.height * 0.02),

            ListTile(
              title: const Text('الوضع الداكن'),
              trailing: Switch(value: theme, onChanged: (val) => setState(() => theme = val)),
            ),
            SizedBox(height: size.height * 0.02),

            ListTile(
              title: const Text('إضافة مطعم'),
              trailing: Image.asset('assets/images/setting/whatsapp.png'),
            ),
            SizedBox(height: size.height * 0.02),

            ListTile(
              title: const Text('تابعنا علي فايسبوك'),
              trailing: Image.asset('assets/images/setting/facebook.png'),
            ),
            SizedBox(height: size.height * 0.02),

            ListTile(
              title: const Text('مشاركة التطبيق'),
              trailing: Image.asset('assets/images/setting/complain.png'),
            ),
            SizedBox(height: size.height * 0.02),

            ListTile(
              title: const Text('شكاوي واقتراحات'),
              trailing: Image.asset('assets/images/setting/shakawa.png'),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}