library(titanic)

nrow(titanic_train)

## Drop NA(missing Values)
titanic_train <- na.omit(titanic_train)

## Spit Data
set.seed(42)
n <- nrow(titanic_train)
id <- sample(1:n, size=n*0.7) ## 70% train, 30% test
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]

## prepare data
titanic_train$Sex <- factor(titanic_train$Sex,
                            levels = c("male", "female"),
                            labels = c(0, 1))

## Train Model
titan_model <- glm(Survived ~ Pclass + Age + Sex, data = train_data, family="binomial")
p_train <- predict(titan_model, type="response")
train_data$pred <- if_else(p_train >= 0.5, 1, 0)
train_data$Survived == train_data$pred

## Test Model
p_test <- predict(titan_model, newdata = test_data, type="response")
test_data$pred <- if_else(p_test >= 0.5, 1, 0)
test_data$Survived == test_data$pred

## Accuracy
mean(train_data$Survived == train_data$pred)
mean(test_data$Survived == test_data$pred)
