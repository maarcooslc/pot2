import 'package:pot2/models/dog_model.dart';
import 'package:pot2/services/dog_service.dart';
import 'package:pot2/ui/widgets/pinta_perro_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dog APP'), elevation: 10),
      body: Center(
        child: FutureBuilder(
          future: DogService.getDogs(),
          builder: (context, AsyncSnapshot<List<Dog>> data) {
            return (data.hasData)
                ? PintaPerros(perros: data.data!)
                : CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
