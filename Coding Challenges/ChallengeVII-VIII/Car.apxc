/*
/////////////////////////////////////////////////////////////
//
// Name: Car
// Author: Dominic Romanello
// Created: 7/9/21
// Last Modified: 7/9/21
// Description: Virtual Class that extends Vehicle and implements Wheels
// 				is used to create the Car object. It tracks the Car's
// 				mileage, speed, direction faced, and the overall number of Vehicles.
// 				It can accelerate, brake, and turn.
// 
// //////////////////////////////////////////////////////////
*/


public virtual class Car extends Vehicle implements Wheels {   
    
    Transport carTransport = Transport.Land;
    integer mileage;
    
    public Car(){
        this(0);
        numOfVehicles += 1;
    }
    
    public Car(integer speed){
        this.speed = speed;
        numOfVehicles += 1;
    }
    
    public void Accelerate(){
        this.speed += 5;
        system.debug('You are now going '+ this.speed + ' mph.');
    }
    
    public void Accelerate(integer speed){
        this.speed = speed;
        system.debug('You are now going ' + this.speed + ' mph.');
    }
    
    public void Brake(){
        if(this.speed > 0){
            this.speed = 0;
            system.debug('You are now going ' + this.speed + ' mph.');
        }else{
            system.debug('You are not going faster than 0 mph');
        }
    }
    public void Brake(integer speed){
        if(this.speed > 0){
            if(speed < this.speed){
                this.speed = speed;
                system.debug('You are now going '+ this.speed + ' mph.');
            }else{
                system.debug('You are going slower than the speed you want to Brake to.');
                Throw new CarException();
            }
        } else{
            system.debug('You are not going faster than 0 mph.');
        }
    }
    
    public void Turn(string direction){
        
    }
    
}