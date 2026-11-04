import 'dart:convert';
import 'package:http/http.dart';
import 'package:pot2/models/dog_model.dart';

class DogService {
  static final _URL =
      'https://api.thedogapi.com/v1/images/search?limit=20&has_breeds=1';

  static Future<List<Dog>> getDogs() async {
    List<Dog> perros = [];

    Response response = await get(
      Uri.parse(_URL),
      headers: {
        'x-api-key':
            'live_qS2S1nC32ohMtmERelI5EFeVrqezGX4zUbM4fEXoCb3hplsHPmRPLNx0NrnByPG7',
      },
    );

    if (response.statusCode != 200) return perros;

    final List datos = jsonDecode(response.body);
    final List<Dog> todos = datos.map((x) => Dog.fromJson(x)).toList();
    perros.addAll(todos.where((d) => d.url.isNotEmpty && d.name != 'Desconocido'));
    await Future.delayed(Duration(seconds: 1));
    return perros;
  }
}
