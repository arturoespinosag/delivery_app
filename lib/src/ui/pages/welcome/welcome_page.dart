import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/ui/widgets/circle_button.dart';
import 'package:deliveryapp/src/ui/widgets/rounded_button.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  'assets/pages/welcome/welcome.svg',
                  width: 200,
                ),
              ),
              Text(
                'Welcome',
                style: FontStyles.title,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bienvenido a la aplicación de Burger King\n, inicia sesión para guardar tus preferencias.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    label: 'Entrar',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.login,
                      );
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  RoundedButton(
                    label: 'Registrarse',
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                    borderColor: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('O via redes sociales'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                    onPressed: () {},
                    icon: 'assets/pages/welcome/facebook.svg',
                    backgroundColor: Colors.blueAccent,
                  ),
                  CircleButton(
                    onPressed: () {},
                    icon: 'assets/pages/welcome/google.svg',
                    backgroundColor: Color(0xFFDD4337),
                  ),
                  CircleButton(
                    onPressed: () {},
                    icon: 'assets/pages/welcome/apple.svg',
                    backgroundColor: Colors.black,
                  )
                ],
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
