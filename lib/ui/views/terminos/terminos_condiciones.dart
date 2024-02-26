import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../../services/navigation_service.dart';
import '../../buttons/link_text.dart';

class TerminosCondiciones extends StatelessWidget {
  const TerminosCondiciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        children: [
          const HeaderLogos(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0,),
            child: Row(
              children: [
                Expanded(
                  child: TerminosYCondiciones(), 
                  flex: 2,
                ),
                Expanded(flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: LinkText(
                          text: 'Términos y condiciones de uso de la plataforma de productos PAF',
                          onPressed: () => NavigationService.navigateTo(
                              Flurorouter.terminos),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: LinkText(
                          text: 'Política de Tratamiento de Datos Personales (Política de Privacidad)',
                          onPressed: () => NavigationService.navigateTo(
                              Flurorouter.tratamiento),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TerminosYCondiciones extends StatelessWidget {
  const TerminosYCondiciones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text('Términos y condiciones de uso de la plataforma de productos PAF', style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
           Text('01 Junio del 2023'),
           SizedBox(height: 7,),
           Text('Aspectos generales'),
           SizedBox(height: 7,),
           Container(
            width: double.infinity,
             child: Text(
                '1. Introducción',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
           ),
            SizedBox(height: 7,),
            Text(
              'Bienvenido a los Terminos y condiciones de la aplicacionde productos de la empresa PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.S (en adelante, "la Aplicación"). Esta Aplicación es propiedad y está operada por la empresa PURIFICACIÓN  Y ANÁLISIS DE FLUIDOS S.A.S, una sociedad constituida conforme a las leyes colombianas, identificada con NIT. 860518299-1, con domicilio en la ciudad de Bogotá D.C.,(en adelante, "PAF"). Al acceder y utilizar esta Aplicación, aceptas los siguientes términos y condiciones. Si no estás de acuerdo con estos términos, te recomendamos que no utilices la Aplicación.'
            ),
            SizedBox(height: 7,),
            Text(
              '2. Registro y Cuentas de Usuario',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              '2.1. Registro: El registro en la Aplicación se realiza exclusivamente a través de la plataforma web de PAF. Para poder utilizar la Aplicación, debes haber completado el proceso de registro en la plataforma web y haber sido vinculado a PAF como usuario autorizado.'
            ),
            SizedBox(height: 7,),
            Text(
              '2.2. Acceso: Una vez registrado, podrás acceder a la Aplicación utilizando tus credenciales proporcionadas durante el proceso de registro.'
            ),
            SizedBox(height: 7,),
            Text(
              '2.3. Administración de Cuentas: La gestión de cuentas de usuario, incluida la creación, modificación o eliminación de cuentas, se realizará exclusivamente por parte del administrador designado por PAF a través de la plataforma web.'
            ),
            SizedBox(height: 7,),
            Text(
              '3. Uso de la Aplicación',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              '3.1. Utilización Autorizada: Solo puedes utilizar la Aplicación de acuerdo con los fines para los que fuiste autorizado por PAF. El uso no autorizado o inapropiado de la Aplicación está estrictamente prohibido.'
            ),
            SizedBox(height: 7,),
            Text(
              '3.2. Responsabilidad: Eres responsable de mantener la confidencialidad de tus credenciales de acceso y de cualquier actividad que ocurra en tu cuenta.'
            ),
            SizedBox(height: 7,),
            Text(
              '4. Privacidad y Datos Personales',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              '4.1. Política de Privacidad: La recopilación, uso y divulgación de tus datos personales se rige por nuestra Política de Privacidad, que puedes revisar en [Enlace a la Política de Privacidad]. Al utilizar la Aplicación, aceptas los términos de nuestra Política de Privacidad.'
            ),
            SizedBox(height: 7,),
            Text(
              '4.2. La aplicación móvil no te pedirá ningún tipo de información, esta app es unicamente para consumir información relacionada a los productos que maneja la empresa y es netamente informativa'
            ),
            SizedBox(height: 7,),
            Text(
              '5. Actualización y Terminación',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              '5.1. Cambios en los Términos: PAF se reserva el derecho de modificar estos Términos y Condiciones en cualquier momento. Las modificaciones entrarán en vigor una vez publicadas en la Aplicación. Se te notificará sobre cualquier cambio importante.'
            ),
            
            SizedBox(height: 7,),
            Text(
              '5.2. Terminación: PAF se reserva el derecho de suspender o terminar tu acceso a la Aplicación en cualquier momento, si se sospecha un uso inapropiado o no autorizado de la misma.'
            ),
            SizedBox(height: 7,),
            Text(
              '6. Limitación de Responsabilidad',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'PAF no se hace responsable de cualquier pérdida o daño que puedas sufrir como resultado del uso de la Aplicación. El uso de la Aplicación es bajo tu propio riesgo.'
            ),
            SizedBox(height: 7,),
            Text(
              '7. Contacto',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              '7.1. Terminación: PAF se reserva el derecho de suspender o terminar tu acceso a la Aplicación en cualquier momento, si se sospecha un uso inapropiado o no autorizado de la misma.'
            ),
            SizedBox(height: 7,),
            Text(
              'Si tienes alguna pregunta o inquietud relacionada con estos Términos y Condiciones, puedes ponerte en contacto con nosotros a través de servicioalcliente@paf.com.co, o LLamar al (601) 917 21 34. Recuerda personalizar estos términos y condiciones según las necesidades específicas de tu aplicación y empresa, y considera consultar a un abogado para asegurarte de que cumplen con todas las leyes y regulaciones aplicables.'
            ),
            SizedBox(height: 7,),
            Text(
              '7.2. Terminación: PAF se reserva el derecho de suspender o terminar tu acceso a la Aplicación en cualquier momento, si se sospecha un uso inapropiado o no autorizado de la misma.'
            ),
            
          
          
          ],
        ),
      ),
    );
  }
}

class HeaderLogos extends StatelessWidget {
  const HeaderLogos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200, minWidth: 200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const Row(
                  children: [
                    Image(
                      image: AssetImage('assets/logo.png'), width: 200,
                    ),
                    Spacer(),
                    Image(
                      image: AssetImage('assets/logo_gestion.png'),
                      width: 200,
                    ),
                  ],
                ),
                Container(
                  height: 4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff93C462),
                        Color(0xffEA4F5B),
                        Color(0xffFFE403),
                        Color(0xff0291D0),
                      ]
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}