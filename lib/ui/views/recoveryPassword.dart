import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:paf_web/router/router.dart';
import 'package:paf_web/services/navigation_service.dart';
import 'package:paf_web/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: authProvider.formKeyRecovery,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Image(image: AssetImage('/logo_sin_texto.png')),
                  const Text(
                    'Recuperar contraseña',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
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
                        hint: 'Ingrese su correo electrónico',
                        label: 'Email',
                        icon: Icons.email_outlined),
                    onChanged: (value) => authProvider.emailRecovery = value,
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
                              .validFormRecovery();

                      if (isValid) {
                        final email = authProvider.emailRecovery;
                        authProvider.recoveryPassword(email);
                      }
                    },
                  ),
                  LinkText(
                    text: 'Regresar al login',
                    onPressed: () =>
                        NavigationService.navigateTo(Flurorouter.loginRouter),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
