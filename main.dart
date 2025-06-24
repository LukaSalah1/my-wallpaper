import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:westtips/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://kurmironcryysfcokafs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt1cm1pcm9uY3J5eXNmY29rYWZzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NjE3OTA1MCwiZXhwIjoyMDYxNzU1MDUwfQ.3OsgKhQ66KrcoZFMC0kFyvewWfxs2N6xIODB0_NZA70',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
