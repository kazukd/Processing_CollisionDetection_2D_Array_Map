/**
*     This is collision detection in Processing using a 2D array as a map.
*     This is a example code to understand how to check collision with wall or cell.
*
*     
*     The size of the valiable must be a multiple of the speed value, 
*     and there should be no leftover or fractional parts. 
*
*     For example, 
*      if the size is 80, then the speed must be 1, 2, 4, 5, 8, 10, 16, 20, 40 or 80 
*      for the relationship to hold. 
*      If the speed is not a divisor of the size, then the relationship will not be valid
*
*     @author Kazuhisa Kondo (kazukd)
*     
*/

int size=80; //cell size, this size must be a multiple of the speed value
float speed=8;
float x1=size,y1=size; // start position
float x2,y2; //blue cell
float x3,y3; //green cell
float x4,y4; //yellow cell
float x5,y5; //orange cell
 

final int WALL = 1;
final int U=1; //up
final int D=2; //down
final int R=3; //right
final int L=4; //left
int direction = U; // when allow key is pressed, this value will change.

//map for testing
int map[][] = {{1,1,1,1,1,1,1,1,1,1},
               {1,0,0,0,0,0,0,0,0,1},
               {1,0,1,0,0,0,0,0,0,1},
               {1,0,0,0,0,0,1,1,0,1},
               {1,0,0,0,1,0,0,0,0,1},
               {1,0,0,0,1,0,0,0,0,1},
               {1,0,0,0,0,0,0,0,0,1},
               {1,1,1,1,1,1,1,1,1,1}};
               
void setup(){
 size(800,700); 
 
 //set color cells
 x1=size;y1=size;
 x2=size*2;y2=size*3;
 x3=x2+size;y3=y2;
 x4=x3;y4=y3+size;
 x5=x2;y5=y4;

}


void draw(){
 background(255);

 // Set color cells 
 fill(0,0,255); //blue
 rect(x2,y2,size,size);

 fill(0,255,0); //green
 rect(x3,y3,size,size);
 
 fill(255,255,0); //yellow
 rect(x4,y4,size,size);
 
 fill(#FFA500); //orange
 rect(x5,y5,size,size);
 

drawMap();
fill(255,0,0); //red
rect(x1,y1,size,size);
drawGridLine();
      
}


public void drawMap(){
  fill(100,100,100);
  for (int i=0; i<map.length; i++)
   for (int j=0; j<map[0].length; j++)
   {
       if(map[i][j]==WALL) rect(j*size,i*size,size,size);
   }
  
}

public boolean isCollisionWall(){

 int col=(int)(x1/size); // get current column
 int row=(int)(y1/size); // get current row
 float wallX = col*size;
 float wallY = row*size;
 boolean collision=false;
  
  switch (direction)
  {
    case U:
      if ((map[row-1][col]==WALL && isCollisionCell(x1, y1-speed, wallX, wallY-size)) || //wallY-size is same as size*(row-1)
          (map[row-1][col+1]==WALL && isCollisionCell(x1, y1-speed, wallX+size, wallY-size))) 
      {
        collision=true;
        println("Collision Up");
      
      }
      break;
    case D:
      if ((map[row+1][col]==WALL && isCollisionCell(x1, y1+speed, wallX, wallY+size)) || //wallY+size is same as size*(row+1)
          (map[row+1][col+1]==WALL && isCollisionCell(x1, y1+speed, wallX+size, wallY+size))) 
      {
        collision=true;
        println("Collision Down");
      
      }
      break;
      
     case R:
      if ((map[row][col+1]==WALL && isCollisionCell(x1+speed, y1, wallX+size, wallY)) || //wallX+size is same as size*(col+1)
          (map[row+1][col+1]==WALL && isCollisionCell(x1+speed, y1, wallX+size, wallY+size))) 
      {
        collision=true;
        println("Collision Right");
      
      }
      break;
      
       
     case L:
      if ((map[row][col-1]==WALL && isCollisionCell(x1-speed, y1, wallX-size, wallY)) || 
          (map[row+1][col-1]==WALL && isCollisionCell(x1-speed, y1, wallX-size, wallY+size))) 
      {
        collision=true;
        println("Collision Left");
      
      }
      break;
     
    default:
      break;    
  }
  
  return collision; 
}

public boolean isCollisionCell(float x1, float y1, float x2, float y2) { 
  if ((abs(x1 - x2) < size) && (abs(y1 - y2) < size)) {
    return true;
  }
  return false;
}

/** This function is basic for collision detection between rectangle
*/
public boolean isCollision(){
  float size1x=size;
  float size1y=size;
  float size2x=size;
  float size2y=size;
  if((abs( x1 - x2 ) <  ( size1x  + size2x  )/2 ) && (abs( y1 - y2 ) <  ( size1y + size2y )/2 ) ) return true;
   return false;
  
}

public void checkCollisionColorCells(){
   if((abs( x1 - x2 ) <  ( size  + size  )/2 ) && (abs( y1 - y2 ) <  ( size + size )/2 ) ) println("In the Blue area");
   if((abs( x1 - x3 ) <  ( size  + size  )/2 ) && (abs( y1 - y3 ) <  ( size + size )/2 ) ) println("In the Green area");
   if((abs( x1 - x4 ) <  ( size  + size  )/2 ) && (abs( y1 - y4 ) <  ( size + size )/2 ) ) println("In the Yellow area");
   if((abs( x1 - x5 ) <  ( size  + size  )/2 ) && (abs( y1 - y5 ) <  ( size + size )/2 ) ) println("In the Orange area");
   
}


void drawGridLine(){
 int x,y;
 stroke(0);
 for(x=0;x<width;x+=size)
 {
   line(x,0,x,height);
   
 }
 for(y=0;y<height;y+=size)
 {
   line(0,y,width,y);  
 }
   fill(0);
   textSize(14);
   for(int j=0; j<height/size;j++)
     for(int i=0;i<width/size;i++)
       text("("+i+","+j+")",i*size+20,j*size+15);
}

void keyPressed(){
  switch (keyCode)
  {
    case RIGHT:  
      direction = R;
      if(!isCollisionWall()) x1+=speed;
  
      break;
  
    case LEFT:
      direction = L;
      if(!isCollisionWall()) x1-=speed; 
      
      break;
    case UP:
      direction = U;
      if(!isCollisionWall()) y1-=speed;
 
      break;
  
    case DOWN:
      direction = D;
      if(!isCollisionWall()) y1+=speed;
  
      break;
  }
  println("Red current cell(x,y):("+(int)x1/size+","+(int)y1/size+")"); 
  checkCollisionColorCells();
  println(""); 
 
}
