import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class ChangePassword extends StatelessWidget {
  final String token;

  const ChangePassword({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: authProvider.formKeyRecovery,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Image(image: AssetImage('/logo_sin_texto.png')),
                  const Text(
                    'Ingresa tu nueva contraseña',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (!EmailValidator.validate(value ?? '')) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                    decoration: CustomsInputs.inputDecorationLogin(
                        hint: 'Nueva contraseña',
                        label: 'Contraseña',
                        icon: Icons.email_outlined),
                    onChanged: (value) => authProvider.newPassword = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (!EmailValidator.validate(value ?? '')) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                    decoration: CustomsInputs.inputDecorationLogin(
                        hint: 'Repita su contraseña',
                        label: 'Repetir contraseña',
                        icon: Icons.email_outlined),
                    onChanged: (value) => authProvider.repeatPassword = value,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomOutlinedButton(
                    text: 'Recuperar',
                    isFilled: true,
                    color: Colors.blue,
                    onPressed: () {
                      final isValid =
                          Provider.of<AuthProvider>(context, listen: false)
                              .validateFormChangePassword();
                      if (isValid) {
                        if (authProvider.newPassword.isNotEmpty &&
                            authProvider.repeatPassword.isNotEmpty) {
                          authProvider.changePassword(token);
                        } else {
                          NotificationsService.showSnackbarError(
                              "Los campos no pueden estar vácios");
                        }
                      } else {
                        NotificationsService.showSnackbarError(
                            "Las contraseñas no son iguales");
                      }
                      // if (isValid) {
                      //   final email = authProvider.emailRecovery;
                      //   authProvider.recoveryPassword(email);
                      //}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
