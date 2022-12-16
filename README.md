# CEE 609 Final Project
This repository contains information regarding a canopy cover vegetation study for CEE 609: Environmental Data Science. All work has been completed by Luke Borden.
# Introduction
Canopy cover of different forms of vegetation is critical for landscape architects when choosing different planting features. Not only is canopy cover considered for aesthetic purposes, but also for providing animal habitats, regulating temperature, and soil health.
# Research Question
Can data from the United States Environmental Protection Agency be used to assist landscape architects in selecting proper vegetation species for environmental ecosystems based on the canopy cover percentage?

This study will focus specifically on analyzing the differences between different vegetation types and how well different predictors are of use in determining canopy cover. The coefficient of determination is used to represent the variance between the dependent variable of canopy cover and the variables used in the regression model.

# Data and Methods
Data Source Description

The dataset was obtained from the United States Environmental Protection Agency (https://edg.epa.gov/metadata/catalog/search/resource/details.page?uuid=%7BED89B12A-E80E-477A-8595-CF578067F669%7D). 1,503 different species of trees, shrubs, vines, and herbaceous growth were sampled across the country. They were analyzed based on nitrogen deposition, precipitation, air temperature, solar radiation, clay percentage, root depth, water storage, and the pH of soil. On average, about 12,000 different samples were taken for each vegetation species, but at the sample locations, only about 300 contained the required species. Using these samples, averages were taken for each variable for each species.

Data Processing Description

Coordinates were attempted to be retrieved for the species samples so that specific locations could be used to determine if there are outside factors that could be swaying outcomes. For example, if samples were taken in Arizona or New Mexico there would be very little precipitation with high air temperatures and solar radiation. Since this could not be concluded, all data was split by species type. Subsets of the data were created for trees, shrubs, vines, and herbaceous growth so that they could be analyzed by determining which grow form is best in terms of canopy cover.

Model Description

Trend tests will be developed using R’s package library. Using the EPA data, it will be determined if there is a specific grow form that this data favors, given how further analysis about location could not be achieved from this dataset.

# Results

From the trend tests run, the results are as followed for the adjusted R^2 value, the coefficient of determination. For trees it resulted in 0.9981, shrubs was 0.9991, herbaceous growth was 0.9988, and vines was also 0.9988. Therefore, when examining canopy cover, shrubs appear to be the best option. This may have to do with the fact that shrubs can expand across the ground while trees tend to have always grown vertically, and vines have primarily grown on trees or buildings. Also, from the original dataset, there are only 176 different tree species, 238 shrubs, 1,038 herbaceous growth forms, and 51 vines.

# Discussion

Given the results of the trend tests, it is obvious that the coefficient of determination is best for shrubs, even though it does not contain the maximum number of species tests. This opens the discussion on whether enough data was presented by the Environmental Protection Agency. There is the opportunity for all tests to be neutralized if they were taken in the same region and the deliverables were taken from the same species. Since each data sample was taken in a specific area of the country, the data was misinterpreted because there was no set test statistic.

# Conclusion



# Future analysis
