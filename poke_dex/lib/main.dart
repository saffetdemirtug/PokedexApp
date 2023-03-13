import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_dex/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //flutter_screenutil paketi kullanılarak farklı emulatorlere ve cihazlara adapte bir şekilde çalışan çözünürlük ve boyutlara entegre olması amaçlandı.
      designSize:
          const Size(412, 732), //Kullandığım emulatorun ekran boyutları.
      builder: (context, index) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:
              ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
          home: const HomePage()),
    );
  }
}
