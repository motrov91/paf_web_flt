import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/models/product.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

class UpdateStatus extends StatefulWidget {
  final Product product;

  const UpdateStatus({super.key, required this.product});

  @override
  State<UpdateStatus> createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
  int id = 1;
  String name = "";
  bool _status = false;
  int userId = 1;

  @override
  void initState() {
    super.initState();
    id = widget.product.id;
    name = widget.product.name;
    _status = !widget.product.state;
    userId = widget.product.userId;
  }

  List boolean = [true, false];

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 250),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff3069af),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Administrar estado del producto',
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Form(
                    key: product.formKey,
                    child: Column(
                      children: [
                        Text(
                          'Estado actual del producto: $name',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          value: _status,
                          // value: _status.toString() ?? "0",
                          items: boolean.map((e) {
                            if (e == true) {
                              return const DropdownMenuItem(
                                  value: true,
                                  child: Center(
                                    child: Text(
                                      "Publicar",
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                            }
                            return const DropdownMenuItem(
                                value: false,
                                child: Center(child: Text("Despublicar")));
                          }).toList(),
                          onChanged: (value) => _status = value!,
                          style: TextStyle(
                            color: Colors.blue[800],
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.white.withOpacity(0.6)),
                                side: MaterialStateProperty.all(
                                    const BorderSide(color: Colors.white))),
                            onPressed: () {
                              // product.load("id", id);
                              // product.load('name', name);
                              // product.load("userId", userId);
                              product.updateStatus(id, name, userId, _status);

                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'ACTUALIZAR',
                              style: TextStyle(
                                  color: Color(0xff3069af),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
