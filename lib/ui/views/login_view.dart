import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/ui/buttons/custom_outlined_button.dart';
import 'package:paf_web/ui/buttons/link_text.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/providers/login_form_provider.dart';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(
          builder: (context) {
            final providerLogin =
                Provider.of<LoginFormProvider>(context, listen: false);
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: providerLogin.formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 450,
                    decoration: decoration(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 300,
                            child: Image(image: AssetImage('/logo.png')),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onFieldSubmitted: (value) =>
                                onFormSubmit(providerLogin, authProvider),
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? '')) {
                                return 'Email no valido';
                              }
                              return null;
                            },
                            onChanged: (value) => providerLogin.email = value,
                            style: const TextStyle(color: Colors.black54),
                            decoration: CustomsInputs.inputDecorationLogin(
                                hint: 'Correo electrónico',
                                label: 'Email',
                                icon: Icons.email_outlined),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese su contraseña';
                              }

                              return null;
                            },
                            obscureText: authProvider.visibilityPassword,
                            onFieldSubmitted: (value) =>
                                onFormSubmit(providerLogin, authProvider),
                            onChanged: (value) =>
                                providerLogin.password = value,
                            style: const TextStyle(color: Colors.black54),
                            decoration: CustomsInputs.inputDecorationPassword(
                                hint: '*********',
                                label: 'Contraseña',
                                icon: Icons.lock_outline,
                                state: (authProvider.visibilityPassword)
                                    ? true
                                    : false,
                                onPressed: () {
                                  authProvider.setVisibilityPassword();
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomOutlinedButton(
                            text: 'Ingresar',
                            isFilled: true,
                            color: Colors.blue,
                            onPressed: () {
                              onFormSubmit(providerLogin, authProvider);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          LinkText(
                              text: 'Olvide mi contraseña', onPressed: () {})
                        ]),
                  ),
                ),
              ),
            );
          },
        ));
  }

  BoxDecoration decoration() => BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 10)
          ]);
}

void onFormSubmit(LoginFormProvider providerLogin, AuthProvider authProvider) {
  final isValid = providerLogin.validateForm();
  if (isValid) {
    authProvider.login(providerLogin.email, providerLogin.password);
  }
}
