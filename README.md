# IndustrialBoar

## Build Instructions

### Environment Setup

#### 1. Simplified setup (For apt-based distributions)

WARNING: This is going to install runtime dependencies on your host machine

1. Create container
   
Create container and install runtime dependencies
``` 
make setup
``` 

2. Build & Run
Compile inside container and run on host machine
``` 
make run
``` 


#### 2. Setup (For non apt-based distributions)

1. Create container
``` 
make image
make init
``` 

2. Install runtime dependencies
You need to install libsdl2 and libsdl2-image on your host machine

3. Build & Run
Compile IndustrialBoar inside container and run on host machine
``` 
make run
``` 
