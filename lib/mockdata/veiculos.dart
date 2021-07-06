import 'package:flutter/material.dart';

import '../models/veiculos.dart';

const VEICULOS_MOCK = const [
  Veiculos(
      id: 'amarok',
      id_montadora: 'vw',
      modelo: 'AMAROK CD2.0 16V/S CD2.0 16V TDI 4x2 Die',
      ano: '2013',
      combustivel: 'diesel',
      valor: 72007.00,
      imagem:
          'https://img.clasf.com.br/2019/02/06/Volkswagen-Amarok-Cd2-0-16vS-Cd2-0-16v-Tdi-4x4-Die-20190206155056.7982230015.jpg'),
  Veiculos(
      id: 'fusca',
      id_montadora: 'vw',
      modelo: 'Fusca 2.0 R-Line TSI 16V Aut.',
      ano: '2016',
      valor: 72007.00,
      combustivel: 'gasolina',
      imagem:
          'https://motos-motor.com.br/c/wp-content/uploads/precos-tabela-vw-volkswagen-fusca-20-r-line-tsi-16v-aut.jpg'),
  Veiculos(
      id: 'uno',
      id_montadora: 'ft',
      modelo: 'UNO ECONOMY Celeb. 1.4 EVO F. Flex 8V 4p',
      ano: '2014',
      valor: 30594.00,
      combustivel: 'flex',
      imagem:
          'https://seminovoscarros.com.br/wp-content/uploads/2020/07/uno-2021.jpg'),
  Veiculos(
      id: 'punto',
      id_montadora: 'ft',
      modelo: 'Punto ESSENCE 1.6 Flex 16V 5p',
      ano: '2017',
      valor: 43822.00,
      combustivel: 'flex',
      imagem:
          'https://combustivel.app/imgs/t650/consumo-punto-essence-1-6-16v-5.jpg'),
  Veiculos(
      id: 'eco',
      id_montadora: 'fr',
      modelo: 'EcoSport FREESTYLE 1.5 12V Flex 5p Mec.',
      ano: '2017',
      valor: 81127.00,
      combustivel: 'flex',
      imagem:
          'https://combustivel.app/imgs/t650/consumo-punto-essence-1-6-16v-5.jpg'),
  Veiculos(
      id: 'mustang',
      id_montadora: 'fr',
      modelo: 'Mustang MACH 1 5.0 V8',
      ano: '2021',
      valor: 524620.00,
      combustivel: 'alcool',
      imagem:
          'https://1.bp.blogspot.com/-yVMKg2ww-nE/YHngkfK388I/AAAAAAADHfw/eg4AA8880o4XwdtFYf3j4N6j-Z5-JUF5QCLcBGAsYHQ/s1246/Mach1.png'),
  Veiculos(
      id: '206',
      id_montadora: 'pg',
      modelo: '206 Sensation 1.4 Flex 8V 5p',
      ano: '2008',
      valor: 12930.00,
      combustivel: 'gasolina',
      imagem:
          'https://1.bp.blogspot.com/-yVMKg2ww-nE/YHngkfK388I/AAAAAAADHfw/eg4AA8880o4XwdtFYf3j4N6j-Z5-JUF5QCLcBGAsYHQ/s1246/Mach1.png'),
  Veiculos(
      id: 'skywalker',
      id_montadora: 'pg',
      modelo: '2008 SKYWALKER 1.6 Turbo Flex 16V Aut.',
      ano: '2022',
      valor: 107229.00,
      combustivel: 'alcool',
      imagem:
          'https://cdn.autopapo.com.br/box/uploads/2019/05/13184852/novo_peugeot_2008_frente_2-1800x1200.jpg'),
  Veiculos(
      id: '355',
      id_montadora: 'fe',
      modelo: '355 Berlinetta',
      ano: '1995',
      valor: 164580.00,
      combustivel: 'gasolina',
      imagem:
          'https://www.pastorecc.com.br/site/photos/cars/640/bg_107661078954931e5aae18e.JPG'),
  Veiculos(
      id: '456',
      id_montadora: 'fe',
      modelo: '456 GT',
      ano: '2000',
      valor: 241424.00,
      combustivel: 'gasolina',
      imagem:
          'https://assets.catawiki.nl/assets/2017/3/29/a/b/2/ab2c58a0-147d-11e7-9d20-c4b235c2a055.jpg'),
  Veiculos(
      id: 'duster',
      id_montadora: 're',
      modelo: 'DUSTER Intense 1.6 16V Flex Aut.',
      ano: '2022',
      valor: 90652.00,
      combustivel: 'flex',
      imagem:
          'https://renault.itavema.com.br/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/n/o/novo_duster_intense_1.6_cvt_editado_1_.jpg'),
  Veiculos(
      id: 'logan',
      id_montadora: 're',
      modelo: 'LOGAN Zen Flex 1.6 16V 4p Mec.',
      ano: '2020',
      valor: 56147.00,
      combustivel: 'flex',
      imagem:
          'https://renault.itavema.com.br/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/n/o/novo-logan-01_1_1.jpg'),
  Veiculos(
      id: 'compass',
      id_montadora: 'jp',
      modelo: 'COMPASS LONGITUDE 2.0 4x4 Dies. 16V Aut.',
      ano: '2017',
      valor: 125514.00,
      combustivel: 'diesel',
      imagem:
          'https://s3.amazonaws.com/s3.carro57.com.br/FC/5016/2322374_0_G_7f513dfddb.jpg'),
  Veiculos(
      id: 'renegade',
      id_montadora: 'jp',
      modelo: 'Renegade Longitude 2.0 4x4 TB Diesel Aut',
      ano: '2018',
      valor: 107284.00,
      combustivel: 'diesel',
      imagem:
          'https://cdn.revendamais.com.br/FC/4993/2999802_0_B_a53fdbde1b.jpg'),
];
