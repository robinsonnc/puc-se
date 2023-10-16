import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_pedido/color_scheme.dart';
import 'package:meu_pedido/controller/login_controller.dart';
import 'package:meu_pedido/views/account/address_screen.dart';
import 'package:meu_pedido/views/account/chats_screen.dart';
import 'package:meu_pedido/views/account/help_screen.dart';
import 'package:meu_pedido/views/account/notifications_screen.dart';
import 'package:meu_pedido/views/account/password_screen.dart';
import 'package:meu_pedido/views/account/payments_screen.dart';
import 'package:meu_pedido/views/account/personal_data_screen.dart';
import 'package:meu_pedido/views/account/safety_screen.dart';
import 'package:meu_pedido/views/account/settings_screen.dart';
import 'package:meu_pedido/views/auth/forget_password_screen.dart';
import 'package:meu_pedido/views/auth/login_screen.dart';
import 'package:meu_pedido/views/auth/signup_screen.dart';
import 'package:meu_pedido/views/details_screen.dart';
import 'package:meu_pedido/views/home_screen.dart';
import 'package:meu_pedido/views/main_screen.dart';
import 'package:meu_pedido/views/profile_screen.dart';
import 'package:meu_pedido/views/store_profile_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // In order to lock orientation mode, we have to ensure the
  // Flutter binding has been initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
        create: (context) => LoginController(),
      )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
    
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: lightColorScheme.background,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: lightColorScheme.background), 
        ),
        home: const LoginScreen(),
        routes: {
          MainScreen.routeName: (ctx) => const MainScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          SignupScreen.routeName: (ctx) => const SignupScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          ForgetPasswordScreen.routeName: (ctx) => const ForgetPasswordScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
          AddressScreen.routeName: (ctx) => const AddressScreen(),
          ChatsScreen.routeName: (ctx) => const ChatsScreen(),
          HelpScreen.routeName: (ctx) => const HelpScreen(),
          NotificationsScreen.routeName: (ctx) => const NotificationsScreen(),
          PasswordScreen.routeName: (ctx) => const PasswordScreen(),
          PaymentsScreen.routeName: (ctx) => const PaymentsScreen(),
          PersonalDataScreen.routeName: (ctx) => const PersonalDataScreen(),
          SafetyScreen.routeName: (ctx) => const SafetyScreen(),
          SettingsScreen.routeName: (ctx) => const SettingsScreen(),
          StoreProfileScreen.routeName: (ctx) => StoreProfileScreen(),
          DetailsScreen.routeName: (ctx) => const DetailsScreen(),
        },
      ),
    );
  }
}

