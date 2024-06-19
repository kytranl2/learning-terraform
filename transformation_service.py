import pandas as pd

def transform_data(input_path, output_path): 
    df = pd.read_csv(input_path)
    ''' Vectorization - pandas used vectorized operations,
     which are operations applied to whole arrays (or Series) at once.
     This is possible b/c pandas operations are built on top of NumPy'''
    
    df['col_10'] = df['col_9'] * 2
    
    df_filtered = df[df['col_9'] > 10]

    df_filtered.to_csv(output_path, index=False)

if __name__ == "__main__":
    input_path = "input_data.csv"
    output_path = "output_data.csv"
    transform_data(input_path, output_path)


