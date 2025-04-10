import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Filmes!!!')),
        body: const Filme(),
      ),
    );
  }
}

class Filme extends StatefulWidget {
  const Filme({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<Filme> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final String jsonString = await rootBundle.loadString('assets/movie_descriptions.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      movies = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(movie["title"]),
                subtitle: Text(
                  "Descrição: ${movie["text"]} | Ano: ${movie["year"]}",
                ),
              ),
            );
          },
        );
  }
}