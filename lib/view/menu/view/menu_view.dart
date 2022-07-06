import 'package:demorealcarpark/product/widgets/card/custom_card.dart';
import 'package:demorealcarpark/view/about/view/about_view.dart';
import 'package:demorealcarpark/view/login/view/login_view.dart';
import 'package:demorealcarpark/view/notification/view/notification_view.dart';
import 'package:demorealcarpark/view/userMap/view/user_map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final String _helloText = 'Merhaba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.grey,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomCardWidget(
                  widget: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Text(
                      _helloText,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 30.0,
                          ),
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              _customCard(
                title: 'Park Alanları',
                icon: const Icon(Icons.local_parking_outlined),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserMapView(),
                      ));
                },
              ),
              _customCard(
                  icon: const Icon(Icons.login_outlined),
                  title: 'Giriş Yap',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ));
                  }),
                  _customCard(
                  icon: const Icon(Icons.notifications_outlined),
                  title: ' Bildirimler',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationView(),
                        ));
                  }),
                  _customCard(
                  icon: const Icon(Icons.account_balance_outlined),
                  title: 'Hakkımızda',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsView(),
                        ));
                  }),
                  _customCard(
                  icon: const Icon(Icons.accessibility_new_sharp),
                  title: 'Bize Ulaşın',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsView(),
                        ));
                  }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Data Kritik 2022',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12),
                ),
              )
            ],
          ),
        ));
  }
}

class _customCard extends StatelessWidget {
  const _customCard({
    Key? key,
    this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Function()? onTap;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white70,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
                  ),
                  icon
                ],
              ),
            )),
      ),
    );
  }
}
