#Carseats Sales Prediction and Tree-Based Modeling

This project analyzes the Carseats dataset from the ISLR package to evaluate how store characteristics, pricing strategies, and demographic factors influence product sales. The analysis applies multiple machine learning models—including regression trees, bagging, random forests, and BART—to compare predictive performance and identify the strongest drivers of Sales.

The objective is to determine which store-level and market-level features best explain Sales and which modeling approach provides the most accurate predictions.

##📊 Business Questions

This project investigates the following:

1. What factors significantly impact product Sales across stores?

Specifically:

Price

Shelf placement (ShelveLoc)

Competition pricing (CompPrice)

Advertising spend

Income, Age, Population, and other demographics

2. Which machine learning method best predicts Sales?

Models compared:

Regression Tree

Pruned Tree

Bagging

Random Forest

BART

3. Which predictors consistently emerge as the strongest drivers of Sales?

Patterns observed across models reveal:

ShelveLoc, Price, and CompPrice are primary influencers

Variables such as Population and Urban have minimal predictive value

🧪 Methodology
1. Exploratory Data Analysis

Histograms and boxplots of Sales

Multicollinearity inspection using correlation plots

Summary statistics

2. Data Preparation

75/25 Train–Test split

Seed set for replicability

Conversion of categorical predictors where needed

3. Modeling Approaches

The following models were implemented:

Model	Purpose
Regression Tree	Baseline tree structure for interpretability
Pruned Tree	Reduced complexity using cross-validation
Bagging	Variance reduction via bootstrap aggregation
Random Forest	Ensemble learning with feature randomness
BART	Bayesian additive modeling for nonlinear patterns

Each model was evaluated using Test MSE.

🔍 Key Insights
Exploratory Findings

Sales is slightly right-skewed but suitable for regression models.

No strong correlations among predictors (none exceed 80%).

Each predictor contains unique information valuable to modeling.

Model Results (MSE Comparison)
Model	Test MSE	Interpretation
Regression Tree	4.91	Moderate error; simple model underfits
Pruned Tree	4.98	Slightly worse; reduced complexity with similar performance
Bagging	2.83	Large improvement; variance reduction effective
Random Forest	2.74 (optimal mtry=6)	Even better performance; captures nonlinearities well
BART	1.55	Best model; captures complex interactions
📈 Variable Importance (Across Models)

Consistently top predictors:

ShelveLoc (Visibility)

Price

CompPrice

Age

Advertising

Low-value predictors:

Population

Urban

Education

These features provide limited contribution to boosting predictive power.

💡 Final Recommendation

Among all tested methods, BART clearly demonstrates the highest predictive accuracy, with the lowest test MSE. Random Forest and Bagging also perform strongly and significantly outperform single-tree models.

Businesses or analysts modeling retail sales should prioritize:

Nonlinear ensemble methods (Bagging, Random Forest, BART)

Key features such as ShelveLoc, Price, and Competition Pricing

Single regression trees provide interpretability but lack accuracy compared to ensemble approaches.

🛠 Tools Used

R Programming

ggplot2

tree

randomForest

partykit

dbarts / bartMachine (if supported)

corrplot

Exploratory analysis and visualization

Tree-based models and advanced ensembles

📁 Files Included

Carseats_Analysis_Aryan_Sharma.R — Full analysis and model code

Carseats_Sales_Report.pdf — Cleaned write-up & interpretations

carseats_plots/ — Visualizations and tree diagrams

👤 Author

Aryan Sharma
Retail Analytics | Machine Learning | Tree-Based Models | R Programming

📘 License

This project is for educational and portfolio use. Attribution appreciated.
