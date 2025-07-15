# Lung Cancer Survival Analysis Using Kaplan-Meier and Parametric Models

This project applies survival analysis techniques to assess the effectiveness of a new drug tested alongside chemotherapy for patients with advanced lung cancer. The dataset includes 137 patients, each assigned to either the **standard chemotherapy treatment** or the **test treatment** (chemotherapy + new drug). The goal is to compare survival outcomes using both **non-parametric** and **parametric models**.

---

## 📊 Objectives

- Compare 6-month and 1-year survival probabilities for both treatment groups.
- Determine median survival time under standard vs. test treatment.
- Quantify the effect of treatment and patient characteristics on survival using statistical models.

---

## 🧪 Methodology

### 🔹 Kaplan-Meier Analysis
- Created KM curves grouped by treatment
- Computed survival probabilities at:
  - **1 year (365 days)**:  
    - Standard treatment: **70.8%**  
    - Test treatment: **10.97%**
  - **6 months (180 days)**:  
    - Standard: **21.24%**  
    - Test: **23.28%**

### 🔹 Parametric and Semi-Parametric Models
Built and compared four survival models:
1. **Cox Proportional Hazards (semi-parametric)**
2. **Exponential**
3. **Weibull**
4. **Log-logistic**

Each model used the following predictors:
- Treatment type  
- Cell type (cancer subtype)  
- Age in years  
- Months since diagnosis  
- Prior chemotherapy

---

## 🔍 Key Findings

- **Treatment Effects**:
  - Cox model shows a **167% increase** in survival with test treatment.
  - All parametric models (exponential, Weibull, log-logistic) show negative survival impact for test treatment, suggesting sensitivity to model assumptions.

- **Cell Type**:  
  Squamous cell types (Celltype1) perform better; other types are associated with lower survival probabilities in parametric models.

- **Age**:  
  Mixed results across models: slight increase in survival in Cox, decrease in parametric models.

- **Months From Diagnosis**:  
  Earlier diagnosis shows mixed effect; again model-dependent.

- **Prior Chemotherapy**:  
  Conflicting results: positive in exponential/Weibull; negative in Cox/log-logistic.

---

## 📈 Recommendations

- Interpret model comparisons with caution due to sensitivity to assumptions.
- Conduct **sensitivity analysis** to assess robustness of results across model types.
- Further research with a larger sample and more granular cell type data is recommended.

---

## 🛠 Tools Used

- **R**: `survfit()`, `coxph()`, `survreg()`  
- **Libraries**: `survival`, `ggplot2`, `corrplot`  
- **Statistical Tests**: Kaplan-Meier estimator, log-rank tests, parametric MLE

---

## 📁 Files Included

- `data.xlsx`: Cleaned dataset used in R
- `Problem_Statement.pdf`: Project instructions
- `Lung_Cancer_Aryan_Sharma.pdf`: Full analysis and results documentation

---

## 👤 Author

**Aryan Sharma**  
Medical Analytics | Survival Models | R Programming

---

## 📘 License

This project is intended for educational and portfolio demonstration purposes. Reuse with attribution is appreciated.
