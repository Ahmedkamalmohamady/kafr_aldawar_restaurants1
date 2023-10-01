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
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => themeBloc,
      child: SingleChildScrollView(
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
                trailing: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (ctx, state) {
                    return state.runtimeType == DarkThemeState
                        ? Switch(
                            value: true,
                            onChanged: (val) =>
                                themeBloc.add(ToggleThemeEvent()))
                        : Switch(
                            value: false,
                            onChanged: (val) =>
                                themeBloc.add(ToggleThemeEvent()));
                  },
                ),
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
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddRestaurant())),
                child: const ListTile(
                  title: Text('إضافة مطعم'),
                  trailing: Icon(Icons.add),
                ),
              ),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
