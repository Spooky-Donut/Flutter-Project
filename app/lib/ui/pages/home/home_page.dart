import 'package:flutter/material.dart';
import '../../../domain/models/app_user.dart';
import 'create_course.dart';

// Pantalla principal
class HomeScreen extends StatelessWidget {
  final AppUser user;
  // Constructor
  const HomeScreen({super.key, required this.user});

  bool get isTeacher => user.role == UserRole.teacher;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Lista de prueba
    final courses = [
      {'name': 'Programación Móvil', 'activities': 3},
      {'name': 'Compiladores', 'activities': 0},
      {'name': 'Proyecto Final', 'activities': 2},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF4c3f6d),
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
                        color: Color(0xFFE6E2DF),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Hola, ${user.name}",
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Zona principal
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
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
                            width: screenWidth * 0.9,
                            height: screenWidth * 0.25,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Color(0xFF7C6A9F),
                                width: 2,
                              ),
                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    "https://picsum.photos/500/500",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
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
                          onPressed: () {
                            mostrarCrearCurso(context);
                          },
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
                            style: TextStyle(color: Color(0xFFE6E2DF)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
