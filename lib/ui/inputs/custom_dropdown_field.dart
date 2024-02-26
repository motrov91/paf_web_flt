import 'package:flutter/material.dart';
import 'package:paf_web/providers/users_provider.dart';
import 'package:provider/provider.dart';

class CustomDropbownFormField extends StatefulWidget {
  final String? selectedValue;

  const CustomDropbownFormField({super.key, this.selectedValue = ''});

  @override
  State<CustomDropbownFormField> createState() =>
      _CustomDropbownFormFieldState();
}

class _CustomDropbownFormFieldState extends State<CustomDropbownFormField> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    return DropdownButtonFormField(
        //value: unique[0],
        validator: (value) =>
            value == 'SELECCIONE' ? "Seleccione un rol" : null,
        onChanged: (value) => userProvider.rolId = value!,
        dropdownColor: Colors.black.withOpacity(0.7),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        style: const TextStyle(color: Colors.white),
        hint: const Text(
          'Selecciona un rol',
          style: TextStyle(color: Colors.white),
        ),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelStyle: const TextStyle(color: Colors.white),
            prefixIcon: const Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            )),
        items: const [
          DropdownMenuItem(value: '1', child: Text('ADMINISTRADOR')),
          DropdownMenuItem(value: '2', child: Text('GERENTE')),
          DropdownMenuItem(value: '3', child: Text('ASESOR')),
          DropdownMenuItem(value: '4', child: Text('ESPECIALISTA')),
        ]
        );
  }
}
