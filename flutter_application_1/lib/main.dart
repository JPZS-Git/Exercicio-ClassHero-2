import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca de Cursos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CursoScreen(),
    );
  }
}

class CursoScreen extends StatefulWidget {
  const CursoScreen({super.key}); 

  @override
  CursoScreenState createState() => CursoScreenState(); 
}

class CursoScreenState extends State<CursoScreen> {
  final TextEditingController _controller = TextEditingController();

  final Map<String, Map<String, String>> cursos = {
    "Flutter": {
      "duracao": "40 horas",
      "descricao": "Curso de desenvolvimento de apps móveis com Flutter."
    },
    "Dart": {
      "duracao": "30 horas",
      "descricao": "Curso da linguagem Dart, usada no Flutter."
    },
    "Banco de Dados": {
      "duracao": "50 horas",
      "descricao": "Curso de modelagem e consultas em bancos de dados."
    }
  };

  Map<String, String>? cursoEncontrado;

  void buscarCurso() {
    String nomeCurso = _controller.text.trim();
    setState(() {
      cursoEncontrado = cursos[nomeCurso];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca de Cursos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nome do curso',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: buscarCurso,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            cursoEncontrado != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duração: ${cursoEncontrado!['duracao'] ?? ''}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Descrição: ${cursoEncontrado!['descricao'] ?? ''}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  )
                : const Text('Curso não encontrado'),
          ],
        ),
      ),
    );
  }
}