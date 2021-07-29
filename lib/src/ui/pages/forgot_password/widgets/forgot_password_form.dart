import 'package:deliveryapp/src/ui/widgets/input_text.dart';
import 'package:deliveryapp/src/ui/widgets/rounded_button.dart';
import 'package:deliveryapp/src/utils/dialogs/dialogs.dart';
import 'package:deliveryapp/src/utils/dialogs/progress_dialog.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../forgot_password_controller.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key key}) : super(key: key);

  void _submit(context) async {
    final controller =
        Provider.of<ForgotPasswordController>(context, listen: false);
    ProgressDialog.show(context);
    final sent = await controller.submit();
    Navigator.pop(context);
    if (sent) {
      await Dialogs.alert(
        context,
        title: 'Enviado',
        dismissible: false,
        description: 'Correo enviado a ${controller.email}',
      );
      Navigator.pop(context);
    } else {
      Dialogs.alert(context,
          title: 'Error', description: 'No existe una cuenta con ese correo');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/pages/forgot_password/forgot_password.svg',
            width: 250,
          ),
          SizedBox(
            height: 25,
          ),
          InputText(
            labelText: 'Correo',
            onChanged: controller.onEmailChanged,
            prefixIcon: Icon(Icons.email_outlined),
            validator: (text) {
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(text)) {
                return null;
              } else
                return 'Email inválido';
            },
          ),
          SizedBox(
            height: 25,
          ),
          RoundedButton(
            label: 'Enviar',
            onPressed: () => _submit(context),
          )
        ],
      ),
    );
  }
}
