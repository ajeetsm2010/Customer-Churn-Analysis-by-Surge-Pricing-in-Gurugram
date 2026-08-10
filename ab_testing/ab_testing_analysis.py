import pandas as pd
import numpy as np
from scipy.stats import norm
from pathlib import Path

# Find project root directory
BASE_DIR = Path(__file__).resolve().parent.parent

# Load baseline dataset
df = pd.read_csv(BASE_DIR / "gurugram_churn_data.csv")

# Reproducible random assignment
np.random.seed(42)
df = df.sample(frac=1, random_state=42).reset_index(drop=True)

# Create 5,000 Control + 5,000 Treatment users
df["Experiment_Group"] = ["Control"] * 5000 + ["Treatment"] * 5000

# Simulated experiment outcomes
# Control: 35% conversion
# Treatment: 49.2% conversion
df["Checkout_Completed"] = 0

control_idx = df.index[df["Experiment_Group"] == "Control"]
treatment_idx = df.index[df["Experiment_Group"] == "Treatment"]

df.loc[control_idx[:1750], "Checkout_Completed"] = 1
df.loc[treatment_idx[:2460], "Checkout_Completed"] = 1

# Conversion rates
control_success = df.loc[control_idx, "Checkout_Completed"].sum()
treatment_success = df.loc[treatment_idx, "Checkout_Completed"].sum()

control_total = len(control_idx)
treatment_total = len(treatment_idx)

control_rate = control_success / control_total
treatment_rate = treatment_success / treatment_total

# Two-proportion Z-test
pooled_rate = (control_success + treatment_success) / (
    control_total + treatment_total
)

standard_error = np.sqrt(
    pooled_rate
    * (1 - pooled_rate)
    * (1 / control_total + 1 / treatment_total)
)

z_stat = (treatment_rate - control_rate) / standard_error
p_value = 2 * (1 - norm.cdf(abs(z_stat)))

# Lift calculations
absolute_lift = treatment_rate - control_rate
relative_lift = absolute_lift / control_rate

# Display results
print("A/B TEST RESULTS")
print("----------------")
print(f"Control Conversion Rate: {control_rate:.1%}")
print(f"Treatment Conversion Rate: {treatment_rate:.1%}")
print(f"Absolute Lift: {absolute_lift:.1%}")
print(f"Relative Lift: {relative_lift:.1%}")
print(f"Z-Statistic: {z_stat:.2f}")
print(f"P-Value: {p_value:.4e}")

if p_value < 0.05:
    print("Result: Statistically Significant")
    print("Recommendation: Proceed with further rollout testing.")
else:
    print("Result: Not Statistically Significant")
    print("Recommendation: Do not roll out yet.")

# Save experiment dataset
df.to_csv(BASE_DIR / "ab_test_data.csv", index=False)

print("Experiment dataset saved as: ab_test_data.csv")
