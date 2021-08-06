import 'package:deliveryapp/src/ui/widgets/custom_form.dart';
import 'package:deliveryapp/src/ui/widgets/input_text.dart';
import 'package:deliveryapp/src/ui/widgets/rounded_button.dart';
import 'package:deliveryapp/src/utils/dialogs/dialogs.dart';
import 'package:deliveryapp/src/utils/dialogs/progress_dialog.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../register_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<RegisterController>();
    final isFormOk = controller.formKey.currentState.validate();
    if (isFormOk) {
      ProgressDialog.show(context);
      final isOk = await controller.submit();
      Navigator.pop(context);
      if (!isOk) {
        Dialogs.alert(
          context,
          title: 'ERROR',
          description: 'El registro falló, error del servidor',
        );
      } else {
        await Dialogs.alert(
          context,
          title: 'REGISTRO CORRECTO',
          description: 'Registro exitoso, por favor inicia sesión',
          action: 'Ir a login',
          dismissible: false,
        );
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(
        context,
        title: 'ERROR',
        description: 'El registro falló, verifica los datos',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();
    return CustomForm(
      key: controller.formKey,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 330),
        child: Column(
          children: [
            InputText(
              prefixIcon: Icon(Icons.person_outline),
              validator: (text) {
                return text.trim().length > 1 ? null : 'Nombre inválido';
              },
              onChanged: controller.onNameChanged,
              labelText: 'Nombre',
            ),
            SizedBox(
              height: 15,
            ),
            InputText(
              prefixIcon: Icon(Icons.person_add_outlined),
              validator: (text) {
                return text.trim().length > 1 ? null : 'Apellido Inválido';
              },
              onChanged: controller.onLastNameChanged,
              labelText: 'Apellido',
            ),
            SizedBox(
              height: 15,
            ),
            InputText(
              prefixIcon: Icon(Icons.email),
              onChanged: controller.onEmailChanged,
              labelText: 'Email',
              validator: (text) {
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(text)) return null;
                return 'Correo inválido';
              },
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RoundedButton(
                label: 'Registrar',
                onPressed: () {
                  _submit(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
