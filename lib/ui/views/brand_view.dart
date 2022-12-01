import 'package:flutter/material.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/datatables/brands_datasource.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/modals/brands_modal.dart';

class BrandView extends StatefulWidget {
  const BrandView({super.key});

  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {
  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<BrandProvider>(context, listen: false).getBrands();
  }

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<BrandProvider>(context).brandList;
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Text(
              'Marcas',
              style: CustomLabels.tag,
            ),
            PaginatedDataTable(
              columns: const [
                DataColumn(
                    label:
                        Expanded(child: Center(child: Text('Nombre marca')))),
                DataColumn(
                    label: Expanded(child: Center(child: Text('Responsable')))),
                DataColumn(label: Expanded(child: Center(child: Text('')))),
              ],
              source: BrandsDTS(brands, context),
              header: const Text(''),
              actions: [
                ( user!.rolId == 1 )
                    ? TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff3069af))),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => const BrandModal(
                              data: null,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add_outlined,
                              color: Colors.white,
                              size: 14,
                            ),
                            Text(
                              'Agregar',
                              style: GoogleFonts.roboto(color: Colors.white),
                            )
                          ],
                        ))
                    : Container()
              ],
            )
          ],
        ));
  }
}
