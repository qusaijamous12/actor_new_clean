class ActorModel {
  final int id;
  final String? name;
  final String? image;
  final String ?status;
  final String? species;
  final String? gender;
  final List<dynamic> episode;
  final String? location;

  ActorModel({
    required this.id,
    this.name,
    this.image,
    this.species,
    this.gender,
    this.status,
    this.episode = const [],
    this.location,
  });

  factory ActorModel.fromJson(final Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
       name:  json['name'],
        image:  json['image'],
      species: json['species'],
      gender: json['gender'],
      status: json['status'],
      episode: json['episode'],
      location: json['location']!=null?json['location']['name']:null
    );
  }
}

// "id": 20,
// I/flutter ( 8746): ║                 "name": "Ants in my Eyes Johnson",
// I/flutter ( 8746): ║                 "status": "unknown",
// I/flutter ( 8746): ║                 "species": "Human",
// I/flutter ( 8746): ║                 "type": "Human with ants in his eyes",
// I/flutter ( 8746): ║                 "gender": "Male",
// I/flutter ( 8746): ║                 "origin": {name: unknown, url: },
// I/flutter ( 8746): ║                 "location": {name: Interdimensional Cable, url: https://rickandmortyapi.com/api/location/6},
// I/flutter ( 8746): ║                 "image": "https://rickandmortyapi.com/api/character/avatar/20.jpeg",
// I/flutter ( 8746): ║                 "episode": [https://rickandmortyapi.com/api/episode/8]
// I/flutter ( 8746): ║                 "url": "https://rickandmortyapi.com/api/character/20",
// I/flutter ( 8746): ║                 "created": "2017-11-04T22:34:53.659Z"
