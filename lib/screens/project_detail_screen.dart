import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.projectImageUrl.isNotEmpty)
              Image.network(
                project.projectImageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Gagal mengambil gambar.');
                },
              ),

            const SizedBox(height: 8),
            Text(project.title),

            const SizedBox(height: 8),
            const Text('Description'),
            Text(project.description),

            const SizedBox(height: 8),
            const Text('Tech Stack'),
            Text(project.techStack),

            const SizedBox(height: 8),
            const Text('Project URL'),
            Text(project.projectUrl),
          ],
        ),
      ),
    );
  }
}
