import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show required;

class RappiCategory {
  const RappiCategory({
    @required this.name,
    @required this.products,
  });
  final String name;
  final List<RappiProduct> products;
}

class RappiProduct {
  const RappiProduct({
    @required this.name,
    @required this.description,
    @required this.image,
  });
  final String name;
  final String description;
  final String image;
}

const rappiCategories = [
  RappiCategory(name: 'Grupo 1: Leche y derivados.', products: [
    RappiProduct(
        name: 'Leche pasteurizada',
        description:
            ' la que ha sido sometida al proceso de pasteurización, estandarizada o no, para cumplir con las especificaciones descritas en la NOM en cuanto a contenido de lactosa, grasa, sólidos totales, caseína y otros ingredientes',
        image: 'assets/nutri/grupo_1_1.png'),
    RappiProduct(
        name: 'Leche ultrapasteurizada',
        description:
            'La que ha sido sometida al proceso de pasteurización, estandarizada o no, para cumplir con las especificaciones descritas.',
        image: 'assets/nutri/grupo_1_2.png'),
    RappiProduct(
        name: 'Leche microfiltrada ultra',
        description:
            'La que ha sido sometida al proceso de ultrapasteurización, estandarizada o no, para cumplir con las especificaciones descritas.',
        image: 'assets/nutri/grupo_1_3.png'),
    RappiProduct(
        name: 'Leche evaporada',
        description:
            'Leche que se obtiene de la fase de leche descremada separada, microfiltrada y pasteurizada y posteriormente adicionada o no de crema ultrapasteurizada. El uso de empaques y envases asépticos protege al producto de reincidencia de infecciones y reduce al mínimo cualquier modificación ya sea fisicoquímica u organoléptica.',
        image: 'assets/nutri/grupo_1_4.png'),
    RappiProduct(
        name: 'Leche condensada azucarada',
        description:
            'La que ha sido obtenida por la eliminación parcial del agua de la leche hasta obtener una determinada concentración de sólidos de leche no grasos y grasa butírica, estandarizada o no, para cumplir con las especificaciones.',
        image: 'assets/nutri/grupo_1_5.png'),
    RappiProduct(
        name: 'Leche en polvo o leche deshidratada',
        description:
            'La que ha sido obtenida mediante la evaporación del agua de la leche a través de presión reducida, a la que se le ha agregado sacarosa y/o dextrosa u otro edulcorante.',
        image: 'assets/nutri/grupo_1_6.png'),
    RappiProduct(
        name: 'Leche concentrada',
        description:
            'La que se obtiene por la remoción parcial de agua de la leche, ya sea por ultrafiltración, ósmosis inversa o por la adición de productos propios de la leche hasta alcanzar la concentración deseada, para cumplir con las especificaciones descritas.',
        image: 'assets/nutri/grupo_1_7.png'),
    RappiProduct(
        name: 'Leche rehidratada',
        description:
            'La que se obtiene mediante la adición de agua (para uso y consumo humano o purificada) a la leche en polvo, y estandarizada con grasa butírica en cualquiera de sus formas, en las cantidades suficientes para que cumpla con las especificaciones descritas.',
        image: 'assets/nutri/grupo_1_8.png'),
    RappiProduct(
        name: 'Leche reconstituida',
        description:
            'La elaborada a partir de leche en polvo descremada o ingredientes propios de la leche, tales como caseína, grasa butírica, suero de leche, agua para uso y consumo humano, con un contenido mínimo de 30 g por litro de proteína propia de la leche y 80% de caseína con respecto a proteína total.',
        image: 'assets/nutri/grupo_1_9.png'),
    RappiProduct(
        name: 'Leche deslactosada',
        description:
            'La que ha sido sometida a un proceso de degradación de la lactosa por medio de la lactasa para cumplir con las especificaciones descritas.',
        image: 'assets/nutri/grupo_1_10.png'),
    RappiProduct(
        name: 'Leche saborizada',
        description:
            'Cualquiera de las denominaciones incluidas en la presente norma oficial mexicana, a la que se ha incorporado de otros ingredientes como saborizantes, edulcorantes y colorantes naturales o artificiales, y que contiene al menos 85% de leche apta para consumo humano, para cumplir con las especificaciones descritas.',
        image: 'assets/nutri/grupo_1_11.png'),
  ]),
  RappiCategory(name: 'Grupo 2: Carnes, pescados y huevos.', products: [
    RappiProduct(
        name: 'Carne de vacuno',
        description:
            'La carne procedente de vacas y terneras se caracteriza por tener un alto contenido en sarcosina, que proporciona energía a los músculos.',
        image: 'assets/nutri/grupo2_1.1.png'),
    RappiProduct(
        name: 'Carne de aves',
        description:
            'Se trata de un tipo de carne de muy fácil digestión, por lo que sirve para regular los niveles de colesterol del cuerpo.',
        image: 'assets/nutri/grupo2_1.2.png'),
    RappiProduct(
        name: 'Carne de conejo',
        description:
            'Se caracteriza por ser muy poco grasa y, las grasas que contiene de forma natural son insaturadas, por lo que resulta saludable.',
        image: 'assets/nutri/grupo2_1.3.png'),
    RappiProduct(
        name: 'Carne de puerco',
        description:
            'Su alto contenido en proteínas le aporta un valor biológico a tener en cuenta a la hora de consumirla. También tiene un alto contenido en minerales como el zinc, el magnesio, el potasio o el fósforo.',
        image: 'assets/nutri/grupo2_1.4.png'),
    RappiProduct(
        name: 'Boquerón',
        description:
            'El boquerón es un pescado azul que contienen 21,50 gramos de proteínas, no contienen carbohidratos, contienen 6 gramos de grasa por cada 100 gramos y no contienen azúcar, aportando 142 calorías a la dieta.',
        image: 'assets/nutri/grupo2_1.5.png'),
    RappiProduct(
        name: 'Carne de cabra',
        description:
            'La carne de cabra cuenta con propiedades dietéticas e hipocalóricas.',
        image: 'assets/nutri/grupo2_1.6.png'),
    RappiProduct(
        name: 'Carne de oveja',
        description:
            'La carne de oveja posee un alto contenido en vitamina B12 y buenos niveles de hierro y selenio, muy eficaz previniendo los ataques de asma.',
        image: 'assets/nutri/grupo2_1.1.png'),
    RappiProduct(
        name: 'Sardina',
        description:
            'Es muy buena fuente de omega-3, que ayudan a disminuir los niveles de colesterol y de triglicéridos, además de aumentar la fluidez de la sangre, lo que disminuye el riesgo de aterosclerosis y trombosis.',
        image: 'assets/nutri/grupo2_2.1.png'),
    RappiProduct(
        name: 'Huevos de pato',
        description:
            'Son ligeramente más grandes que los huevos de gallina y su contenido de gracia también es mayor. Se compone de proteínas, vitaminas: A, E, B2, B5 y minerales: fósforo, hierro calcio y potasio.',
        image: 'assets/nutri/grupo2_3.1.png'),
    RappiProduct(
        name: 'Huevos de avestruz',
        description:
            'Uno de los mayores aportes de los huevos de avestruz es su bajo nivel de colesterol respecto con el de gallina; además contiene menos grasas. Una buena opción para los que tienen problemas del corazón u obesidad.',
        image: 'assets/nutri/grupo2_3.4.png'),
  ]),
  RappiCategory(name: 'Grupo 3: Patatas, legumbres, frutos secos.', products: [
    RappiProduct(
        name: 'Lentejas',
        description:
            'Son una buena opción para obtener proteínas vegetales, aunque las lentejas destacan sobre todo por su riqueza en hierro dentro de las legumbres.',
        image: 'assets/nutri/grupo3_3.1.png'),
    RappiProduct(
        name: 'Garbanzos',
        description:
            'Los garbanzos resultan ser buena fuente de proteínas vegetales y fibra, pero destaca su contenido en calcio, potasio, magnesio y hierro vegetal. ',
        image: 'assets/nutri/grupo3_3.2.png'),
    RappiProduct(
        name: 'Alubias',
        description:
            'Son de las legumbres con más fibra y por ello, producen gran saciedad en nuestro organismo.',
        image: 'assets/nutri/grupo3_3.3.png'),
    RappiProduct(
        name: 'Habas secas',
        description:
            'Las habas secas son la opción con más proteínas vegetales y fibra, por lo que su poder saciante es elevado, así como también su ayuda contra el estreñimiento.',
        image: 'assets/nutri/grupo3_3.4.png'),
    RappiProduct(
        name: 'Guisantes secos',
        description:
            'Son otra legumbre que podemos sumar a nuestra dieta, resultando una opción rica en potasio, magnesio y vitaminas del grupo B entre las que destaca su contenido en ácido fólico.',
        image: 'assets/nutri/grupo3_3.5.png'),
    RappiProduct(
        name: 'Cacahuate',
        description:
            'Los cacahuetes son una legumbre oleosa, es decir, aportan grasas y proteínas en abundancia con poca proporción de hidratos.',
        image: 'assets/nutri/grupo3_3.6.png'),
  ]),
  RappiCategory(name: 'Grupo 4: Verduras y Hortalizas.', products: [
    RappiProduct(
        name: 'Espinacas',
        description:
            'Es una gran fuente de calcio, vitaminas, hierro y antioxidantes. Debido a su contenido en calcio y hierro, son muy recomendables para las dietas sin carne o sin lácteos.',
        image: 'assets/nutri/grupo_4_1.png'),
    RappiProduct(
        name: 'Brócoli',
        description:
            'Considerada como una de las hortalizas con mayor cantidad de nutrientes proporciona gran cantidad de vitamina C, ácido fólico y betacaroteno conocidos por sus propiedades antioxidantes, su bajo aporte de calorías (solo 39calorias x 100gr) la hacen ideal para dietas adelgazantes.',
        image: 'assets/nutri/grupo_4_2.png'),
    RappiProduct(
        name: 'Remolacha',
        description:
            'Su zumo te puede ayudar a controlar la presión arterial y la salud cardiovascular. También son muy buenos para diabéticos, porque contienen un antioxidante llamado ácido alfa lipoico.',
        image: 'assets/nutri/grupo_4_3.png'),
    RappiProduct(
        name: 'Zanahorias',
        description:
            'La zanahoria beneficia nuestra vista y la salud de nuestra piel, pero su composición rica en vitaminas y minerales reporta otros muchos beneficios para nuestro organismo.',
        image: 'assets/nutri/grupo_4_4.png'),
    RappiProduct(
        name: 'Kale',
        description:
            'Es una verdura muy baja en calorías y que aporta una gran cantidad de nutrientes esenciales como calcio, vitaminas C y K, fibra y antioxidantes; todo un completo alimento que te conviene incluir en la dieta.',
        image: 'assets/nutri/grupo_4_5.png'),
    RappiProduct(
        name: 'Tomate',
        description:
            'Es una excelente fuente de fibra, así como de potasio, fosforo y vitamina C y E. Reduce el colesterol y protege el corazón, contrarresta los efectos del tabaco, mejora la visión, mantiene el intestino sano, reduce la hipertensión y alivia la diabetes.',
        image: 'assets/nutri/grupo_4_6.png'),
    RappiProduct(
        name: 'Ajo',
        description:
            'Es un espantaenfermedades cargado de propiedades nutritivas y beneficios para la salud (los compuestos sulfúricos y sus múltiples fitonutrientes, le dieron esta fama). Posee un alto valor nutritivo y contiene muy pocas calorías.',
        image: 'assets/nutri/grupo_4_7.png'),
    RappiProduct(
        name: 'Cebolla',
        description:
            'Es rica en minerales como el potasio, el fosforo, el magnesio, el azufre, el cobre, el calcio y vitaminas C, A, E y B. Regula el funcionamiento del estómago, reduce el colesterol, los triglicéridos, inhibe la formación de trombos, ayuda a controlar la hiperglucemia y un excelente antiparasitario.',
        image: 'assets/nutri/grupo_4_8.png'),
    RappiProduct(
        name: 'Repollo',
        description:
            'El Repollo, contiene algunas vitaminas de complejo B, y además vitamina C, E, K, U, betacaroteno, biotina, folato. Es bajo en calorías e ideal para preparar ensaladas.',
        image: 'assets/nutri/grupo_4_9.png'),
    RappiProduct(
        name: 'Berenjena',
        description:
            'Es rica en calcio potasio y vitaminas A, B y C, la piel es compacta y brillante debemos fijarnos en la frescura del extremo del tallo. (contiene solo 17 calorías x 100gr) por su alto contenido en agua lo hace ideal para ser incluida en dietas para bajar peso',
        image: 'assets/nutri/grupo_4_10.png'),
  ]),
  RappiCategory(name: 'Grupo 5: Frutas.', products: [
    RappiProduct(
        name: 'Plátano',
        description:
            'Los plátanos son ricos en calorías, fibra, carbohidratos, vitaminas, potasio y proteínas. Es por ello que son un elemento fundamental en la dieta diaria.',
        image: 'assets/nutri/grupo5_1.png'),
    RappiProduct(
        name: 'Sandia',
        description:
            'Tiene gran cantidad de nutrientes y proporciona muchas vitaminas, minerales y antioxidantes, además de tener muy pocas calorías y resultar refrescante.',
        image: 'assets/nutri/grupo5_2.png'),
    RappiProduct(
        name: 'Manzana',
        description:
            'La manzana contiene algunos de los elementos más importantes y vitales de nuestro cuerpo, como la sacarosa, la glucosa o la albúmina. Además, también cuenta con calcio, fósforo, hierro, potasio y vitaminas B y C.',
        image: 'assets/nutri/grupo5_3.png'),
    RappiProduct(
        name: 'Uvas',
        description:
            'Aporta pocas calorías, una gran cantidad de agua (lo que facilita la hidratación del cuerpo), fibras, azúcares, vitaminas y minerales.',
        image: 'assets/nutri/grupo5_4.png'),
    RappiProduct(
        name: 'Mango',
        description:
            'El mango es un alimento de sabor exquisito, de fácil consumo y, además, muy saludable. Razones por las que se recomienda a cualquier edad. Ayuda a perder peso y depurar el cuerpo, además de su contenido en vitamina C y minerales varios.',
        image: 'assets/nutri/grupo5_5.png'),
    RappiProduct(
        name: 'Melón',
        description:
            'Por su bajo contenido calórico y efectos diuréticos el melón es muy recomendable para dietas adelgazantes.',
        image: 'assets/nutri/grupo5_6.png'),
    RappiProduct(
        name: 'Naranja',
        description:
            'La naranja contiene grandes cantidades de vitamina C por lo que son fuente de antioxidantes. Facilita la absorción de hierro y refuerzan el sistema inmunológico, la defensa del cuerpo contra los gérmenes.',
        image: 'assets/nutri/grupo5_7.png'),
    RappiProduct(
        name: 'Mandarina',
        description:
            'La mandarina es una gran aliada para combatir las arrugas y en el proceso de envejecimiento de la piel, debido a sus antioxidantes. Por eso también se usa en mascarillas y cremas.',
        image: 'assets/nutri/grupo5_8.png'),
  ]),
  RappiCategory(
      name: 'Grupo 6: Cereales y derivados, azúcar y dulces.',
      products: [
        RappiProduct(
            name: 'Maíz',
            description:
                'Es un alimento muy completo, que contiene muchas vitaminas y minerales que favorecen nuestro metabolismo. ',
            image: 'assets/nutri/grupo6_1.png'),
        RappiProduct(
            name: 'Trigo',
            description:
                'Es una fuente de aminoácidos esenciales (que el cuerpo no puede producir por su cuenta) como la valina y la fenilalanina.',
            image: 'assets/nutri/grupo6_2.png'),
        RappiProduct(
            name: 'Arroz',
            description:
                'El arroz es un cereal con muchas propiedades nutritivas, previene muchas enfermedades y es delicioso rojo, blanco, amarillo o verde y lo mejor es que combina con todos los platillos',
            image: 'assets/nutri/grupo6_3.png'),
        RappiProduct(
            name: 'Cebada',
            description:
                'La cebada es un alimento que se usa desde las épocas antiguas para satisfacer las necesidades nutricionales humanas. Contiene un bajo nivel de grasas y sodio, y en cambio, posee gran cantidad de fibra soluble y proteínas, calcio, fósforo y potasio.',
            image: 'assets/nutri/grupo6_4.png'),
        RappiProduct(
            name: 'Sorgo ',
            description:
                'El sorgo es un cereal más rico en proteínas y destaca por contener un menor aporte calórico, con menos hidratos de carbono y grasas. ',
            image: 'assets/nutri/grupo6_5.png'),
        RappiProduct(
            name: 'Mijo',
            description:
                'Es un término colectivo que abarca varias gramíneas de ciclo anual y semillas pequeñas cultivadas por sus granos, especialmente en tierras marginales localizadas en zonas áridas de regiones templadas, subtropicales o tropicales. ',
            image: 'assets/nutri/grupo6_6.png'),
        RappiProduct(
            name: 'Pan',
            description:
                'Es un alimento básico que forma parte de la dieta tradicional en Europa, Medio Oriente, India, América y Oceanía. Se suele preparar mediante el horneado de una masa, elaborada fundamentalmente con harina de cereales, sal y agua.',
            image: 'assets/nutri/grupo6_7.png'),
        RappiProduct(
            name: 'Pasta: ',
            description:
                'Se denomina pasta a los alimentos preparados con una masa cuyo ingrediente básico es la harina, mezclada con agua, y a la cual se puede añadir sal, huevo u otros ingredientes, conformando un producto que generalmente se cuece en agua hirviendo.',
            image: 'assets/nutri/grupo6_8.png'),
        RappiProduct(
            name: 'Cereales: ',
            description:
                'Los cereales contienen almidón, que es el componente principal de los alimentos humanos. El germen de la semilla contiene lípidos en proporción variable que permite la extracción de aceite vegetal de ciertos cereales.',
            image: 'assets/nutri/grupo6_9.png'),
        RappiProduct(
            name: 'Carne: ',
            description:
                'La carne aporta proteínas de alto valor biológico, vitamina B12, minerales como el hierro que facilita la absorción del mismo en legumbres o cereales y gran cantidad de agua.',
            image: 'assets/nutri/grupo6_10.png'),
        RappiProduct(
            name: 'Pescado: ',
            description:
                'Son alimentos de origen animal con una gran cantidad de proteínas de excelente valor biológico. Su alto contenido en ácidos grasos poliinsaturados omega-3 resulta beneficioso para la salud al disminuir los niveles de colesterol y triglicéridos en sangre.',
            image: 'assets/nutri/grupo6_11.png'),
      ]),
  RappiCategory(name: 'Grupo 7: Grasas, aceite y mantequilla.', products: [
    RappiProduct(
        name: 'Pescado Azul:',
        description:
            'Incluye todo tipo de pescados con más grasas en su composición entre las que predominan los ácidos grasos poliinsaturados que nuestro cuerpo no puede producir. Entre estos destaca el omega 3, concretamente el ácido docosahexanoico (DHA) y ácido eicosapentanoico (EPA).',
        image: 'assets/nutri/grupo7_1.png'),
    RappiProduct(
        name: 'Frutos Secos:',
        description:
            'Los frutos secos en todas sus variantes son fuente de grasas buenas para el organismo, pero especialmente las nueces son concentradas en este nutriente dentro de los cuales destaca el omega 3 y omega 6.',
        image: 'assets/nutri/grupo7_2.png'),
    RappiProduct(
        name: 'Semillas de chilla',
        description:
            'Pipas de girasol, pipas de calabaza, semillas de chía, de linaza, de sésamo u otras son todas fuentes concentradas de nutrientes para el organismo dentro de las cuales destacan las grasas insaturadas beneficiosas para el organismo.',
        image: 'assets/nutri/grupo7_3.png'),
    RappiProduct(
        name: 'Aguacate:',
        description:
            'Es una fruta fresca oleosa, es decir, que a diferencia de otras frutas posee grasas entre las que predominan los ácidos grasos monoinsaturados.',
        image: 'assets/nutri/grupo7_4.png'),
    RappiProduct(
        name: 'Aceitunas:',
        description:
            'Al igual que el aguacate, las aceitunas son frutas ricas en grasas dentro de las cuales destacan las grasas monoinsaturadas que se acompañan de otros nutrientes buenos para el organismo como potasio, magnesio y calcio.',
        image: 'assets/nutri/grupo7_5.png'),
    RappiProduct(
        name: 'Cacahuate:',
        description:
            'Aunque solemos mencionarlo junto a los frutos secos, el cacahuete es una legumbre oleosa, es decir, es fuente de grasas buenas para el organismo entre las que predominan los ácidos grasos monoinsaturados y poliinsaturados.',
        image: 'assets/nutri/grupo7_6.png'),
    RappiProduct(
        name: 'nueces:',
        description:
            'El segundo de los alimentos con aceites naturales son las nueces. Estas también son ricas en ácidos grasos omega 3 por lo que facilitan la reducción de colesterol malo (LDL) en la sangre y mejora la salud de las venas y del corazón.',
        image: 'assets/nutri/grupo7_7.png'),
    RappiProduct(
        name: 'Queso',
        description:
            'El queso no suele asociarse con los alimentos con aceites naturales, pero lo es, a menos que elijas opciones light o bajas en grasa. Su contenido de aceites se debe a que se produce a partir de la leche entera.',
        image: 'assets/nutri/grupo7_8.png'),
    RappiProduct(
        name: 'Pescados grasos',
        description:
            'Las sardinas y el salmón son dos buenos ejemplos de alimentos con aceites naturales. Estos son ricos en ácidos grasos omega 3, calcio y vitaminas y son muy comunes en la dieta mediterránea.',
        image: 'assets/nutri/grupo7_9.png'),
    RappiProduct(
        name: 'Aceite vegetal:',
        description:
            'El último de los alimentos con aceites naturales que debes incluir regularmente en tu dieta son solo aceites vegetales. Estos incluyen al aceite de oliva, aceite de coco y cualquier otro comestible de buena calidad.',
        image: 'assets/nutri/grupo7_10.png'),
  ]),
];
