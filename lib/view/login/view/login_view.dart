import 'package:demorealcarpark/product/constants/color.dart';
import 'package:demorealcarpark/product/widgets/buttons/login_button.dart';
import 'package:demorealcarpark/product/widgets/container/header_container.dart';
import 'package:demorealcarpark/product/widgets/textfields/text_input.dart';
import 'package:demorealcarpark/view/adminMap/view/admin_maps.dart';
import 'package:demorealcarpark/view/auth/service/firebase_auth_service.dart';
import 'package:demorealcarpark/view/splash/view/splash_view.dart';
import 'package:demorealcarpark/view/userMap/view/user_map_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final AuthService authService;

  @override
  void initState() {
    super.initState();
    authService=AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: Icon(Icons.abc),
        ),
        /*appBar: AppBar(
          backgroundColor: dataTurquosieColors,
          title: const Text("Kullanıcı Girişi"),
          elevation: 0,
          actions: [
            _isLoading
                ? const CircularProgressIndicator()
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_notifications_outlined),
                    color: Colors.white,
                  )
          ],
        ),*/
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderContainer("Giriş Yap"),
                const _SizedBox(),
                Padding(
                  padding: ProjectPadding.normalAllPadding,
                  child: TextInputField(
                      icon: Icons.email, hint: "Kullanıcı Adı", controller: _emailController, isPasswordType: false),
                ),
                Padding(
                  padding: ProjectPadding.normalAllPadding,
                  child: TextInputField(
                      icon: Icons.vpn_key, hint: "Parola", controller: _passwordController, isPasswordType: true),
                ),
                 Padding(
                padding:ProjectPadding.normalAllPadding,
                child: Container(
                  margin: ProjectMargin.normalAllMargin,
                  alignment: Alignment.centerRight,
                  child: const Text(
                    "Parolanızı mı unuttunuz?",
                  ),
                ),
              ),
                Padding(
                    padding: ProjectPadding.normalAllPadding,
                    child: LoginButton(
                      onCompleted: () async {
                       if (_passwordController.text != null && _emailController.text !=null ) {
                       authService.signIn(_emailController.text, _passwordController.text).then((value){
                        return    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const AdminMapView()));
                      });
                    }
                      },
                      title: "Giriş Yap",
                    )),
                     const _SizedBox(),
              GestureDetector(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SplashView()));
                },
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Hesabınız yok mu? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Kayıt Ol",
                        style: TextStyle(color: dataTurquosieColors)),
                  ]),
        
                ),
                )
              ],
            ),
          ),
        ));
  }
}

class _SizedBox extends StatelessWidget {
  const _SizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
    );
  }
}

class ProjectPadding{
  static EdgeInsets normalAllPadding=const EdgeInsets.all(10.0);
}
class ProjectMargin{
  static EdgeInsets normalAllMargin=const EdgeInsets.all(10.0);
}