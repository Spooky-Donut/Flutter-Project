import '../../domain/models/app_user.dart';

const mockUsers = [
  AppUser(
    name: 'Augusto',
    email: 'augusto@uninorte.edu.co',
    password: '1234',
    role: UserRole.teacher,
  ),
  AppUser(
    name: 'Maria',
    email: 'maria@uninorte.edu.co',
    password: '1234',
    role: UserRole.student,
  ),
];