PImage boton;
ArrayList <Figura> figuras;
float lado = 25;
float altura = sqrt(sq(lado) - sq(lado/2f));
float apotema = lado/ 2*tan(PI/6f);
float radio = altura - apotema;
float delta = 0;

float movimiento1 = 20;
float movimiento2 = 50;
float escala = 100;

void setup()
{
size(900,650);
figuras = new ArrayList<Figura>();
for (float j = radio; j<=height; j+= altura){
int paso = (round((j - radio)/altura));
float offset =0;
if (paso%2 == 0){
offset = lado/2f;
}
for (float i =-offset; i<=width; i+= lado){
figuras.add(new Triangulo(i,j,lado,0));
}
for (float i =lado/2f-offset; i<=width; i+= lado){
figuras.add(new Triangulo(i,j-apotema,lado,PI));
}
}
boton = loadImage("boton.png");
}
void draw()
{
  
  movimiento1 +=0.01;
  movimiento2 +=0.02;
  escala += 0.05;
  
delta += 0.01; 
background(255);
noStroke();
fill(0);
for (Figura f: figuras){
f.display();
}

pushMatrix();
translate(300,260);
scale(0.7);
image(boton,0,0);
popMatrix();

}
interface Figura
{
float perimetro ();
float area ();
void display();
}
class Triangulo implements Figura
{
float x,y,l,rc,ri,a,a1,deltax,deltay,h,b,rota;
Triangulo (float x_,float y_,float l_, float rota_)
{
x=x_;
y=y_;
l=l_;
rc=(l*sqrt(3))/3f;
b=l;
a1=TWO_PI/3;
rota = rota_;
}
float perimetro ()
{
return l*3;
}
float area ()
{
return ((l*l)*(sqrt(3)))/4;
}
void display()
{
if(mouseX>450 && mouseX<=900 && mouseY<=325){
    fill (random(noise(movimiento1)*65), random(noise(movimiento2)*65), random(noise(escala)*65));
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI - PI/3 + rota);
    beginShape();
      for(float a = 0;a<TWO_PI;a+=a1)
      {
    
        deltax=cos(a)*rc;
        deltay=sin(a)*rc;
        vertex(deltax,deltay);
        
      }
      endShape(CLOSE);
      popMatrix();
  }
  if(mouseX<=450 && mouseY<=325){
    fill (random(noise(movimiento1)*130), random(noise(movimiento2)*130), random(noise(escala)*130));
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI - PI/3 + rota);
    beginShape();
      for(float a = 0;a<TWO_PI;a+=a1)
      {
    
        deltax=cos(a)*rc;
        deltay=sin(a)*rc;
        vertex(deltax,deltay);
        
      }
      endShape(CLOSE);
      popMatrix();
  }
  if(mouseX<=450 && mouseY>=325){
    fill (random(noise(movimiento1)*185), random(noise(movimiento2)*185), random(noise(escala)*185));
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI - PI/3 + rota);
    beginShape();
      for(float a = 0;a<TWO_PI;a+=a1)
      {
    
        deltax=cos(a)*rc;
        deltay=sin(a)*rc;
        vertex(deltax,deltay);
        
      }
      endShape(CLOSE);
      popMatrix();
  }
  if(mouseX>450 && mouseY>=325){
    fill (random(noise(movimiento1)*255), random(noise(movimiento2)*255), random(noise(escala)*255));
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI - PI/3 + rota);
    beginShape();
      for(float a = 0;a<TWO_PI;a+=a1)
      {
    
        deltax=cos(a)*rc;
        deltay=sin(a)*rc;
        vertex(deltax,deltay);
        
      }
      endShape(CLOSE);
      popMatrix();
}
}
}