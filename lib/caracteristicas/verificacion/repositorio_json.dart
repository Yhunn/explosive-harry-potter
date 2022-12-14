import 'dart:convert';
import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract class RepositorioJson {
  Future<Either<Problema, dynamic>> obtenerJsonPersonajes();
  Future<Either<Problema, dynamic>> obtenerJsonHechizos();
}

class RepositorioJsonReal extends RepositorioJson {
  @override
  Future<Either<Problema, dynamic>> obtenerJsonPersonajes() async {
    try {
      final respuestaJson = await http
          .get(Uri.parse('https://hp-api.onrender.com/api/characters'));
      String jsonPersonajes = respuestaJson.body;
      JsonDecoder decoder = const JsonDecoder();

      final jsonObject = decoder.convert(jsonPersonajes);
      return Right(jsonObject);
    } catch (error) {
      return Left(VersionIncorrectaJson());
    }
  }

  @override
  Future<Either<Problema, dynamic>> obtenerJsonHechizos() async {
    try {
      final respuestaJson =
          await http.get(Uri.parse('https://hp-api.onrender.com/api/spells'));
      String jsonHechizos = respuestaJson.body;
      JsonDecoder decoder = const JsonDecoder();

      final jsonObject = decoder.convert(jsonHechizos);
      return Right(jsonObject);
    } catch (error) {
      return Left(VersionIncorrectaJson());
    }
  }
}

class RepositorioJsonPruebas extends RepositorioJson {
  @override
  Future<Either<Problema, dynamic>> obtenerJsonHechizos() async {
    try {
      String jsonHechizos = """[
   {
      "name":"Aberto",
      "description":"Opens locked doors"
   },
   {
      "name":"Accio",
      "description":"Summons objects"
   },
   {
      "name":"Aguamenti",
      "description":"Summons water"
   },
   {
      "name":"Alohomora",
      "description":"Unlocks objects"
   },
   {
      "name":"Anapneo",
      "description":"Clears someone's airway"
   },
   {
      "name":"Aparecium",
      "description":"Reveals secret written messages"
   },
   {
      "name":"Apparate",
      "description":"A non-verbal transportation spell that allows a witch or wizard to instantly travel on the spot and appear at another location (disapparate is the opposite)"
   },
   {
      "name":"Ascendio",
      "description":"Propells someone into the air"
   }
  ]""";
      JsonDecoder decoder = const JsonDecoder();

      final jsonObject = decoder.convert(jsonHechizos);
      return Right(jsonObject);
    } catch (error) {
      return Left(VersionIncorrectaJson());
    }
  }

  @override
  Future<Either<Problema, dynamic>> obtenerJsonPersonajes() async {
    try {
      String jsonPersonajes = """
[
   {
      "name":"Harry Potter",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"male",
      "house":"Gryffindor",
      "dateOfBirth":"31-07-1980",
      "yearOfBirth":1980,
      "wizard":true,
      "ancestry":"half-blood",
      "eyeColour":"green",
      "hairColour":"black",
      "wand":{
         "wood":"holly",
         "core":"phoenix feather",
         "length":11
      },
      "patronus":"stag",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Daniel Radcliffe",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/harry.jpg"
   },
   {
      "name":"Hermione Granger",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"female",
      "house":"Gryffindor",
      "dateOfBirth":"19-09-1979",
      "yearOfBirth":1979,
      "wizard":true,
      "ancestry":"muggleborn",
      "eyeColour":"brown",
      "hairColour":"brown",
      "wand":{
         "wood":"vine",
         "core":"dragon heartstring",
         "length":null
      },
      "patronus":"otter",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Emma Watson",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/hermione.jpeg"
   },
   {
      "name":"Ron Weasley",
      "alternate_names":[
         "Dragomir Despard"
      ],
      "species":"human",
      "gender":"male",
      "house":"Gryffindor",
      "dateOfBirth":"01-03-1980",
      "yearOfBirth":1980,
      "wizard":true,
      "ancestry":"pure-blood",
      "eyeColour":"blue",
      "hairColour":"red",
      "wand":{
         "wood":"willow",
         "core":"unicorn tail-hair",
         "length":14
      },
      "patronus":"Jack Russell terrier",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Rupert Grint",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/ron.jpg"
   },
   {
      "name":"Draco Malfoy",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"male",
      "house":"Slytherin",
      "dateOfBirth":"05-06-1980",
      "yearOfBirth":1980,
      "wizard":true,
      "ancestry":"pure-blood",
      "eyeColour":"grey",
      "hairColour":"blonde",
      "wand":{
         "wood":"hawthorn",
         "core":"unicorn tail-hair",
         "length":10
      },
      "patronus":"",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Tom Felton",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/draco.jpg"
   },
   {
      "name":"Minerva McGonagall",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"female",
      "house":"Gryffindor",
      "dateOfBirth":"04-10-1925",
      "yearOfBirth":1925,
      "wizard":true,
      "ancestry":"",
      "eyeColour":"",
      "hairColour":"black",
      "wand":{
         "wood":"",
         "core":"",
         "length":null
      },
      "patronus":"tabby cat",
      "hogwartsStudent":false,
      "hogwartsStaff":true,
      "actor":"Dame Maggie Smith",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/mcgonagall.jpg"
   },
   {
      "name":"Cedric Diggory",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"male",
      "house":"Hufflepuff",
      "dateOfBirth":"",
      "yearOfBirth":1977,
      "wizard":true,
      "ancestry":"",
      "eyeColour":"grey",
      "hairColour":"brown",
      "wand":{
         "wood":"ash",
         "core":"unicorn hair",
         "length":12.25
      },
      "patronus":"",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Robert Pattinson",
      "alternate_actors":[
         
      ],
      "alive":false,
      "image":"https://hp-api.herokuapp.com/images/cedric.png"
   },
   {
      "name":"Cho Chang",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"female",
      "house":"Ravenclaw",
      "dateOfBirth":"",
      "yearOfBirth":null,
      "wizard":true,
      "ancestry":"",
      "eyeColour":"brown",
      "hairColour":"black",
      "wand":{
         "wood":"",
         "core":"",
         "length":null
      },
      "patronus":"swan",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Katie Leung",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/cho.jpg"
   },
   {
      "name":"Severus Snape",
      "alternate_names":[
         "Half-Blood Prince"
      ],
      "species":"human",
      "gender":"male",
      "house":"Slytherin",
      "dateOfBirth":"09-01-1960",
      "yearOfBirth":1960,
      "wizard":true,
      "ancestry":"half-blood",
      "eyeColour":"black",
      "hairColour":"black",
      "wand":{
         "wood":"",
         "core":"",
         "length":null
      },
      "patronus":"doe",
      "hogwartsStudent":false,
      "hogwartsStaff":true,
      "actor":"Alan Rickman",
      "alternate_actors":[
         
      ],
      "alive":false,
      "image":"https://hp-api.herokuapp.com/images/snape.jpg"
   },
   {
      "name":"Rubeus Hagrid",
      "alternate_names":[
         
      ],
      "species":"half-giant",
      "gender":"male",
      "house":"Gryffindor",
      "dateOfBirth":"06-12-1928",
      "yearOfBirth":1928,
      "wizard":true,
      "ancestry":"half-blood",
      "eyeColour":"black",
      "hairColour":"black",
      "wand":{
         "wood":"oak",
         "core":"",
         "length":16
      },
      "patronus":"",
      "hogwartsStudent":false,
      "hogwartsStaff":true,
      "actor":"Robbie Coltrane",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/hagrid.png"
   },
   {
      "name":"Neville Longbottom",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"male",
      "house":"Gryffindor",
      "dateOfBirth":"30-07-1980",
      "yearOfBirth":1980,
      "wizard":true,
      "ancestry":"pure-blood",
      "eyeColour":"",
      "hairColour":"blonde",
      "wand":{
         "wood":"cherry",
         "core":"unicorn tail-hair",
         "length":13
      },
      "patronus":"",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Matthew Lewis",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/neville.jpg"
   },
   {
      "name":"Lord Voldemort",
      "alternate_names":[
         "Tom Marvolo Riddle"
      ],
      "species":"human",
      "gender":"male",
      "house":"Slytherin",
      "dateOfBirth":"31-12-1926",
      "yearOfBirth":1926,
      "wizard":true,
      "ancestry":"half-blood",
      "eyeColour":"red",
      "hairColour":"bald",
      "wand":{
         "wood":"yew",
         "core":"phoenix feather",
         "length":13.5
      },
      "patronus":"",
      "hogwartsStudent":false,
      "hogwartsStaff":false,
      "actor":"Ralph Fiennes",
      "alternate_actors":[
         
      ],
      "alive":false,
      "image":"https://hp-api.herokuapp.com/images/voldemort.jpg"
   }
]
""";
      JsonDecoder decoder = const JsonDecoder();

      final jsonObject = decoder.convert(jsonPersonajes);
      return Right(jsonObject);
    } catch (error) {
      return Left(VersionIncorrectaJson());
    }
  }
}
