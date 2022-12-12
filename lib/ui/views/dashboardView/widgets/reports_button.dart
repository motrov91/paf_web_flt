import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/ui/buttons/custom_report_nav_button.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';

class ReportsButton extends StatelessWidget {
  const ReportsButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 300,
      height: 300,
      decoration: _buildDecoration(),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const SizedBox(
              width: double.infinity,
              height: 300,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('/bg_reports.png')
            )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: _buildTagDecoration(),
                child: Text('Reportes', style: CustomLabels.tagWhite,)),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 60),
                child: Text('Transforma los datos en información y visualiza como gráficas gerenciales', textAlign: TextAlign.justify, style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16
                )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 60, top: 20),
                child: Text('Realiza a través de gráficas estadísticas una trazabilidad de la información y toma decisiones', style: GoogleFonts.roboto(
                  color: Colors.white.withOpacity(0.8), fontSize: 12,
                )),
              ),

                const CustomReportNavButton(text: 'Ver Reportes')
            ],
          )
        ],
      )
    );
  }

  BoxDecoration _buildTagDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
  );

  BoxDecoration _buildDecoration() => BoxDecoration(
      color: const Color(0xff003cbe),
    borderRadius: BorderRadius.circular(10)
  );
}
