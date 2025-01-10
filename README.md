
# TabPFN for R

## Installation


```R
devtools::install_github("robintibor/R-tabpfn")
library(tabpfn)
install_tabpfn()
```


## Usage


```R
# Load library, set access token, create classifier
library(tabpfn)
access_token = "YOUR_ACCESS_TOKEN"
set_tabpfn_access_token(access_token)

classifier <- TabPFNClassifier$new()

# Prepare your data (here random example data)
X <- data.frame(feature1 = rnorm(100), feature2 = rnorm(100))
num_classes <- 3
y <- sample(0:(num_classes-1), 100, replace = TRUE)

X_train = X[1:80,]
y_train = y[1:80]
X_test = X[81:length(X),]
y_test = y[81:length(y)]

# Fit the model
classifier$fit(X_train, y_train)

# Make predictions
predictions <- classifier$predict(X_test)

# Print results
print(predictions)
```

You may also use a regressor like this:

```R
regressor <- TabPFNRegressor$new()

# Fit the model
regressor$fit(X_train, y_train)

# Make predictions
predictions <- regressor$predict(X_test)
```
