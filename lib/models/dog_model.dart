class Dog {
  final String id;
  final String url;
  final String name;
  final String lifeSpan;
  final String origin;
  final String temperament;
  final String breedGroup;

  Dog({
    required this.id,
    required this.url,
    required this.name,
    required this.lifeSpan,
    required this.origin,
    required this.temperament,
    required this.breedGroup,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    final List breeds = json['breeds'] ?? [];
    final Map<String, dynamic>? breed = breeds.isNotEmpty ? breeds[0] : null;

    return Dog(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      name: breed != null ? (breed['name'] ?? 'Desconocido') : 'Desconocido',
      lifeSpan: breed != null && breed['life_span'] != null
          ? breed['life_span']
          : '10 - 15',
      origin: breed != null &&
              breed['origin'] != null &&
              breed['origin'].toString().trim().isNotEmpty
          ? breed['origin']
          : 'Desconocido',
      temperament: breed != null && breed['temperament'] != null
          ? breed['temperament']
          : 'Dócil y sociable',
      breedGroup: breed != null && breed['breed_group'] != null
          ? breed['breed_group']
          : 'Compañía',
    );
  }
}
