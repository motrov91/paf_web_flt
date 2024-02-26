import 'package:flutter/material.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/providers/users_provider.dart';
import 'package:paf_web/providers/register_form_provider.dart';

import 'package:paf_web/ui/inputs/custom_dropdown_field.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';

import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/models/user.dart';
import 'package:email_validator/email_validator.dart';

class UserModal extends StatefulWidget {
  final User? user;

  const UserModal({super.key, this.user});

  @override
  State<UserModal> createState() => _UserModalState();
}

class _UserModalState extends State<UserModal> {
  String? id;
  String name = '';
  String email = '';
  String cargo = '';
  String rolId = '';
  String password = "";
  String repeat_password = "";

  @override
  void initState() {
    super.initState();

    id = widget.user?.id.toString();
    name = widget.user?.name ?? '';
    email = widget.user?.email ?? '';
    cargo = widget.user?.cargo ?? '';
    rolId = widget.user?.rolId.toString() ?? '';
    password = "";
    repeat_password = "";
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 500,
          decoration: buildDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nuevo usuario',
                      style: CustomLabels.h1.copyWith(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: registerProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          initialValue: widget.user?.name ?? '',
                          decoration: CustomsInputs.inputDecorationRegister(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: Icons.person_outline),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un nombre';
                            }
                            return null;
                          },
                          onChanged: (value) => name = value,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          initialValue: widget.user?.email ?? '',
                          decoration: CustomsInputs.inputDecorationRegister(
                              hint: 'Correo electrónico',
                              label: 'Correo',
                              icon: Icons.alternate_email_outlined),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no valido';
                            }
                            return null;
                          },
                          onChanged: (value) => email = value,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (widget.user != null)
                            ? const SizedBox(
                                height: 0,
                              )
                            : Column(
                                children: [
                                  TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration:
                                        CustomsInputs.inputDecorationRegister(
                                            hint: 'Password',
                                            label: 'Password',
                                            icon: Icons.lock_outline),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese un password';
                                      }
                                      if( value.length <= 6 ){
                                        return 'La contraseña debe tener al menos 7 caracteres';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => password = value,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration:
                                        CustomsInputs.inputDecorationRegister(
                                            hint: 'Repetir password',
                                            label: 'Repetir password',
                                            icon: Icons.lock_outline),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Repita el password';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) =>
                                        repeat_password = value,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          initialValue: widget.user?.cargo ?? '',
                          decoration: CustomsInputs.inputDecorationRegister(
                              hint: 'Cargo',
                              label: 'Cargo',
                              icon: Icons.account_balance_outlined),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un cargo';
                            }
                            return null;
                          },
                          onChanged: (value) => cargo = value,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomDropbownFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomOutlinedButton(
                          onPressed: () async {
                            final userProvider = Provider.of<UsersProvider>(
                                context,
                                listen: false);

                            final isValid = registerProvider.validateForm(
                                password, repeat_password);

                            if (!isValid) {
                              return NotificationsService.showSnackbarError(
                                  'Las contraseñas no coinciden o te falta llenar campos obligatorios, los campos restantes aparecerán en rojo');
                            }

                            if (id == null) {
                              //Create user
                              try {
                                await userProvider.register(name, email,
                                    password, repeat_password, cargo);
                                NotificationsService.showSnackbarSuccess(
                                    "Producto creado con exito");
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              } catch (e) {
                                NotificationsService.showSnackbarError(
                                    'No se pudo crear el usuario');
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              }
                            } else {
                              //Update user
                              try {
                                await userProvider.updateUser(
                                    id!, name, email, cargo, rolId);

                                NotificationsService.showSnackbarSuccess(
                                    'Usuario actualizado con exito');
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              } catch (e) {
                                Navigator.of(context).pop();

                                NotificationsService.showSnackbarError(
                                    "No se pudo actualizar el usuario");
                              }
                            }
                          },
                          text: (id == null) ? 'Agregar' : 'Actualizar',
                          isFilled: true,
                          color: Colors.white,
                          textColor: const Color(0xff3069af),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  BoxDecoration buildDecoration() => const BoxDecoration(
      color: Color(0xff3069af),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
