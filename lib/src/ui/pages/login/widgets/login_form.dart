import 'package:deliveryapp/src/data/models/user.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/ui/widgets/input_text.dart';
import 'package:deliveryapp/src/ui/widgets/rounded_button.dart';
import 'package:deliveryapp/src/utils/dialogs/progress_dialog.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<LoginController>();
    ProgressDialog.show(context);
    final User? user = await controller.submit();
    Navigator.pop(context);
    // if (user == null) {
    //   showDialog(
    //     context: context,
    //     builder: (_) => AlertDialog(
    //       title: Text('ERROR'),
    //       content: Text('Usuario o contraseña incorrecto'),
    //     ),
    //   );
    // } else {
    Get.instance.put<User>(user);
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.home,
      (_) => false,
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          InputText(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
            validator: (text) {
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(text)) {
                return null;
              } else
                return 'Email inválido';
            },
            onChanged: controller.onEmailChanged,
            textInputAction: TextInputAction.next,
            keyboardtType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 20,
          ),
          InputText(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock_outline_rounded),
            obscureText: true,
            onChanged: controller.onPasswordChanged,
            onSubmitted: (text) => _submit(context),
            textInputAction: TextInputAction.send,
            validator: (text) {
              if (text.trim().length > 6) {
                return null;
              } else {
                return 'El password debe ser mayor a 6 dígitos';
              }
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text(
                '¿Olvidaste el password?',
                style: FontStyles.normal,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.forgot_password);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
            label: 'Login',
            onPressed: () => _submit(context),
            padding: EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 50,
            ),
          ),
        ],
      ),
    );
  }
}
