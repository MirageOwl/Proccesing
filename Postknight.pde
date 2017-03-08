void setup() {
  size(450, 800);
  smooth(0);
  loadAssets();  
  
  enemyx = 0;
  enemy_speed = 1;
  
  magicball = false;
  
}  

boolean magicball;

void draw() {
  background(255, 212, 232);
  noStroke();
  fill(192, 212, 255);
  rect(0, height/2, width, height);
  
  image(spr_player, width/3, height/2-spr_player_w);
  draw_enemy();
  if(magicball) draw_magicball();
}

void mouseClicked() {
  if(!magicball) {
    magicball = true;
    magicball_x = width/3;
    magicball_y = (height-spr_player_w)/2;
  }  
}

/**
 * Move and draw magicball to screen
 */
float magicball_x, magicball_y;
void draw_magicball() {
  float magicball_speed = 4;
  magicball_x += magicball_speed;
  image(spr_magicball, magicball_x, magicball_y);,
  if(width + enemyx - spr_enemy_w/2 < magicball_x) {
    
  }
}

/**
 * Move and draw enemy object to screen
 */
float enemyx, enemy_speed;
void draw_enemy() {
  enemyx -= enemy_speed;
  image(spr_enemy, width + enemyx, height/2-spr_enemy_w);
}

/**
 * Load sprite images
 */
PImage spr_player, 
       spr_enemy, 
       spr_magicball;
int spr_player_w, spr_player_h, 
    spr_enemy_w, spr_enemy_h, 
    spr_magicball_w, spr_magicball_h;
    
void loadAssets() {
  //Load player sprite
  spr_player = loadImage("spr_player.png");
  spr_player_w = 48;
  spr_player_h = 48;
  spr_player.resize(spr_player_w, spr_player_h);
  //Load enemy sprite
  spr_enemy = loadImage("spr_enemy_walk_left_1.png");
  spr_enemy_w = 48;
  spr_enemy_h = 48;
  spr_enemy.resize(spr_enemy_w, spr_enemy_h);
  //Load magicball sprite
  spr_magicball = loadImage("spr_magicball_0.png");
  spr_magicball_w = 12;
  spr_magicball_h = 12;
  spr_magicball.resize(spr_magicball_w, spr_magicball_h);
}