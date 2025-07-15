# Snack Chain Sales Analysis and Promotion Effectiveness Modeling

This project analyzes over 500,000 real transaction records from a national snack retailer to assess the impact of promotional strategies on product sales. The dataset combines information from **stores**, **products**, and **transactions**, focusing on three major categories: **bagged snacks**, **cold cereals**, and **frozen pizza**. The goal is to evaluate how promotions—such as product display, in-store features, and temporary price reductions—influence **spend**, **unit sales**, and **number of household purchasers (HHS)**.

---

## 📊 Business Questions

1. What is the effect of **product display**, **in-store circular features**, and **temporary price reductions (TPR)** on:
   - Product spend  
   - Units sold  
   - Number of purchasing households (HHS)

2. Do the promotional effects vary by:
   - **Product categories** (e.g., frozen pizza vs cold cereal)  
   - **Store segments** (mainstream, value, upscale)

3. Which products are:
   - The **most** and **least price elastic**?
   - Ideal for **price reduction** to maximize **spend** or **unit sales**?

---

## 🧪 Methodology

- Joined data using keys: `UPC` and `Store_ID`
- Conducted feature engineering and unit standardization (e.g., converting all sizes to OZ)
- Used **log-transformation** to normalize right-skewed distributions
- Built four **Mixed Linear Models (LMM)** to predict:
  - Log of Spend
  - Log of Units
  - Log of HHS
  - Interactions between promotions, categories, and segments

---

## 🔍 Key Insights

### Promotion Effects (Page 6)
| Promotion Type     | Spend ↑ | Units ↑ | HHS ↑ |
|--------------------|---------|---------|--------|
| **Display**        | +66.4%  | +66.4%  | +5.6%  |
| **In-store Feature** | +60.9%  | +60.9%  | +5.6%  |
| **Temporary Price Reduction** | +5%     | +5%     | +1.6%  |

### By Category (Page 7)
- **Cold cereal**: Features → +22.4%, TPR → +16.7%
- **Frozen pizza**: Features → +46.2%, TPR → +25.5%
- **Oral hygiene**: Features → +30.9%, TPR → +16.7%

### By Segment (Upscale vs Mainstream)
- Display was **25% less effective** in upscale stores
- TPR was **13.1% less effective** in upscale stores
- Value stores showed **better response** to displays (+16.5%)

---

## 📈 Price Elasticity (Page 8)

- **Most Elastic Products**:
  - Supreme Pizza, Pepperoni Pizza, 4 Cheese Pizza, Mint Rinse, etc.
- **Least Elastic Products**:
  - Private label cereals and pretzels

💡 **Recommendation**: Lower prices on high-elasticity products like pretzels to maximize spend, or on toothpaste to boost unit sales.

---

## 🛠 Tools Used

- **R**: Data merging, modeling with `lmer()`, visualizations (`ggplot2`, `corrplot`)
- **Excel**: Data cleaning
- **Model Types**: Mixed Linear Models (MLM), log-transformed regressions

---

## 📁 Files Included

- `SnackChain.xlsx`: Raw data from 79 stores over 3 years
- `Snack_Chain_Aryan_Sharma.pdf`: Full analysis and results
- `Problem_Statement.pdf`: Case brief with business objectives

---

## 👤 Author

**Aryan Sharma**  
Retail Analytics | Mixed Linear Models | R Programming

---

## 📘 License

This project is for educational and portfolio purposes. Attribution is appreciated if referenced.
