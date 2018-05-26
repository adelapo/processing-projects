import http.requests.*;
// About the HTTP Requests Library:
// https://github.com/runemadsen/HTTP-Requests-for-Processing

Pokemon pokemon;

void setup() {
  size(800, 600);
  imageMode(CENTER); // Draws images with x and y coords at center
  
  pokemon = new Pokemon("ekans");
  print(pokemon.id);
}

void draw() {
  background(51);
  
  image(pokemon.imgFront, 200, height / 2, 300, 300);  
  image(pokemon.imgBack, 600, height / 2, 300, 300);
}
