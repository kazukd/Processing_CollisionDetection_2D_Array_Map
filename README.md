# Processing_CollisionDetection_2D_Array_Map
Processing Collision Detection example using 2D array for map

## My environment
Processing version 4.1.2
Windows 10

## Description
I have created a collision detection system in Processing that checks for collisions between a player object and a map object. The map object is defined as a two-dimensional array where the value of 1 indicates a wall and 0 indicates an open space.
<br><br>
The isCollision() function checks for collisions between the player and a map object using the coordinates of the player and the map object, and returns true if a collision is detected. The isCollisionWall() function specifically checks for collisions between the player and a wall object in the map by comparing the coordinates of the player and the wall object using the isCollision() function.
<br><br>
In addition, the code also includes functions for drawing the map, drawing a grid line, and drawing the player object and map objects on the screen. 
This features are added to make the collision mechanism easier to understand.

##  
```
int map[][] = {{1,1,1,1,1,1,1,1,1,1},
               {1,0,0,0,0,0,0,0,0,1},
               {1,0,1,0,0,0,0,0,0,1},
               {1,0,0,0,0,0,1,1,0,1},
               {1,0,0,0,1,0,0,0,0,1},
               {1,0,0,0,1,0,0,0,0,1},
               {1,0,0,0,0,0,0,0,0,1},
               {1,1,1,1,1,1,1,1,1,1}};
```

![image](https://user-images.githubusercontent.com/83990212/231061570-47419d32-5613-4951-82d1-3695da508c0f.png)

