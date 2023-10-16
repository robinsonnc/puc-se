import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meu_pedido/views/account/address_screen.dart';
import 'package:meu_pedido/views/account/chats_screen.dart';
import 'package:meu_pedido/views/account/help_screen.dart';
import 'package:meu_pedido/views/account/notifications_screen.dart';
import 'package:meu_pedido/views/account/password_screen.dart';
import 'package:meu_pedido/views/account/payments_screen.dart';
import 'package:meu_pedido/views/account/personal_data_screen.dart';
import 'package:meu_pedido/views/account/safety_screen.dart';
import 'package:meu_pedido/views/account/settings_screen.dart';
import 'package:meu_pedido/views/auth/login_screen.dart';

import '../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 125,),
                      // Divider(thickness: 5,),
                      _listTiles(
                        title: 'Endereço',
                        icon: Icons.person, //IconlyBold.profile,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AddressScreen.routeName);
                        },
                      ),

                      _listTiles(
                        title: 'Pagamentos',
                        icon: Icons.credit_card,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(PaymentsScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Notificações',
                        icon: Icons.notifications,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(NotificationsScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Conversas',
                        icon: IconlyBold.chat,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ChatsScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Trocar senha',
                        icon: Icons.password,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(PasswordScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Meus dados',
                        icon: Icons.list_alt,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(PersonalDataScreen.routeName);
                        },
                      ),

                      SizedBox(height: 25),

                      _listTiles(
                        title: 'Ajuda',
                        icon: Icons.help,
                        onPressed: () {
                          Navigator.of(context).pushNamed(HelpScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Configurações',
                        icon: Icons.settings,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SettingsScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Segurança',
                        icon: Icons.safety_check,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SafetyScreen.routeName);
                        },
                      ),
                      _listTiles(
                        title: 'Logout',
                        icon: IconlyBold.logout,
                        onPressed: () {
                          Constants.firebaseAuth.signOut().then((value) =>
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            // color: Theme.of(context).colorScheme.background,
            width: double.infinity,
            height: 125,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.outlineVariant)),
            ),
            child: Row(
              children: [
                // ImageIcon(
                //   AssetImage('assets/icons/user-96(-xxxhdpi)-filled.png'),
                //   size: 60,
                // ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/icons/user-96(-xxxhdpi)-filled.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Bem-vindo, \n',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      children: const [
                        TextSpan(
                          text: '     ',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          // fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle ?? ''),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrow_right_2),
      onTap: () {
        onPressed();
      },
    );
  }
}
