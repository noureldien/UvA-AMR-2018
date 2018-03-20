## <center>Assignment 5</center>

##### <center>Deadline: Tuesday 27 March 2018, 12:59 PM</center>

> **Note:** Assignment content is credited to [ETH Zürich](http://www.asl.ethz.ch/education/lectures/autonomous_mobile_robots/spring-2017.html).

---
### 1. Introduction

This exercise extends and builds on the results of Exercise 4. It is therefor important to finish that exercise first. With landmark-based localization from Exercise 4 relying on an a priori known map, this exercise focuses on autonomous map building, while exploring the environment. This is described in detail in \[1\] in chapter 5.8.

---
### 2. EKF SLAM


Review Kalman Filter Localization and Line Parametrization from Exercise 4. The idea behind EKF SLAM is to treat the map in a probabilistic way, similar to treating the pose of the robot. Therefore, we add the parameters $\alpha^i r^i$ of the landmark $m^i$ to the EKF state:

$$
x = [x \;\; y \;\; \theta \;\; \alpha^1 \;\; r^1 \;\; ... \;\; \alpha^i \;\; r^i]^T
$$

We assume that the landmarks do not have any dynamics, i.e. they are static in the world frame. By properly including the landmarks in the state vector, we can now obtain the uncertainty of the landmarks as well as the correlations between them. For the implementation of the SLAM-filter, we assume that we know the number of landmarks and have a (very rough) estimate of them at startup. This simplifies the implementational details significantly, as no landmark book-keeping is necessary.

#### 2.1 Time Update (propagation)

Exercise 3 dealt with the state propagation model of the robot when not including the landmarks in the state. As these landmarks are now part of the state vector, we have to adjust the state propagation model. Since the landmarks are considered to be static, we model them using zero velocity dynamics.

$$
\begin{aligned}
\dot{\alpha} = 0
\\
 \dot{r} = 0
\end{aligned}
$$

**Task**: Derive and implement the state prediction and covariance propagation for the state defined above, by re-using your results from Exercise 4. To this end, adapt the state transition function in `transitionFunction.m`. The state transition function maps the state at time $x_{t-1}$ to the state $x_t$ given the wheel odometry $\mathbf{u}_t$.

$$
\hat{\mathbf{x}}_t = f (\mathbf{x}_{t-1}, \mathbf{u}_t);
$$

Additionally, derive $\mathbf{F}_x$ and $\mathbf{F}_u$ for this formulation and implement your result in the file `transitionFunction.m`.

$$\mathbf{F}_x = \frac{ \partial{f} (\mathbf{x}_{t-1}, \mathbf{u}_t)}{\partial \mathbf{x}}; \;\;  \mathbf{F}_u = \frac{ \partial{f} (\mathbf{x}_{t-1}, \mathbf{u}_t)}{\partial \mathbf{u}}
$$ 

(Hint: What has changed since Exercise 4?) 

**Validation**: Validate your implementation using the validation script `test/validateTransitionFunction.m`. If your implementation of the state transition and covariance propagation is correct, the message you should see is: `State transition function appears to be correct!`.

#### 2.2 Measurement Update

The main work of EKF SLAM is done in the measurement update. We assume that all landmarks are visible, and that the number of landmarks does not change. This is not a limitation, but it simplifies implementation and debugging effort at this stage. Measurement association and update work similarly to Exercise 4, except that the measurement Jacobians $\mathbf{H}^i$ need special attention.
We can show that the relative position and heading of the robot with respect to the landmarks can be estimated. However, the global position and heading of the robot as well as the landmarks is not observable. This can be intuitively explained by the fact that if both robot and landmarks are moved or rotated by the same amount simultaneously, we cannot detect this motion using only relative distance or bearing measurements of the robot with respect to the walls or wheel encoder information. To eliminate these degrees of freedom, we fix the first two landmarks in the state vector (assuming that both walls are not parallel), in order to fully constrain the unobservable states.

**Task**: Based on Exercise 4, implement a measurement function that returns the predicted measurement given the state vector (which is now including both robot state and landmarks) and the landmark index as defined in the following equation. To this end, update the script `measurementFunction.m`. (Hint: What has actually changed since the previous exercise?).

$$
\mathbf{m}_i = h_i(\mathbf{x}_t)
$$

Additionally, provide the corresponding Jacobian of the measurement with respect to the state vector. Compared to Exercise 4, the landmark position is now part of the state vector. This has to be reflected in the computation of the Jacobian.

$$
\mathbf{H}_{x, i} = \frac{\partial h_i(\mathbf{x}_t)}{\partial \mathbf{x}};
$$

**Validation**: Validate your implementation using the validation script `test/validateMeasurementFunction.m`. If your implementation of the measurement update is correct, the message is: `measurement function appears to be correct!`

#### 2.3 Validation of Complete EKF SLAM System

With the state propagation and measurement update working, it is now time to validate the complete EKF SLAM setup. First, run the script `test/validateFilter.m`. This will evaluate whether your filter will provide the same output as the baseline implementation. To evaluate your filter using randomly generated input values, you can run the script `test/validateCompleteEKFLoop.m`. The output of your filter should now approximate the ground truth trajectory

---
### 3. V-Rep Experiment

**Task**: So far, EKF localization and mapping have been implemented and verified in Matlab. In this exercise, we evaluate and test the complete functionality in the simulation environment V-REP.

**Validation**: Start V-REP, load scene `scene/mooc_exercises.ttt` and start the simulation. You should see a circular robot, a set of walls and the visualization of laser measurements. Now run the script `vrep/vrepSimulation.m`. The robotic platform should start moving on a circular path. Close to the actual robot you should see a yellow 'ghost', which visualizes the pose as estimated by your localization. If everything is implemented properly, you should see the yellow ghost following the pose of the robot.

---
### 4. Handing-In

Write your code for the aforementioned tasks (2.1, 2.2) in MATLAB script code provided. Then, compress and upload it to [Blackboard](blackboard.uva.nl/).

---
### References
[1] Roland Siegwart, Illah Nourbakhsh, and Davide Scaramuzza. Introduction to Autonomous Mobile Robots. MIT Press, 2nd edition, 2011.
