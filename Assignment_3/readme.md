## <center>Assignment 3</center>

##### <center>Deadline: Friday 9 March 2018, 11:59 PM</center>

In this assignment, we will solve problem for line fitting and extraction for robot localization.
> **Note:** Assignment content is credited to [ETH Zürich](http://www.asl.ethz.ch/education/lectures/autonomous_mobile_robots/spring-2017.html).

---
### 1. Introduction

For a lot of application in robotics, knowledge of the position and orientation of the platform is essential. This exercise could be motivated by an autonomous vehicle hauling goods across the corridors of a warehouse. In order to navigate from one place to another, the vehicle would need to know its position in the warehouse as well as its heading. On its way, it might come across walls, doorways, and racks, all of which would be perceived as measurements located along lines by a laser scanner mounted in a way that its scanning plane is parallel to the ground.

Exercise 3 and 4 explore these line features for localization against a known map. While Exercise 3 will show how to extract lines from laser scans using the split-and-merge approach, Exercise 4 will demonstrate how to employ these measurements in combination with a map for robot localization in a Kalman filter framework.

---
### 2. Line Extraction

A range scan describes a 2D slice of the environment. Points in a range scan are specified in a polar coordinate system with the origin at the location of the sensor. It is common in literature to assume that the noise on measurements follows a Gaussian distribution with zero mean, some range variance and negligible angular uncertainty.

We choose to express a line in polar parameters $(r, \alpha)$ as defined by the line equation (1) for the Cartesian coordinates ( x, y ) of the points lying on the line
$$
x \cos \alpha  + y \sin \alpha = r,
$$
where $-\pi \lt \alpha \leq \pi$ is the angle between the x-axis and the shortest connection between the origin and the line. This connection’s length is $r \geq 0$ (see Figure 1).

![GitHub Logo](https://raw.githubusercontent.com/noureldien/UvA-AMR-2018/master/Assignment_3/media/split_and_merge.png)

#### 2.1 Split-and-Merge

We employ the popular “Split-and-Merge”[1, p.249-250] line extraction algorithm to divide the obtained range measurements (points) into segments of points lying roughly on a common line.

![GitHub Logo](https://raw.githubusercontent.com/noureldien/UvA-AMR-2018/master/Assignment_3/media/algorithm-1.png)

#### 2.2 Algorithm in Matlab

The Split-and-Merge algorithm is implemented inside the function $[\alpha^{i}, r^{i}, ...] = extractLines ( x^i, y^i )$ . A crucial part of this function is the line fitting step.

**Task**: Edit `fitLine.m` and follow the instructions to complete the mathematical formula for computing line regression (line fitting) using a set of points in Cartesian coordinates after reading the following theory. The aim of the function is to minimize the sum of squared errors:

$$
S(r, \alpha) := \sum_i (\underbrace{r - x^i \cos \alpha - y^i sin \alpha}_{=(D(\alpha,r), (x^i, y^i))})^2
$$

where ( $x^i$ , $y^i$ ) are the input points in Cartesian coordinates. The solution of $(r, \alpha)$ can be found by imposing: $\nabla S=0$. The solution for $\alpha$ is then
$$
\alpha = \frac{tan^{-1} (\frac{num}{denom})}{2}
$$

$$
num:= -2 \sum_i (x^i - x_c)(y^i - y_c)
$$

$$
denom:= \sum_i (y^i - y_c)^2 -(x^i - x_c)^2
$$

where $(x_c, y_c)$ are the Cartesian coordinate of the$(x^i, y^i)$ ’s centroid (see instructions in `fitLine.m`). In order to solve for r consider the equation (1) and a point that will surely lie on the line (which one is it?). Please find additional information on [1, pp. 244] including a solution for polar input on [1, p. 246]. As soon as the lines are correctly fitted, the algorithm performs Split-and-Merge and extracts the endpoints of each segment.

**Validation**: Run `test/testLineExtraction.m` to check if the code is correctly completed. If not it will show a figure with the measured points and expected lines (in yellow) as together with the found lines and segments (in red, green and blue). To test only the fitLine function on artifical data use `test/testLineFitting.m`.

---
### 3. Handing-In

Write your code for the aforementioned task in MATLAB script file, then upload it to [Blackboard](blackboard.uva.nl/).

---
### References
Roland Siegwart, Illah Nourbakhsh, and Davide Scaramuzza. Introduction to Autonomous Mobile Robots. MIT Press, 2nd edition, 2011.
