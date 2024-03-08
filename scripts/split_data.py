import pandas as pd


# Load csv data
df = pd.read_csv("/home/jnsam/cirrhosis_task/raw_data/cirrhosis.csv")

# Convert fields from float to int, and fill missing values with 0
df["Stage"].fillna(0, inplace = True)
df["Stage"] = df["Stage"].apply(int)

df["Cholesterol"].fillna(0, inplace = True)
df["Cholesterol"] = df["Cholesterol"].apply(int)

df["Copper"].fillna(0, inplace = True)
df["Copper"] = df["Copper"].apply(int)

df["Triglycerides"].fillna(0, inplace = True)
df["Triglycerides"] = df["Triglycerides"].apply(int)

df["Platelets"].fillna(0, inplace = True)
df["Platelets"] = df["Platelets"].apply(int)

# Define new (empty) tables
PatientInfo = pd.DataFrame()
Histology = pd.DataFrame()
ChemicalComp = pd.DataFrame()

# Assign the columns that we decided on for each of the three tables (The Histology and ChemicalComp primary keys will be added in SQL)
PatientInfo = PatientInfo.assign(ID = df["ID"], Age = df["Age"], Sex = df["Sex"], Status = df["Status"], N_Days = df["N_Days"], Stage = df["Stage"])

Histology = Histology.assign(ID = df["ID"], Ascites = df["Ascites"], Hepatomegaly = df["Hepatomegaly"], Spiders = df["Spiders"], Edema = df["Edema"])

ChemicalComp = ChemicalComp.assign(ID = df["ID"], Bilirubin = df["Bilirubin"], Cholesterol = df["Cholesterol"], Albumin = df["Albumin"], Copper = df["Copper"],
                    Alk_Phos = df["Alk_Phos"], SGOT = df["SGOT"], Triglycerides = df["Triglycerides"],
                    Platelets = df["Platelets"], Prothrombin = df["Prothrombin"])

# Save the new tables
PatientInfo.to_csv("/home/jnsam/cirrhosis_task/processed_data/cirrhosis_PatientInfo.csv", index = False)
Histology.to_csv("/home/jnsam/cirrhosis_task/processed_data/cirrhosis_Histology.csv", index = False)
ChemicalComp.to_csv("/home/jnsam/cirrhosis_task/processed_data/cirrhosis_ChemicalComp.csv", index = False)