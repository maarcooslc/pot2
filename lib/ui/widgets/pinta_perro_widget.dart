import 'package:flutter/material.dart';
import 'package:pot2/models/dog_model.dart';

class PintaPerros extends StatefulWidget {
  const new({super.key, required this.perros});

  final List<Dog> perros;

  @override
  State<PintaPerros> createState() => _PintaPerrosState();
}

class _PintaPerrosState extends State<PintaPerros> {
  int pos = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Image.network(
              widget.perros[pos].url,
              width: 250,
              height: 250,
            ),
          ),
          Text(
            widget.perros[pos].name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            widget.perros[pos].breedGroup,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vida: ${widget.perros[pos].lifeSpan} años',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 30),
                Text(
                  widget.perros[pos].origin,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text(
              widget.perros[pos].temperament,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (pos == 0)
                    ? Container()
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            pos--;
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                SizedBox(width: 100),
                (pos == widget.perros.length - 1)
                    ? Container()
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            pos++;
                          });
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
