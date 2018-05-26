class Pokemon {
  String name;
  
  // Below attributes will be retrieved by API
  int id;
  PImage imgFront;
  PImage imgBack;
  
  Pokemon(String name) {
    this.name = name;
    
    GetRequest get = new GetRequest("https://pokeapi.co/api/v2/pokemon/" + name + "/");
    get.addHeader(
  }
  
}
