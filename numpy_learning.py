import numpy as np 

''' 
Shape mismatch - while NumPy attempts to apply 
broadcasting rules to make the shapes compatible.
Broadcasting Rules:
1. If the arrays do not have the same number of dimensions, 
pad the smaller arrays shape with ones on its left side.
2. If the shape of the arrays in a dimension is not the same, but one 
of them is 1, stretch the array with shape 1 to match the other shape.
3. If any dimension sizes disagree and neither is 1, 
the arrays cannot be broadcast together.
'''

a = np.array([1,2,3])
b = np.array([4,5])

try:
    result = a + b 
except ValueError as e:
    print(e) ## operands could not be broadcast together with shapes (3,) (2,) 

# Broadcasting rule 1
a = np.array([1,2,3]) 
b = np.array([[1], [2], [3]])

''' 
Shapes before broadcasting: (3,) and (3,1)
[1, 2, 3] # Shape: (3,)

[[1],   # Shape: (3, 1)
 [2],
 [3]]

Shapes after broadcasting: (1,3) and (3,1)
1. Padding dimensions    (3, ) -> (1,3) # [[1, 2, 3]]
2. Stretching dimensions (1,3) -> (3,3) 
[[1, 2, 3],
 [1, 2, 3],
 [1, 2, 3]] # Shape (3,3)

 [[1, 1, 1]
  [2, 2, 2]
  [3, 3, 3]] # Shape (3,3)
'''
# result = a + b
# print(result)
''' 
Output: 
[[2 3 4]
 [3 4 5]
 [4 5 6]]
 '''

# Broadcasting rule 2 
a = np.array([[1, 2, 3], [4, 5, 6]]) # (2,3)
b = np.array([[1], [2]]) # (2, 1)
''' 
Strech the second array (2,3)
[[1, 1, 1]
 [2, 2, 2]]
 '''
result = a + b
# print(result)

# Broadcasting rule 3
a = np.array([[1, 2, 3], [4, 5, 6]]) # (2,3)
b = np.array([[1, 2], [3, 4]]) # (2,2)

try:
    result = a + b
except ValueError as e:
    print(e)
# Output: operands could not be broadcast together with shapes (2,3) (2,2)
