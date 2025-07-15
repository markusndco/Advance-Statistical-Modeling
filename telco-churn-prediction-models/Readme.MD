# Telco Customer Churn Prediction Using Logistic Regression

This project builds predictive models to identify churn patterns among customers of a telecommunications service provider. The dataset contains records of over 7,000 customers, categorized by whether they subscribed to phone services, internet services, or both. The objective is to develop separate logistic regression models for each customer group and evaluate churn drivers using statistical diagnostics and model performance metrics.

---

## 🎯 Project Goals

- Identify key predictors of churn for:
  1. Phone-only customers
  2. Internet-only customers
  3. Customers using both services
- Build and interpret logistic regression models for each group
- Evaluate model performance using precision, recall, F1-score, and AUC

---

## 🧪 Methodology

- Converted categorical character variables to numeric/factor format
- Created three training/testing subsets based on service usage
- Developed three separate **logistic regression models (GLMs with logit link)**:
  - `phonemodel`, `internetmodel`, `bothmodel`
- Used interaction terms and grouped predictors tailored to each segment
- Model performance assessed using:
  - Confusion Matrix
  - Precision, Recall, F1 Score, AUC

---

## 🔍 Key Insights

### Phone-Only Customers:
- **Contract Type** and **Multiple Lines** are the strongest negative predictors of churn
- Longer contracts significantly reduce churn probability (up to 78.4%)

### Internet-Only Customers:
- **Dependents** and **Contract Type** strongly reduce churn risk
- Annual or two-year contracts decrease churn by over 48%

### Both Phone + Internet Customers:
- **Online Security**, **Contract Duration**, and **Payment Method** have significant effects
- Online security services reduce churn by **46.7%**

---

## 📈 Model Metrics

| Group                     | Precision | Recall  | F1 Score | AUC     |
|---------------------------|-----------|---------|----------|---------|
| Phone Only                | 0.9186    | 0.9971  | 0.9562   | 0.7094  |
| Internet Only             | 0.8201    | 0.9268  | 0.8702   | 0.6528  |
| Both Phone and Internet   | 0.8142    | 0.8279  | 0.8279   | 0.6797  |

---

## 🧠 Key Predictors Used

- `Gender`, `SeniorCitizen`, `Partner`, `Dependents`
- `Contract`, `MonthlyCharges`, `PaymentMethod`
- `TechSupport`, `OnlineSecurity`, `StreamingServices`
- Interaction terms (e.g., `Partner*Dependents`)

---

## 🛠 Tools Used

- **R**: Logistic Regression (`glm`), `stargazer`, performance metrics
- **Excel**: Data cleaning and structuring
- Libraries: `caret`, `pROC`, `corrplot`

---

## 📁 Files Included

- `TelcoChurn.xlsx`: Raw data
- `Problem_Statement.pdf`: Project prompt and tasks
- `Churn_telecom_solution.pdf`: Final write-up and model output summary

---

## 👤 Author

**Aryan Sharma**  
Customer Analytics | Classification Modeling | R Programming

---

## 📘 License

This project is intended for academic and portfolio demonstration purposes. Reuse permitted with attribution.
