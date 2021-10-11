# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

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
    