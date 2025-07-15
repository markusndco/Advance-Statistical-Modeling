# Credit Card Transaction Modeling with Regression Techniques

This project investigates customer spending behavior using aggregated credit card transaction data across various segments including spending category, card type, wealth tag, and revolving balance indicator. The primary objective is to build regression models that predict two key outcomes:

1. **Transaction Count** – Number of transactions per customer.
2. **Transaction Amount** – Total spend amount per customer.

---

## 📊 Dataset Overview

The dataset includes over 8,000 aggregated credit card transactions with the following features:
- `SpendGroup`: Type of spending category (e.g., grocery, auto, entertainment)
- `CardGroup`: Customer’s card type (blue, gold, platinum)
- `WealthGroup`: Customer wealth classification (mass market to high net worth)
- `RevolvingGroup`: Revolving balance behavior (transactor to delinquent)
- `TransCount`, `TransAmount`: Outcome variables

---

## 🧪 Modeling Approach

- Built **linear regression models** for both transaction count and transaction amount.
- Transformed variables using `log()` for better fit where appropriate.
- Model diagnostics included:
  - Kolmogorov-Smirnov test for residual normality
  - Breusch-Pagan test for heteroskedasticity
  - VIF calculation for multicollinearity

---

## 🔍 Key Insights

- Customers with **platinum cards** had the highest spending; **blue cardholders** had the lowest.
- **Mass market** and **emerging affluent** customers showed lower spend than high net worth customers.
- **Transactors** exhibited the highest transaction frequency, followed by revolvers and occasional revolvers.
- Entertainment and personal care categories had the **fewest average transactions**.

---

## 🛠 Tools Used

- R (Linear regression, diagnostics, data wrangling)
- Excel (initial aggregation and transformation)
- Statistical tests: K-S test, Breusch-Pagan, VIF

---

## 📁 Files Included

- `CreditCardTransactions.xlsx`: Aggregated transaction data
- `Problem_Statement.pdf`: Project guidelines
- `Solution_poisson_Models.pdf`: Modeling approach, assumptions, and interpretations

---

## 👤 Author

**Aryan Sharma**  
Data Analytics | Statistical Modeling | R Programming

---

## 📘 License

This repository is intended for academic and portfolio demonstration purposes. Attribution is appreciated if reused.
