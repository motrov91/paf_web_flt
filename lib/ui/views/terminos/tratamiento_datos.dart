import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../../services/navigation_service.dart';
import '../../buttons/link_text.dart';

class TratamientoDatos extends StatelessWidget {
  const TratamientoDatos({super.key});

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
           Text('Política de Tratamiento de Datos Personales (Política de Privacidad)', style: TextStyle(fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
           Text('01 Junio del 2023'),
           SizedBox(height: 7,),
           Text('Aspectos generales'),
           SizedBox(height: 7,),
           Container(
            width: double.infinity,
             child: Text(
                'I. INTRODUCCIÓN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
           ),
            SizedBox(height: 7,),
            Text(
              'PURIFICACIÓN Y ANÁLISIS DE FLUIDOS S.A.S. es una compañía colombiana que tiene como actividad principal la venta de suministros para laboratorio, la página Web y la aplicación móvil relacionada a productospaf.com.co es solo un canal para capacitar a nuestros vendedores y compartir información con nuestros clientes, para que los vendedores ingresen, se informen sobre los productos que vendemos dentro de la empresa y puedan realizar la transacción de suministro de información a nuestros clientes mediante correo electrónico. PURIFICACIÓN Y ANÁLISIS DE FLUIDOS S.A.S., con la finalidad de dar cumplimiento estricto a la normatividad vigente de protección de Datos Personales, de acuerdo a lo establecido en la Ley 1581 del 2012, Decreto 1074 de 2015 y demás disposiciones que las modifiquen, adicionen o complementen presenta la siguiente POLÍTICA DE PROTECCIÓN Y TRATAMIENTO DE DATOS PERSONALES (en adelante “Política de Tratamiento”) con el propósito de proteger la información personal brindada por los Titulares que tengan relación con PURIFICACIÓN Y ANÁLISIS DE FLUIDOS S.A.S. y su producto llamado “productospaf” que de ahora en adelante llamaremos (Plataforma). como lo son socios, proveedores, clientes, empleados, colaboradores y cualquier otra persona natural de la cual PURIFICACIÓN Y ANÁLISIS DE FLUIDOS S.A.S. obtenga, recolecte, procese o trate datos personales, sea que dicho tratamiento sea realizado por  PURIFICACIÓN Y ANÁLISIS DE FLUIDOS S.A.S. o por terceras personas que lo hagan por encargo de ésta. La Política de Tratamiento tiene como objeto proteger el derecho  constitucional del Habeas Data que tienen todas las personas para conocer, actualizar, y rectificar la información que se haya recogido y almacenado en las distintas bases de datos de PURIFICACIÓN Y ANÁLISIS DE FLUIDOS S.A.S. y en virtud del cumplimiento de dicho derecho sólo recolecta y da Tratamiento a Datos Personales, cuando así haya sido  autorizado previamente por su Titular, implementando para tal efecto, medidas claras sobre confidencialidad y privacidad de los Datos Personales. Así mismo, detalla los lineamientos generales corporativos que se tienen en cuenta con el fin de proteger los Datos Personales de los Titulares, las finalidades de Tratamiento de la información, el área responsable de atender las quejas y reclamos, y los procedimientos que se deben agotar para conocer actualizar, rectificar y suprimir la información y los respectivos canales para que estos puedan ejercerlos.'
            ),
            SizedBox(height: 7,),
            Text(
              ' II. DEFINICIONES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'API: Significa la interfaz de programación de aplicaciones que se realizará entre los sistemas de terceros y el de Rappi S.A.S.'
            ),
            SizedBox(height: 7,),
            Text(
              'Autorización: Consentimiento previo, expreso e informado del Titular para llevar a cabo el tratamiento de datos personales.'
            ),
            SizedBox(height: 7,),
            Text(
              'Aviso de privacidad: Comunicación verbal o escrita dirigida a los Titulares de los datos personales que están siendo tratados por la empresa, en la cual se le informa acerca de la existencia de las políticas de tratamiento de datos personales que le serán aplicadas, la forma de acceder a la mismas, y las finalidades para las cuales serán usados sus datos personales.'
            ),
            SizedBox(height: 7,),
            Text(
              'Base de datos personales: Conjunto organizado de datos personales que son objeto de tratamiento por una persona natural o jurídica.'
            ),
            SizedBox(height: 7,),
            Text(
              'Dato personal: Cualquier información concerniente o vinculada a personas naturales determinadas o determinables.'
            ),
            SizedBox(height: 7,),
            Text(
              'Dato sensible: Es aquel dato personal que afecta la intimidad del Titular y cuyo uso incorrecto podría generar discriminación. Son considerados datos sensibles entre otros, los datos de salud, los datos de orientación sexual, origen racial y étnico, opiniones políticas, convicciones religiosas, filosóficas o morales.'
            ),
            SizedBox(height: 7,),
            Text(
              'Habeas data: Es el derecho que tiene el Titular de los datos personales de exigir de las administradoras de los mismos el acceso, inclusión, exclusión, corrección, adición, actualización y rectificación de los datos, así como la limitación en su divulgación, publicación o cesión.'
            ),
            SizedBox(height: 7,),
            Text(
              'Violación de datos personales: Es el delito tipificado en el artículo 269 del Código Penal. El cual establece: “El que, sin estar facultado para ello, con provecho propio o de un tercero, obtenga, compile, sustraiga, ofrezca, venda, intercambie, envíe, compre, intercepte, divulgue, modifique o emplee códigos personales, datos personales contenidos en ficheros, archivos, bases de datos o medios semejantes, incurrirá en pena de prisión de cuarenta y ocho (48) a noventa y seis (96) meses y en multa de 100 a 1000 salarios mínimos legales mensuales vigentes.”'
            ),
            SizedBox(height: 7,),
            Text(
              'III. PRINCIPIOS RECTORES PARA EL TRATAMIENTO DE DATOS PERSONALES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'Según lo establecido en el Título II de la Ley Estatutaria 1581 de 2012, la protección de datos personales se regirá por la aplicación armónica e integral de los siguientes principios: Principio de legalidad en el tratamiento de datos personales: El tratamiento de datos personales a que se refiere la Ley Estatutaria 1581 de 2012 es una actividad reglada que debe sujetarse a lo establecido en ella y en las demás disposiciones que la desarrollen. Principio de finalidad: El tratamiento de los datos personales debe obedecer a una finalidad legítima de acuerdo con la Constitución y la ley, la cual debe ser informada al Titular. Principio de libertad: El tratamiento de los datos personales sólo puede ejercerse con el consentimiento, previo, expreso e informado del Titular. Los datos personales no podrán ser obtenidos o divulgados sin previa autorización, o en ausencia de mandato legal o judicial que releve el consentimiento. Principio de veracidad o calidad: La información sujeta a tratamiento debe ser veraz, completa, exacta, actualizada, comprobable y comprensible. Se prohíbe el Tratamiento de datos parciales, incompletos, fraccionados o que induzcan a error. Principio de transparencia: En el Tratamiento de los datos personales debe garantizarse el derecho del Titular a obtener del Responsable del tratamiento o del Encargado del tratamiento, en cualquier momento y sin restricciones, información acerca de la existencia de datos que le conciernan. Principio de seguridad: La información sujeta a tratamiento por el Responsable del Tratamiento o Encargado del tratamiento a que se refiere la Ley Estatutaria 1581 de 2012, se deberá manejar con las medidas técnicas, humanas y administrativas que sean necesarias para otorgar seguridad a los registros evitando su adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento. Principio de confidencialidad: Todas las personas que intervengan en el tratamiento de datos personales que no tengan la naturaleza de públicos están obligadas a garantizar la reserva de la información, inclusive después de finalizada su relación con alguna de las labores que comprende el tratamiento, pudiendo sólo realizar suministro o comunicación de datos personales cuando ello corresponda al desarrollo de las actividades autorizadas en la Ley Estatutaria 1581 de 2012 y en los términos de la misma. Principio de acceso y circulación restringida: El tratamiento se sujeta a los límites que se derivan de la naturaleza de los datos personales, de las disposiciones de la Ley Estatutaria 1581 de 2012 y la Constitución. En este sentido, el tratamiento sólo podrá hacerse por personas autorizadas por el Titular y/o por las personas previstas en la mencionada ley.'
            ),
            SizedBox(height: 7,),
            Text(
              'IV. DERECHOS DE LOS TITULARES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'En cumplimiento de las garantías fundamentales consagradas en la Constitución y la ley, y sin perjuicio de lo dispuesto en las demás normas que regulen la materia, los Titulares de los datos personales podrán ejercer de forma gratuita e ilimitadamente los siguientes derechos: \nDerecho al acceso a su información personal objeto de tratamiento. \nDerecho a la actualización de los datos personales objeto de tratamiento. \nDerecho a la rectificación de los datos personales objeto de tratamiento. \nDerecho de oposición a que los datos personales sean objeto de tratamientoDerecho a solicitar la supresión de los datos personales cuando en el tratamiento no se respeten los principios, derechos y garantías constitucionales y legales. \nDerecho a solicitar prueba de la autorización otorgada para el tratamiento. \nDerecho a revocar el consentimiento para el tratamiento de los datos personales. \nDerecho a presentar quejas y reclamos ante la Superintendencia de Industria y Comercio por infracciones a lo dispuesto en la Ley Estatutaria 1581 de 2012 y las demás normas que la modifiquen, adicionen o complementen. \nDerecho a ser informado por parte del Responsable y/o Encargado del uso y tratamiento que se les dará a los datos personales, así como de las modificaciones y actualizaciones de las políticas de protección, medidas de seguridad y finalidades.',
            ),
            SizedBox(height: 7,),
            Text(
              'V. FORMA DE RECOLECTAR LOS DATOS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'Forma de recolección de los datos personales de los Usuarios/Clientes: \nLa recolección de datos personales de usuarios potenciales y usuarios de PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.S, se realizará de las siguientes formas:\n•	Mediante el almacenamiento automático de los datos de los usuarios que acceden a la plataforma de PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.S. por el uso de cookies. Algunos de los datos que se pueden almacenar automáticamente son las URL, el navegador utilizado, dirección IP entre otros.\n•	Mediante el intercambio de correos electrónicos.\n•	A través del acceso a páginas Web de la compañía www.paf.com.co.\n•	A través de llamadas telefónicas.\n•	Mediante eventos realizados por PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.S.\n•	Mediante las transmisión o transferencia por parte de Aliados estratégicos. \n\nForma de recolectar los datos de los Trabajadores o candidatos \n\n La recolección de datos personales de empleados se realizará de las siguientes formas:\n•	A través de las hojas de vida académicas de los candidatos.\n•	A través del contrato de trabajo o de prestación de servicios.\n•	A través de las hojas de vida académicas de los empleados.\n•	Mediante el uso de listas de entrada de los empleados a las instalaciones de la empresa.\n•	En el desarrollo de entrevistas de trabajo.\n•	Mediante envío de información de empresas que tenga la calidad de caza talentos y los titulares hayan suministrado los datos.\n•	Mediante formatos de afiliación a la EPS, ARLs.\n•	Por medio de afiliación a las plataformas web ofrecidas por PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.S.'
            ),
            
            SizedBox(height: 7,),
            Text(
              'VI. FINALIDADES DEL TRATAMIENTO DE LOS DATOS PERSONALES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'Los Datos Personales que recolecta PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.S., son incluidos en una Base de Datos a la cual tiene acceso el personal autorizado de PURIFICACIÓN Y ANALISIS DE FLUIDOS S.A.Sen ejercicio de sus funciones, advirtiendo que en ningún caso está autorizado el Tratamiento de la información para fines diferentes a los aquí descritos, y que le sean comunicados al Titular directamente a más tardar al momento de la recolección.'
            ),
            SizedBox(height: 7,),
            Text(
              'VII. PROCEDIMIENTO LEGAL PARA CONSULTAS QUEJAS Y RECLAMOS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7,),
            Text(
              'Las consultas, quejas o reclamos podrán ser presentados a través de un documento con las características que se describen en cada uno de los supuestos o mediante el formulario de consultas quejas y reclamos que podrán consultar en servicioalcliente@paf.com.co o al número 6019172134 colombia en la opción Centro de Ayuda.'
            ),
            SizedBox(height: 7,),
            Text(
              'Si tienes alguna pregunta o inquietud relacionada con estos Términos y Condiciones, puedes ponerte en contacto con nosotros a través de servicioalcliente@paf.com.co, o LLamar al (601) 917 21 34. Recuerda personalizar estos términos y condiciones según las necesidades específicas de tu aplicación y empresa, y considera consultar a un abogado para asegurarte de que cumplen con todas las leyes y regulaciones aplicables.'
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