location(robot, lane1).
location(bin, lane5).

!start.

+!start <- +location(waste,lane1).

+location(waste, X) : location(robot, X) & location(bin, Y) <- 
    !pick(waste);
    !move(robot, Y);
    !drop(waste).

+location(waste,X) : location(robot,Y) & location(bin,Z) <-
    !move(robot,X);
    !pick(waste);
    !move(robot,Z);
    !drop(waste).

+!pick(waste) : location(waste,X) <- 
    -location(waste,X);
    location(waste,robot);.

+!move(robot, Y) : location(robot, X) & adjacent(X, Y) <- 
    -location(robot, X);
    location(robot, Y).

+!move(robot, X) : location(robot, X) <- 
    true.


+!drop(waste) : location(robot,X) & location(bin,X) <-
    -location(waste,robot);.