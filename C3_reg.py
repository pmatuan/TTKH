from sklearn.linear_model import LinearRegression
import numpy as np
reg = LinearRegression()
x = np.arange(1,7,1).reshape(-1,1)
y = np.array([11,11,14,16,18,20]).reshape(-1,1)
reg.fit(x,y)
a = reg.coef_
b = reg.intercept_
print(a,b)