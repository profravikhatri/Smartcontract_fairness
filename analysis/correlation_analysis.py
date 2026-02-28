
import pandas as pd

df = pd.read_csv("../data/Ethereum_Integrated_Optimization_Dataset_Nov2025_8000.csv")
correlation_matrix = df.corr(numeric_only=True)
correlation_matrix.to_csv("../results/correlation_output.csv")
print("Correlation analysis complete.")
