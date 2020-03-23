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

![boruta](https://user-images.githubusercontent.com/13045656/77267181-2d4b3400-6c78-11ea-92b4-2fc36974ce6d.png) 

The above code is used to find the variable importance in R using Boruta. Boruta works as a wrapper algorithm around Random Forest. It iteratively removes the feature which are provided by the statistical test to be less relevant than the random probes. 

### How Boruta Works 

It is an ensemble method in which classification is performed by voting of multiple unbiased weak classifiers — decision trees. These trees are independently developed on different bagging samples of the training set. The importance measure of an attribute is obtained as the loss of accuracy of classification caused by the random permutation of attribute values between objects. It is computed separately for all trees in the forest which uses a given attribute for classification. Then the average and standard deviation of the
accuracy loss are computed. Alternatively, the Z score computed by dividing the average loss by its standard deviation can be used as the importance measure.

Given below is one sample of how Boruta shows the variable importance graph. The red one shows that this variable is not important and can be rejected while green one shows importance of a variable and should be considered for our modeling. Once we have our model, then it's upto you if you want to add the rejected variables to see if they increase your accuracy or not.

![importance](https://user-images.githubusercontent.com/13045656/77267189-33411500-6c78-11ea-94b9-3fb33f6ea552.png)


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
