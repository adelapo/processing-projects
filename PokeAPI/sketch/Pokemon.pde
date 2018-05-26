class Pokemon {
  String name;
  
  // Below attributes will be retrieved by API
  int id;
  PImage imgFront;
  PImage imgShiny;
  PImage imgBack;
  
  Pokemon(String name) {
    this.name = name;
    
    GetRequest getReq = new GetRequest("https://pokeapi.co/api/v2/pokemon/" + name + "/");
    // According to the PokeAPI documentation, we need to add a header
    getReq.addHeader("User-Agent", "Mozilla/5.0");
    getReq.send();
    
    JSONObject json = parseJSONObject(getReq.getContent());
    
    this.id = json.getInt("id");
    
    JSONObject sprites = json.getJSONObject("sprites");
    String imgLinkFront = sprites.getString("front_default");
    String imgLinkShiny = sprites.getString("front_shiny");
    String imgLinkBack = sprites.getString("back_default");
    
    this.imgFront = loadImage(imgLinkFront);
    this.imgShiny = loadImage(imgLinkShiny);
    this.imgBack = loadImage(imgLinkBack);
  }
  
}
