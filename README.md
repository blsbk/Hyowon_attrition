# Hyowon_attrition

Hyowon corporation is concerned about the number of employees leaving the organization.  In order to reduce attrition, the company wants to understand what factors contribute to employees’ decision to leave the company.  A key that explains the variables in the dataset (attrition_data_key) should be used to identify the meaning of each variables.  

What changes should be made to the workplace in order to get more employees to stay?

# Data Preparation 
In order to ease the analysis process, I unclassed the Gender (“Female = 1”, “Male = 2”) and Marital Status (“Single = 1”, “Married = 2”, “Divorced = 3”) variables to numerical type. And the Attrition variable into dummy variable as our dependent variable has only two type of result, “No = 0” those who stayed in the company and “Yes = 1” who left the company.

<img width="500" alt="image" src="https://user-images.githubusercontent.com/101795603/182121286-0d180dcf-b9b6-4b10-b701-437c6ad7295e.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/101795603/182121304-a6898a1a-f59a-42ff-93d2-de341c7de187.png">

  
Therefore, the response variable Attrition will be predicted terms of probability that the worker would leave the company. If it is more than 50% (Y>0.5 = 1), then there’s a significant probability that the employee would leave the company, but if it is less than 50% (Y<0.5 = 0), then probably employee would stay.  

# Data Plotting
The plotting graph of the variables below might not be very useful, as our response variable is a binary variable. However, I think, we still can have an insight into what type of Binary Choice Model should be built. As the there’s no signs of linear correlation between the variables. 
<img width="500" alt="image" src="https://user-images.githubusercontent.com/101795603/182121370-99ff43c2-e1c6-48d4-82dd-529e4c527484.png">

 
# Statistical Testing
Logistic Regression was conducted to identify the nature of the effect that predictor variables. has on the level of Attrition.
<img width="500" alt="image" src="https://user-images.githubusercontent.com/101795603/182121421-4f164d36-4042-400e-8cd2-110fb59e8718.png">

Summary: 
1. Negative coefficients mean increase in Environment Satisfaction, Job Satisfaction level and Work-Life Balance decreases the attrition level. 
2. MaritalStatus2 and 3’s negative coefficient can be interpreted as the married and divorced employees tend to have lower level of attrition and stay in the company. 
3. Positive effect of Performance Rating means with the increase in performance level employees tend to leave the company. Because high-performers would feel overqualified for the job position and seek for ambitious opportunities.  
4. Variables Gender, Education and DistanceFromHome seemingly do not have statistically significant effect on the Attrition (adjusted for the effect of other variables). This also can be seen from the graphs below: 

<img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121477-4a28db34-be62-413a-8965-81619b16bc12.png"> <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121496-256b51d5-692c-4220-8985-970bc0af17d6.png"> <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121513-8461a997-f64a-4c06-a7fa-5725eb66cdff.png">
   
Therefore, the results reveal that the company Hyowon should work on increasing the job satisfaction, environment satisfaction and work-life balance level to their employees to reduce the attrition. Some suggestions learnt from HR course might be to advise or supervise employees more in their work, assist them and motivate better. Also, 
The issue is that we cannot know the exact effect as they have the changing effect across its’ values. 

# Interactions Analysis
<img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121623-2ce381e4-2ca0-416f-9335-3fac47e4aa82.png">  <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121623-2ce381e4-2ca0-416f-9335-3fac47e4aa82.png"> 

These plots show the interactions of Job Satisfaction and Work-Life Balance with Gender variable. The effect on the attrition level varies across female and male. There’s a need in improving the job satisfaction for male as their job satisfaction highly affect their attrition decision. While for female is the Work-Life balance that matters more.

<img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121702-df165f13-5835-468f-b0b1-c5fe8236267a.png"> <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121732-f2d6e274-80a9-4f5f-95bb-b360ee55ab99.png"> <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121748-ded78d46-bb60-46b0-81b4-e2cdde26f7a9.png">

   
Interaction of the Marital Status with significant predictors are portrayed above. As states before, married and divorced employees in general have lower attrition level compared to single ones. Thus, by improving the quality of the job (assistance, motivation or supervising), work environment, and giving opportunity to have better work-life balance would decrease the chances that single employees would leave the company. 

<img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121827-8c948dc5-32fa-4f98-9af3-802b9b64d665.png">

This graph shows how the effect of work-life balance on attrition level varies across the values of distance from home. Obviously for those who live closer to the company do identify work-life balance as the main factor. However, for those who live further is one of the factors in making a decision to leave. Therefore, providing other alternatives that would increase their work-life balance would help to retain employees living far. Some examples might be flexible working hours, or remote modes in specific days of the week, assistance in paternity and so on. 



# Models Comparison
Results of the cross-validation tests shows that the Accuracy rate for the model with interaction has increased to 83%. Meaning the model 2 with interactions adjusted tend to be more generalizable and perform better predicting the attrition level, although the increase is very little.

 <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121889-73f39eca-f2f5-4f60-88e6-b115a763fa9a.png">, <img width="250" alt="image" src="https://user-images.githubusercontent.com/101795603/182121910-0d98cb70-b31b-42e1-89e2-931202df370d.png">

