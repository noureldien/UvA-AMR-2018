## <center>Assignment 1</center>

##### <center>Deadline: Friday 9th Feb 2018, 10:59 AM</center>

In this assignment, we will learn how to control the Lego EV3 robot using MATLAB. We have two tasks, open-loop control and closed-loop control.

---

### 1. Getting Started
1. Download the scene file from [here](../Assignment_1/assignment_1_scene_1.ttt?raw=true)
2. Open V-Rep simulator and import the scene into the simulator. You can do so using the program menu `File` then click on  the menu item `Open Scene ...`. Another way to import the scene into V-Rep is to drag-drop the scene file `assignment_1_scene_1.ttt` into the window of the V-Rep simulator.
3. The next step is to start your MATLAB to write the script and control the EV3 robot in the scene you just loaded. Please make sure you opened V-Rep before you open MATLAB. After opening the MATLAB, in the address bar of MATLAB, navigate to the folder/directory where you will save the scripts of this assignment, for example: `home/[user_name]/study/amr/assignments/assignment_1/`. Now, create a new script file called `task1.m` and start writing your code to solve this assignment.

---

### 2. What is Required?

The purpose of this assignment is to get you started with how to control EV3 using MATLAB. As such, two tasks are required in this assignment. Both of these tasks are to control the EV3 using MATLAB.

#### 2.1 Open-loop Control 

You are required to write MATLAB script to control and move the EV3 through the maze (in the V-Rep scene) without using any feedback from the sensors of the EV3 robot. You will only use the motors (aka actuators). Please write a script to move the EV3 forward, then turn right, move forward, then turn left, then move forward till it gets out of the maze. Please bear in mind that the path of the EV3 is hard-coded. Hence, trial and error is enough for this part of the assignment.

#### 2.2 Closed-loop Control

For this part, we want to use one of the sensors in the EV3 to get feedback from the environment. Read the data of one of the EV3 sensors and use it to adjust/correct your navigation through the maze. May be Sonar is enough? List of the sensors available in the EV3 robot and the corresponding MATLAB functions can be found in the toolbox documentation, [here](../MATLAB_toolbox_documentation_english.pdf?raw=true).

---

### 3. Handing-In

Write your code for the two aforementioned tasks in two separate MATLAB script files. For example: `task1.m` and `task2.m`. Then, compress them into one `.zip` file, for example `assignment_1_solution.zip`. Then, upload it to [Blackboard](blackboard.uva.nl/).
