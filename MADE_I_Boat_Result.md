# Result

### 1.1曲面方程

$$
Ax^2+By^2=z
$$

### 1.2船高

$$
H
$$

### 2.1龙骨方程

$$
By^2=H
$$

### 2.2截面方程

#### 	2.2.1 xoz平面

$$
\{{Ax^2=z \atop y=0}
$$

#### 	2.2.1 xoz平面

$$
\{{By^2=z \atop x=0}
$$

### 2.3甲板方程

$$
Ax^2+By^2=H
$$

### 3.1重心

<center>表1 船体各部件符号表示</center>
|      | 字母下标 | 质量/kg | 规格/型号 单位/m              | 重心/m        |
| ---- | -------- | ------- | ----------------------------- | ------------- |
| 桅杆 | a        | 0.110   | $ \phi0.010\times0.500$       | (0, 0, 0.312) |
| 船体 | b        | 0.321   | $0.379\times0.240\times0.120$ | (0, 0, 0.080) |
| 重物 | c        | 0.770   | $\phi0.020\times0.078$        | (0, 0, 0.042) |
| 整体 | all      | 1.201   | $0.379\times0.240\times0.120$ | (0, 0, 0.053) |

已知桅杆重心为$COM_a(0,0,z_{M_a})$，船体重心为$COM_b(0,0,z_{M_b})$，重物重心为$COM_c(0,0,z_{M_c})$

则整体重心为$COM_c(0,0,z_{M_{all}})$
$$
z_{M_{all}}=\frac{m_a\times z_{M_a}+m_b\times z_{M_b}+m_c\times z_{M_c}}{m_a+mb+mc}\tag{1}
$$

### 3.2倾斜135°时的浮心

<img src="F:\机器人学院资料\Homework\MADE_Project\MADE_PRO_1_Boat Design\答辩待用图片\135°水面.jpg" style="zoom:50%;" />

<center>图1 船体倾斜135°时水面方程图三维视图
<img src="F:\机器人学院资料\Homework\MADE_Project\MADE_PRO_1_Boat Design\答辩待用图片\135°xoz平面图.png" style="zoom: 67%;" />


<center>图2 船体倾斜135°时水面方程图xoz截面图

浮心计算$(x_b, y_b, z_b)$

已知水面方程为$z=px+z_0$，其中 $p=tan\theta$，$\theta=135°$，$z_0=\sqrt{\frac{H-Ax^2}{B}}$

有
$$
\begin{align}
x_b=&\frac{2}{V}\iiint_E{xdV}\qquad E = \{(x,\ y, \ z) | x_{Mid}\leq x\leq width, \ y_0\leq y \leq0, 0 \leq z \leq z_0 \}\tag{2}\\

x_b=&\int_{xMid}^{x_1}\int_{0}^{y_0}\int_{px+z_0}^{H}{xdzdydx}\tag{3}
\end{align}
$$
计算得浮心$COB=(0.061, 0, 0.097)$

### 3.3复原力矩

<img src="F:\机器人学院资料\Homework\MADE_Project\MADE_PRO_1_Boat Design\答辩待用图片\135°复原力矩图.png" style="zoom: 80%;" />

<center>图3 船体倾斜135°复原力矩图

已知$COM(0,0,z_m)$，$COB(x_b,0,z_b)$

浮力$F_浮=<tan\theta,0,-1>\lambda$，其中$\lambda=\frac{G_{all}}{tan^2\theta+1}$

复原力臂$r=COM-COB=<0,0,z_m-z_b>$

复原力矩$M_s=r\times F_浮=0$

### 4.吃水线

<img src="F:\机器人学院资料\Homework\MADE_Project\MADE_PRO_1_Boat Design\答辩待用图片\水平吃水线.png" style="zoom: 50%;" />

<center>图4 水平吃水线

已知船体总重量为$m_{all}$，有$m_{all}=\rho g_水 v_排$

吃水线方程为$z=h$

有
$$
\begin{align}v_排=&\iiint_E{dV}\qquad E = \{(x,\ y, \ z) | x_{Mid}\leq x\leq width, \ y_0\leq y \leq0, 0 \leq z \leq z_0 \}\tag{4}\\v_排=&\int_{xMid}^{x_1}\int_{0}^{y_0}\int_{Ax^2+Bx^2}^{h}{xdzdydx}\tag{5}\end{align}
$$

### 5.数量关系图

### 5.1重物与吃水线

