# Online Retail Promotion Analysis Using GLM

This project analyzes the effectiveness of promotional email campaigns on customer spending behavior using Generalized Linear Models (GLMs). The dataset includes transaction records from 64,000 customers of an online retailer, categorized into three groups: men's promotion, women's promotion, and a control group. The objective is to determine which campaign performed best and identify the customer segments most responsive to promotional offers.

---

## 🎯 Objective

- Evaluate whether email promotions for men’s or women’s merchandise led to increased spending.
- Compare the promotional response across customer demographics, past behavior, and sales channels.
- Identify the best-performing predictive model for customer spend using GLMs with different link functions.

---

## 📊 Modeling Approach

- Performed exploratory data analysis on the `Spend` variable, which exhibited right skew.
- Built and compared three GLMs with different link functions:
  - **Identity (Model 1)**  
  - **Log (Model 2)** ← *Best fit*
  - **Inverse (Model 3)*
- Conducted assumption checks:
  - Multicollinearity (VIF) ✅ Passed
  - Independence (Durbin-Watson) ✅ Passed
  - Normality and Homoscedasticity ❌ Violated in all models
- Used log-link GLM as the final model due to better fit and interpretability.

---

## 🔍 Key Insights

- **Women’s email promotion** outperformed men’s by **11.4%** in customer spend.
- **New customers** spent about **1.7% more** than returning ones.
- Customers with **past annual spending > ₹1000** responded best (+27%) to promotions.
- **Multichannel (web + phone)** customers spent more than those who only used one channel.
- Targeting promotions to customers who previously bought **same-category merchandise** increases response by **up to 19.3%**.

---

## 🧠 Predictors Used

| Variable         | Effect        | Rationale                                                   |
|------------------|---------------|--------------------------------------------------------------|
| Recency          | +/-           | Reflects recency of previous activity                        |
| HistorySegment   | +             | Past spending behavior                                       |
| Channel          | +/-           | Phone, Web, or Multichannel                                  |
| Gender           | +/-           | Gender targeting vs. customer behavior                       |
| Campaign         | +/-           | Men's, Women's, or No Email (control group)                 |
| NewCustomer      | +/-           | Whether customer joined in last 12 months                    |
| Conversion/Visit | +             | Engagement metrics driving spend likelihood                  |
| Zipcode          | +             | Demographic segmentation proxy                               |

---

## 🛠 Tools Used

- **R** (GLM modeling, correlation analysis, diagnostic plots)
- **Excel** (Data preparation)
- **Statistical Tests**: VIF, Durbin-Watson, Q-Q plots, Residual histograms

---

## 👤 Author

**Aryan Sharma**  
Retail Promotions | Predictive Modeling | R Programming

---

## 📘 License

This project is intended for academic and portfolio demonstration purposes. Please provide attribution if referenced or reused.
