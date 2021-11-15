## Read in Data
data <- read.csv("audio.csv")
data
rownames(data)=data[,1]
data=data[,-1]

## Step 1 , Explore the data
summary(data)
var1=var(data$L500)
var2=var(data$L1000)
var3=var(data$L2000)
var4=var(data$L4000)
var5=var(data$R500)
var1
var2
var3
var4
var5
var6
var7
var8

#Standard Deviation
sqrt(var1)
rho=cor(data)
rho

## Step 2 - Define the problem in terms of principal components
#Create a Co-variance matrix
#The off variables are covariances.
#Remember correlation is equal to the covariance of two variables/standard deviation of both
#Correlation is scaling of the covariance.
#Covariance is equal to the standard dev of x * standard dev of Y
sigma=var(data)
sigma
cor(data)
cov(data)

#Get the variance
vars=diag(sigma)
vars
#Get the percentage of variances- who is responsible for the most variance?
percentvars=vars/sum(vars)
percentvars
ident=diag(5)
ident

## Step 3 - Compute all the eigenvalues and eigenvectors in R
eigenvalues=eigen(sigma)$values
eigenvectors=eigen(sigma)$vectors
eigenvalues
eigenvectors

# define principal componenets
y1=as.matrix(data)%*%(eigenvectors[,1])
y2=as.matrix(data)%*%(eigenvectors[,2])
y3=as.matrix(data)%*%(eigenvectors[,3])
y4=as.matrix(data)%*%(eigenvectors[,4])
y5=as.matrix(data)%*%(eigenvectors[,5])
y=as.matrix(data)%*%eigenvectors
y
y1
y2
y3

## Step 4 - Check variance estimates of the pcs and all other properties
var1+var2+var3+var4+var5+var6+var7+var8
percentvars
sum(eigenvalues)
percentvars_pc=eigenvalues/sum(eigenvalues)
percentvars_pc

## C: sum of variances  
var1+var2+var3+var4+var5
var(y1)+var(y2)+var(y3)+var(y4)+var(y5)

## D: Magnitude of eigenvectors are importance of kth variable in the ith PC
eigenvectors

## E:  correlation between Yi and Xk
eigenvectors[,1]
cor(y1,data)
eigenvectors[,1]*sqrt(eigenvalues[1])/sqrt(diag(vars))

# E: are they uncorrelated?
sigma_pc=var(y)
rho_pc=cor(y)
round(rho_pc)

## Step 5 - Nice plots and Interpret PCs
ts.plot(cbind(percentvars,percentvars_pc),col=c("blue","red"),xlab="ith vector",ylab="percent variance")
plot(y1,y2)
text(y1,y2, labels = rownames(data), pos = 4, cex=.5)

#prcomp(data)
#autoplot(prcomp(data))

## Step 6 - regression, use as an input
set.seed(1002)
dv=rowSums(data)+rnorm(24,mean=0,sd=10)
summary(lm(dv~as.matrix(data)))$r.squared
summary(lm(dv~as.matrix(y)))$r.squared
summary(lm(dv~data$L4000+data$R4000))$r.squared
summary(lm(dv~y1+y2))$r.squared

## let's pick the best two
cor(dv,data)
summary(lm(dv~data$L4000+data$R4000))
summary(lm(dv~y1+y2))

## Step 7 - standardize variables, see how PC changes.
data=scale(data)
data=as.data.frame(data)
#repeat top part of analysis.

