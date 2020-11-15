import 'package:hospital/shared/doctor.dart';
import 'package:hospital/shared/facility.dart';
import 'package:hospital/shared/partnerclass.dart';

List<Doctor> doctorList = [
  Doctor(name: 'XniN', specials: 'Spesialis Cinta'),
  Doctor(name: 'Christiani wal Islami', specials: 'Spesialis Agama'),
  Doctor(name: 'Muhammad Octane', specials: 'Spesialis Kaki-Kaki'),
  Doctor(name: 'Abdullah bin Bloodhounder', specials: 'Spesialis Mata'),
  Doctor(name: 'Uchiha Saburo', specials: 'Spesialis Katarak'),
  Doctor(name: 'Namikaze Yukikato', specials: 'Artis Sinetron'),

];



final List<Facility> facilities = [
  Facility(
    title: 'Kamar Operasi',
    date: '08 Juni 2001',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  Facility(
    title: 'Ruang Tunggu',
    date: '04 Juni 2002',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  Facility(
    title: 'Unit Gawat Darurat',
    date: '18 Mei 2019',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  Facility(
    title: 'Intensive Care Unit',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
];

final List<PartnerClass> partnerList = [
  PartnerClass(
    title: 'ALODOKTER',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  PartnerClass(
    title: 'Internasional SOS',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  PartnerClass(
    title: 'Oracle',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  PartnerClass(
    title: 'ALODOKTER',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  PartnerClass(
    title: 'Internasional SOS',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
  PartnerClass(
    title: 'Oracle',
    date: '18 Mei 2020',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla dolor, fringilla id imperdiet quis, vulputate ac est. Suspendisse nec erat eu augue pellentesque interdum. Morbi mattis lacus commodo nulla lacinia, eu gravida lorem sodales. Nulla pulvinar sollicitudin scelerisque. Nulla diam dui, dictum nec venenatis id, vehicula a turpis. Nulla eget molestie nunc. Aenean congue eget metus quis fermentum. Quisque consequat elit lorem, vel tristique ex commodo non. Nunc nec sapien a arcu feugiat porttitor a ac ipsum. Vestibulum nec tortor vel mauris euismod feugiat vitae a ligula. Sed feugiat nunc sit amet turpis pharetra, congue aliquam urna rhoncus. Nunc urna felis, convallis vitae orci a, rhoncus ultrices turpis.'
  ),
];
