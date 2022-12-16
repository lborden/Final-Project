#Luke Borden
#CEE 609
#12/16/2022
#Grad Project

#Read in data downloaded from the EPA
input1<-read.csv("Input.csv")

#Create a subset of the data so that only trees are analyzed
type<-input1$GROWFORM
subset.data.frame(type,GROWFORM=Tree, FALSE)
input1[input1$GROWFORM=='Tree',]
trees<-subset(input1,GROWFORM=='Tree')
trees

#Create histograms for canopy cover and root depth
hist(trees$means.5.,col="blue",main="Mean Canopy Cover % for All Trees",xlab="Mean Canopy Cover (%)",ylab="Frequency")
hist(trees$means.7.,col="red",main="Mean Root Depth for All Trees",xlab="Mean Root Depth (cm)",ylab="Frequency")

#Run an Anova analysis to see if there is a correlation between canopy cover and root depth

#Set I and J
I<-2
J<-176

#Calculate means
xbar1<-mean(trees$means.5.)
xbar1
xbar2<-mean(trees$means.7.)
xbar2

# Combine data into one long vector and determine grand mean

alldata<-c(trees$means.5.,trees$means.7.)
X_bar_grand<-mean(alldata)
X_bar_grand

# Determine SST

SST<-(sd(alldata)^2)*(I*J-1)
SST

# Determine SSTr

SSTr<-J*(((xbar1-X_bar_grand)^2)+
           ((xbar2-X_bar_grand)^2))
SSTr

# Determine SSE

SSE<-SST-SSTr
SSE

#same method as above
SSE2<-(J-1)*(var(trees$means.5.)+var(trees$means.7.))
SSE2

# Determine MSTr and MSE

MSTr<-SSTr/(I-1)
MSTr
MSE<-SSE/(I*(J-1))
MSE

# Determine Test Statistics

f<-MSTr/MSE
f

# Determine critical value

v1<-I-1
v2<-I*(J-1)
Fcrit<-qf(.95,v1,v2)
Fcrit
#Since f>Fcrit, reject null hypothesis



# Determine p-value

p_value<-1-pf(f,v1,v2)
p_value

# Generate a second vector which identifies which group each member is in

n<-rep(176,2)
group<-rep(1:2,n)

# Create a data frame of the data

data<-data.frame(Grain=alldata,group=factor(group))

# Fit a linear model of Grain to group

fit1<-lm(Grain ~ group,data)

# or 

fit2<-lm(data$Grain ~ data$group)

#summary(fit1)
#summary(fit2)

# Produce the anova table

anova(fit1)

anova(fit2)

# Determine value from Studentized range distribution Q

Q<-qtukey(.95,I,I*(J-1))
Q

# Determine CI for X1_mean-X2_mean

LB<-xbar2-xbar1-Q*sqrt(MSE/J)
LB
UB<-xbar2-xbar1+Q*sqrt(MSE/J)
UB

# Calculate Tukey intervals from package

summary(fit3<-aov(Grain~group,data=data))

TukeyHSD(fit3)

# Determine w

w<-Q*sqrt(MSE/J)
w

# Look at mean of all levels

xbar1
xbar2

# Take smallest mean and add w to it

xbar2
xbar2+w

# Rank other means smallest to largest and compare to X3_bar+w

xbar1
xbar2

#Run a leaps test to determine what the best combination of variables are to predict canopy cover percentage
data1<-data.frame(trees$means.5.,trees$means.1.,trees$means.2.,trees$means.3.,trees$means.4.,trees$means.6.,trees$means.7.,trees$means.8.,trees$means.9.)
leaps(x=data1[,2:9],y=data1[,1],names=colnames(data1)[2:9],method="r2",nbest=1)
lm1<-lm(trees$means.5.~trees$means.1.+trees$means.2.+trees$means.3.+trees$means.4.+trees$means.6.+trees$means.7.+trees$means.8.+trees$means.9.)
lm1
summary(lm1)

#Create a subset of the data so that only shrubs are analyzed
type<-input1$GROWFORM
subset.data.frame(type,GROWFORM=Shrub, FALSE)
input1[input1$GROWFORM=='Shrub',]
shrubs<-subset(input1,GROWFORM=='Shrub')
shrubs

data2<-data.frame(shrubs$means.5.,shrubs$means.1.,shrubs$means.2.,shrubs$means.3.,shrubs$means.4.,shrubs$means.6.,shrubs$means.7.,shrubs$means.8.,shrubs$means.9.)
leaps(x=data2[,2:9],y=data2[,1],names=colnames(data2)[2:9],method="r2",nbest=1)
lm2<-lm(shrubs$means.5.~shrubs$means.1.+shrubs$means.2.+shrubs$means.3.+shrubs$means.4.+shrubs$means.6.+shrubs$means.7.+shrubs$means.8.+shrubs$means.9.)
lm2
summary(lm2)

#Create a subset of the data so that only herbs are analyzed
type<-input1$GROWFORM
subset.data.frame(type,GROWFORM=Shrub, FALSE)
input1[input1$GROWFORM=='Herbaceous',]
herbs<-subset(input1,GROWFORM=='Herbaceous')
herbs

data3<-data.frame(herbs$means.5.,herbs$means.1.,herbs$means.2.,herbs$means.3.,herbs$means.4.,herbs$means.6.,herbs$means.7.,herbs$means.8.,herbs$means.9.)
leaps(x=data3[,2:9],y=data3[,1],names=colnames(data3)[2:9],method="r2",nbest=1)
lm3<-lm(herbs$means.5.~herbs$means.1.+herbs$means.2.+herbs$means.3.+herbs$means.4.+herbs$means.6.+herbs$means.7.+herbs$means.8.+herbs$means.9.)
lm3
summary(lm3)

#Create a subset of the data so that only vines are analyzed
type<-input1$GROWFORM
subset.data.frame(type,GROWFORM=Shrub, FALSE)
input1[input1$GROWFORM=='Vine',]
vines<-subset(input1,GROWFORM=='Vine')
vines

data4<-data.frame(vines$means.5.,vines$means.1.,vines$means.2.,vines$means.3.,vines$means.4.,vines$means.6.,vines$means.7.,vines$means.8.,vines$means.9.)
leaps(x=data4[,2:9],y=data4[,1],names=colnames(data4)[2:9],method="r2",nbest=1)
lm4<-lm(vines$means.5.~vines$means.1.+vines$means.2.+vines$means.3.+vines$means.4.+vines$means.6.+vines$means.7.+vines$means.8.+vines$means.9.)
lm4
summary(lm4)
