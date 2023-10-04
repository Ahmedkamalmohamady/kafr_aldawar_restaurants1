import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/theme/theme_bloc.dart';
import '../add_restaurant/add_restaurant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

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
            Padding(
              padding: EdgeInsets.all(size.height * 0.01),
              child: Text('الاعدادات', style: Theme.of(context).textTheme.headlineMedium),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(radius: 15, backgroundColor: Theme.of(context).cardTheme.color,),
                title: const Text('الوضع الداكن'),
                trailing: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (ctx, state) {
                    return state.runtimeType == DarkThemeState
                        ? Switch(
                        value: true,
                        onChanged: (val) =>
                            BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent()))
                        : Switch(
                        value: false,
                        onChanged: (val) =>
                            BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent()));
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('إضافة مطعم'),
                leading: CircleAvatar(radius: 15, child: Image.asset('assets/images/setting/whatsapp.png')),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('تابعنا علي فايسبوك'),
                leading: CircleAvatar(radius: 15, child: Image.asset('assets/images/setting/facebook.png')),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('مشاركة التطبيق'),
                leading: CircleAvatar(radius: 15, child: Image.asset('assets/images/setting/complain.png')),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('شكاوي واقتراحات'),
                leading: CircleAvatar(radius: 15, child: Image.asset('assets/images/setting/shakawa.png')),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddRestaurant())),
              child: const Card(
                child: ListTile(
                  leading: CircleAvatar(radius: 15, child: Icon(Icons.add),),
                  title: Text('إضافة مطعم'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
