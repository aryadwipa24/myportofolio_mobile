import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/education.dart';

class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({super.key, required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(education.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (education.image != null && education.image!.isNotEmpty)
              Image.network(
                education.image!,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Gagal mengambil gambar.');
                },
              )
            else
              const Icon(Icons.broken_image),

            const SizedBox(height: 8),
            Text("Nama Institusi Pendidikan: ${education.title}"),

            const SizedBox(height: 8),
            Text("Durasi Pendidikan: ${education.start} - ${education.end ?? 'Present'}"),

            const SizedBox(height: 8),
            Text("Kategori: ${education.category}"),
          ],
        ),
      ),
    );
  }
}