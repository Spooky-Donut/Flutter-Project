import 'package:flutter/material.dart';
import '../../../domain/models/app_user.dart';

// Pantalla principal
class HomeScreen extends StatelessWidget {
  final AppUser user;
  // Constructor
  const HomeScreen({super.key, required this.user});

  bool get isTeacher => user.role == UserRole.teacher;

  @override
  Widget build(BuildContext context) {
    // Lista de prueba
    final courses = [
      {'name': 'Programación Móvil', 'activities': 3},
      {'name': 'Compiladores', 'activities': 0},
      {'name': 'Proyecto Final', 'activities': 2},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDCD7D4),
      body: SafeArea(
        child: Column(
          children: [
            // Encabezado superior morado
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              decoration: const BoxDecoration(color: Color(0xFF4C3F6D)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // Icono en la parte superior derecha
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7C6A9F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.playlist_add_check_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Hola, ${user.name}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Zona principal
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.fromLTRB(18, 24, 18, 100),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      // Curso actual que se esta pintando en la lista
                      final course = courses[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2EEEB),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course['name'] as String,
                                      style: const TextStyle(
                                        color: Color(0xFF4C3F6D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${course['activities']} actividades",
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4C3F6D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  "Abrir",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Boton para crear curso, solo profesores
                  if (isTeacher)
                    Positioned(
                      right: 18,
                      bottom: 18,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4C3F6D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                        ),
                        child: const Text(
                          "+ Crear curso",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}