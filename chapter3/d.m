L(1) = Link([0,0,0,0,0],'modified'); 
L(2) = Link([0,0,4,0,0],'modified');
L(3) = Link([0,0,3,0,0],'modified');
L(4) = Link([0,0,2,0,1],'modified');

RobotArm = SerialLink(L,'name','RRR');
T_0 = RobotArm.fkine([0 0 0 0])
T_1 = RobotArm.fkine([10 20 30 0])
T_2 = RobotArm.fkine([90 90 90 0])
RobotArm.plot([10 20 30 0],'workspace',[-10 10 -10 10 -10 10])  