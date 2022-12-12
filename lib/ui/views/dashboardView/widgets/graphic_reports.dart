import 'package:flutter/material.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';

class GraphicReports extends StatelessWidget {
  const GraphicReports({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 1000,
        height: 300,
        decoration: _buildDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Cotizaciones generadas por mes',
            style: CustomLabels.tag,
          )
        ]),
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10)
  );
}
