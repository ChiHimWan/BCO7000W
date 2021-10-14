# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

library(tidyverse)
tuesdata <- tidytuesdayR::tt_load('2021-05-18')
tuesdata <- tidytuesdayR::tt_load(2021, week = 21)

survey <- tuesdata$survey

# Or read in the data manually

survey <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

survey%>%head()


survey_USD<-survey%>%
  filter(currency=="USD")

#dataset with USD female
survey_USD_female<-survey%>%
  filter(
  currency=="USD" & 
    gender=="Woman"
)

#dataset with AUD or female
survey_AUD_female<-survey%>%
  filter(
    currency=="AUD"|
      gender=="Woman"
  )

survey%>%select(timestamp,gender,currency)


survey_USD<-
  filter(
    annual_salary >= 50000  
  )


min(survey_USD$annual_salary)

min(survey_USD$timestamp)
max(survey_USD$timestamp)


survey_USD<-survey_USD%>%
  filter(
    annual_salary > 0
  )



#min(survey_USD%>%arrange(annual_salary))

survey_USD%>%arrange(
  desc(annual_salary)
)


#What are industries in the dataset?
survey_USD%>%distinct(industry)

# how many under each industry
survey_USD%>%count(industry,gender,sort=TRUE)

#What is the gender distribution?
survey_USD%>%count(gender,industry,sort=TRUE)


#How many responses from each age catergory and gender?
survey_USD%>%count(how_old_are_you,gender,sort=TRUE)


#Group_by
survey_USD_grouped<-survey_USD%>%
  group_by(gender,industry)%>%
  mutate(
    avr_salary=mean(annual_salary)
  )


#Mutate
survey_USD_avr<-survey_USD%>%
  mutate(
    avr_salary=mean(annual_salary)
  )

#transmute
survey_total<-
  survey_USD%>%
  group_by(industry)%>%
  transmute(
    total_salary=annual_salary+as.numeric(other_monetary_comp),
    min_slary=min(annual_salary),
    max_salary=min(annual_salary),
    total_salary_what=total_salary
)

#summarise
survey_USD_summars<-survey_USD%>%
  group_by(gender)%>%
  summarise(
    avr_salary=mean(annual_salary),
    min_salary=min(annual_salary),
    max_salary=min(annual_salary)
  )%>%
    ungroup()

#parse_number
survey_USD%>%
  parse_number(how_old_are_you)

class(survey_USD$how_old_are_you)

#case_when



