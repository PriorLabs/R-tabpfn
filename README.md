
# TabPFN for R

[![Discord](https://img.shields.io/discord/1285598202732482621?color=7289da&label=Discord&logo=discord&logoColor=ffffff)](https://discord.gg/BHnX2Ptf4j)
[![Documentation](https://img.shields.io/badge/docs-priorlabs.ai-blue)](https://priorlabs.ai/docs)
[![Twitter Follow](https://img.shields.io/twitter/follow/Prior_Labs?style=social)](https://twitter.com/Prior_Labs)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Last Commit](https://img.shields.io/github/last-commit/PriorLabs/R-tabpfn)

TabPFN is a foundation model for tabular data that outperforms traditional methods while being dramatically faster. This package provides easy access to the TabPFN API from R, enabling state-of-the-art tabular machine learning in just a few lines of code.

## Installation


```R
devtools::install_github("PriorLabs/R-tabpfn")
library(tabpfn)
install_tabpfn()
```


## Access Token

TabPFN is a cloud-based service. You need a free access token to use it.

1. Sign up or log in at <https://ux.priorlabs.ai/account>
2. Copy your access token from the account page.

The token is the same credential used by the Python [`tabpfn-client`](https://github.com/PriorLabs/tabpfn-client) library.
If you already have a Python token, retrieve it with:

```python
import tabpfn_client
print(tabpfn_client.get_access_token())
```

Keep your token private — treat it like a password.

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

## ⚠️ Alpha Release Note
This is an alpha release. We appreciate your understanding and feedback as we continue to improve the package.

This is a cloud-based service using our TabPFN client (https://github.com/PriorLabs/tabpfn-client). Your data will be sent to our servers for processing.
- Do NOT upload any Personally Identifiable Information (PII)
- Do NOT upload any sensitive or confidential data
- Do NOT upload any data you don't have permission to share
- Consider anonymizing or pseudonymizing your data before upload
- Review your organization's data sharing policies before use
