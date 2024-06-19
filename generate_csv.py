import pandas as pd
import numpy as np 

num_rows = 1_000_000
num_columns = 10

df = pd.DataFrame(
    np.random.randint(0,100, size=(num_rows, num_columns)), 
    columns=[f'col_{i}' for i in range(num_columns)])

df.to_csv('large_data.csv', index=False)