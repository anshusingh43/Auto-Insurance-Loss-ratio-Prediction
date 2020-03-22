# Auto-Insurance-Loss-ratio-Prediction

![insurance](https://user-images.githubusercontent.com/13045656/77262255-2538c780-6c6b-11ea-8ad5-cb6ecbed03f9.png)


Here, we have dataset of an insurance company and we are trying to predict loss ratio for them to help them gain profit.

# What is loss ratio?

You might be thinking the same question and I have the answer for you:

**Loss ratio = Ratio of total losses/ total insurance premium to the amount**

# Why are we using loss ratio

because it is one of the ways which helps to gauge company's suitability for the insurance coverage.


# Data Understanding

- Supervised Learning
- Target variable is continous hence we cannot use categorical classification or lof=gistic models and therefore we are using regression
  models.
- it has several difeerent portfolios that we need to combine and clean.

# Data Prep

- find illegal values and missing values
- encoded the categorical values using one hot encoding
- find correlation between dependent and independent variables using tools like Orange or using python libraries.
- remove uncecessary columns on the base of variable importance.
- scale your data and normalize them if required.

# Models used

- Linear regression with Lasso 
- LightGBM
- Decision Tree Regressor
- Random Forest Regressor
- Support Vector Regressor

# Evaluation concepts

- Holdout techniques
- Cross-validation
- Mean absolute error
- Root mean Square error
- R squared error

In our case, LightGBM has shown most accuracy in compared to other models with 74.6% accuracy but there is definetly a scope for improvement. There are lot of feature engineering and feature selection to do followed by different ML algorithms and models.

You can check the presentation if want to gain some exra information about the prediction. It's on a [Youtube](https://www.youtube.com/watch?v=c0u0OA8nd3A&feature=youtu.be) channel.
