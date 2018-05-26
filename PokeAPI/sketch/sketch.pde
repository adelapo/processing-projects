import http.requests.*;
// About the HTTP Requests Library:
// https://github.com/runemadsen/HTTP-Requests-for-Processing

void setup() {
  size(800, 600);
  imageMode(CENTER); // Draws images with x and y coords at center
}

void draw() {
  background(51);
  
  Pokemon pokemon = new Pokemon("ekans");
  
  image(pokemon.imgFront, 200, height / 2);  
  image(pokemon.imgFront, 400, height / 2);
}
