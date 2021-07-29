import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forgot_password_controller.dart';
import 'widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordController>(
      create: (_) => ForgotPasswordController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(context);
        final size = data.size;
        final padding = data.padding;
        final appbar = AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        );
        return Scaffold(
          appBar: appbar,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: double.infinity,
                  height: size.height -
                      padding.top -
                      padding.bottom -
                      appbar.preferredSize.height,
                  color: bgColor,
                  child: Column(
                    children: [
                      Text(
                        'Recupera tu password',
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        child: Text(
                          'Escribe tu correo que registraste en tu cuenta.',
                          style: FontStyles.normal.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ForgotPasswordForm(),
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
