L(1) = Link([0,0,0,0,0],'modified'); 
L(2) = Link([0,0,4,0,0],'modified');
L(3) = Link([0,0,3,0,0],'modified');
L(4) = Link([0,0,2,0,1],'modified');
robot = SerialLink(L,'name','RRR');

T1 = [1, 0, 0, 9; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0,1];
P1 = robot.ikine(T1)
