## <center>Autonomous Mobile Robots</center>

#### 1. Introduction
This repository contains the assignments and the related materials for the course: Autonomous Mobile Robots (Study Guide ID 5082AUMR6Y) conducted by the Informatics Institute (IvI), the University of Amsterdam (UvA) for the academic year 2017/2018. To work on the assignments, we will be using V-Rep, MATLAB and LEGO EV3 robot. Please read this document carefully to get an overview.

##### Useful Links

- [DataNose](https://datanose.nl/#course[61400]) contains the course timetable
- [Course Website](https://staff.fnwi.uva.nl/a.vaninge/amr/amr.html) contains the lecture slides
- [GitHub](https://github.com/noureldien/UvA-AMR-2018/) contains the assignments and their materials
- [Blackboard](http://blackboard.ic.uva.nl/webapps/portal/frameset.jsp?tab_id=_2_1&url=%2fwebapps%2fblackboard%2fexecute%2flauncher%3ftype%3dCourse%26id%3d_215425_1%26url%3d) to submit the solved assignments

---
#### 2. LEGO EV3 Robot

It is a differential drive robot with many helpful sensors and actuators. Get to Know more about the EV3 [here](https://www.lego.com/en-us/mindstorms/products/mindstorms-ev3-31313). The main reason for using such robot is that UvA Science has a handful of it (about 10 robots). By the end of the course, we hope that all of you have learned enough to use it to the full extent. Please consult your Teaching Assistant if you want to have an early access to the actual EV3 robot. However, this is not needed for the first five assignments of the course. The model of the robot in the V-Rep simulator is enough.

---
#### 3. V-Rep Simulator

V-Rep is a simulation environment for robots, with which, you can build and control your own robot. An model for EV3 is provided out-of-the-box, so you can use it in the V-Rep. First, you have to download the V-Rep simulator from [here](http://www.coppeliarobotics.com/downloads.html). Please consider the Pro-Edu version and install it accordingly. Then, download the model for EV3 from [here](https://github.com/noureldien/UvA-AMR-2018/tree/master/ev3_models_for_vrep). Then, locate the directory of the `models` folder inside the installation directory of V-Rep, for example: `home/[user_name]/programs/vrep/robots/`. Then, place the EV3 model files `LEGO_EV3_GROUP.ttm`, `LEGO_EV3_MERGE.ttm` inside the directory `home/[user_name]/programs/vrep/models/robots/ev3/`. Finally, right after you open the V-Rep simulator, you can find the 2 models of the EV3 robots in the `Model Browser` window, under the directory `robots/ev3`. Please note that function-wise, the 2 models are the same. However, the model `LEGO_EV3_GROUP` is aesthetically more detailed than the model `LEGO_EV3_MERGE`. So, please use the latter if you are using less powerful PC.

Aside note: models in V-Rep can be controlled by programming languages, as: Lua, Python and MATLAB. For our course, MATLAB will be used.

---
#### 4. MATLAB

As you may know, MATLAB is a computing environment that does lots of cool stuff. MATLAB means both the environment and the scientific programming language (script). If you are new to MATLAB, please cover this [tutorial](https://matlabacademy.mathworks.com/R2017b/portal.html?course=gettingstarted) or this [tutorial](https://nl.mathworks.com/support/learn-with-matlab-tutorials.html).

First, download the appropriate MATLAB version for your desktop either from MathWorks [website](https://nl.mathworks.com/downloads/) or directly from these direct links: [Linux](http://esd.mathworks.com/R2017b/Linux_x86_64/INST_804402/matlab_R2017b_glnxa64.zip?__gda__=1517933412_11845961ebf4e1e84c581bfa3058a15b&dl_id=BXzxABGy&ext=.zip), [Windows](http://esd.mathworks.com/R2017b/win64/INST_369017/matlab_R2017b_win64.exe?__gda__=1517933412_9feee9366956f6f1cf6ed592aa015e0a&dl_id=BXzxABGy&ext=.exe), [Mac](http://esd.mathworks.com/R2017b/Mac_OS_X_Intel_64/INST_414972/matlab_R2017b_maci64.dmg.zip?__gda__=1517933412_d3091a0f8eaaf005acdbb7af447e9aff&dl_id=BXzxABGy&ext=.zip). Second, MATLAB needs to understand how to control the EV3 model in the V-Rep simulator. Thus, a toolbox is required. Download it from [here](https://github.com/noureldien/UvA-AMR-2018/tree/master/ev3_toolbox_for_matlab). Then, drag-drop the downloaded file `toolbox_x64.mltbx` into the command window of MATLAB. This will prompt the toolbox installation wizard to start, which will subsequently install the toolbox.

----
#### 5. Controling EV3 with MATLAB

Now that you have done these steps:
1. installed V-Rep simulator
2. downloaded the EV3 model and added them to the V-Rep simulator
3. installed MATLAB and the EV3 toolbox
your are ready to write your first script using MATLAB to control the EV3 model inside the V-Rep simulator.

---
#### 6. Contact

|  Your Teachers | Name | E-mail | Room |
| ---------------------------- | --------- | ------------| ------------|
| Lecturer | Toto | a.vaninge@uva.nl | C3.157
| Teaching Assistant | Nour | nhussein@uva.nl | C3.250a
