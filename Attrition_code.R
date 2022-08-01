# What changes they should make to the workplace in order to get more employees to stay?

Attrition <- read.csv("~/Downloads/Attrition.csv", row.names=1)
Attrition$Attrition <- factor(Attrition$Attrition, 
                              levels = c('No', 'Yes'), labels = c(0,1))
Attrition$Gender <- factor(Attrition$Gender, 
                           levels = c('Female', 'Male'), labels = c(1,2))
Attrition$MaritalStatus <- factor(Attrition$MaritalStatus, 
                                  levels = c('Single', 'Married', 'Divorced'), labels = c(1,2,3))
Attrition<- na.omit(Attrition)

plot(Attrition)
plot(Attrition$Attrition~Attrition$Gender)
plot(Attrition$Attrition~Attrition$Education)
plot(Attrition$Attrition~Attrition$PerformanceRating)

Logistic_Reg = glm(Attrition~EnvironmentSatisfaction + JobSatisfaction +  WorkLifeBalance + DistanceFromHome + Education + Gender +  MaritalStatus + PerformanceRating, family = binomial(link = logit), data = Attrition)
summary(Logistic_Reg)

#INTERACTIONS
JobGender = (glm(Attrition~JobSatisfaction + Gender + JobSatisfaction*Gender, family = binomial(link=logit), data = Attrition))
interact_plot(JobGender, pred = JobSatisfaction, modx = Gender)

BalanceGender = glm(Attrition~WorkLifeBalance + Gender + WorkLifeBalance*Gender, family = binomial(link=logit), data = Attrition)
interact_plot(BalanceGender, pred = WorkLifeBalance, modx = Gender)

JobMarital = (glm(Attrition~JobSatisfaction + MaritalStatus + JobSatisfaction*MaritalStatus, family = binomial(link=logit), data = Attrition))
interact_plot(JobMarital, pred = JobSatisfaction, modx = MaritalStatus)

EnvironmentMarital = (glm(Attrition~EnvironmentSatisfaction + MaritalStatus + EnvironmentSatisfaction*MaritalStatus, family = binomial(link=logit), data = Attrition))
interact_plot(EnvironmentMarital, pred = EnvironmentSatisfaction, modx = MaritalStatus)

BalanceMarital = (glm(Attrition~MaritalStatus + WorkLifeBalance + MaritalStatus*WorkLifeBalance, family = binomial(link=logit), data = Attrition))
interact_plot(BalanceMarital, pred = WorkLifeBalance, modx = MaritalStatus)

BalanceDistance = (glm(Attrition~WorkLifeBalance + DistanceFromHome + WorkLifeBalance*DistanceFromHome, family = binomial(link=logit), data = Attrition))
interact_plot(BalanceDistance, pred = WorkLifeBalance, modx = DistanceFromHome)


#Cross-Validation
train.control = trainControl(method = "cv", number = 5)

Model1 = train(Attrition~EnvironmentSatisfaction + JobSatisfaction +  WorkLifeBalance + DistanceFromHome + Education + Gender +  MaritalStatus + PerformanceRating, family = binomial(link = logit), data = Attrition, method = "glm", trControl=train.control)
print(Model1)

Model2 = train(Attrition~EnvironmentSatisfaction + JobSatisfaction +  MaritalStatus + PerformanceRating + Gender + DistanceFromHome + Education + JobSatisfaction*Gender + WorkLifeBalance*Gender + EnvironmentSatisfaction*MaritalStatus + WorkLifeBalance*DistanceFromHome + JobSatisfaction*MaritalStatus + MaritalStatus*WorkLifeBalance, family = binomial(link = logit), data = Attrition, method = "glm", trControl=train.control)
print(Model2)


