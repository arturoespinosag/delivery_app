import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

import 'login_controller.dart';
import 'widgets/login_form.dart';
import 'widgets/social_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      builder: (_, __) {
        final data = MediaQuery.of(context);
        final size = data.size;
        final padding = data.padding;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  height: size.height - padding.bottom - padding.top,
                  width: double.infinity,
                  color: bgColor,
                  child: Column(
                    children: [
                      Text(
                        'Ingresa tus datos',
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/pages/login/login.svg',
                        ),
                      ),
                      LoginForm(),
                      SocialLogin(),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '¿No tienes cuenta?',
                            style: FontStyles.normal,
                          ),
                          CupertinoButton(
                            child: const Text('Regístrate'),
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.register),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
