##Introduction ----

#To see the syntax of any function 
#just type ? followed by the name of functions
#To see how to create vectors using c() function use below
?c
Temperature = c(70,71,78,79,80,90)
Temperature
##Vectors ----

# The fundamental R data structure is the vector, which stores an ordered set of
# values called elements. A vector can contain any number of elements. However, all
# the elements must be of the same type; for instance, a vector cannot contain both
# numbers and text.

#Assigning values to variables (single value vector)
b<-10
a=20
#Creating vectors & determining the class of the vector
subject_name <- c("John Doe", "Jane Doe", "Steve Graves") #Char
temperature <- c(98.1, 98.6, 101.4) #Num
flu_status <- c(FALSE, FALSE, TRUE) #Boolean
# subject_name is of data type vector with 3 elements of type char
class(temperature) # Will return "numeric" as class
class(flu_status)
# access the second element in body temperature vector
temperature[2]
## examples of accessing items in vector
# include items in the range 2 to 3
temperature[1:2]
# exclude item 2 using the minus sign
temperature[-2]
#Indexing a vector
i=3
temperature[i] 
# use a vector to indicate whether to include item
temperature[c(TRUE, TRUE, FALSE)]
length(temperature)
sample_vect = c(20.5, "XYZ", FALSE)
sample_veact2 = c(20.5, FALSE)
#Finding average temperature over 3 days
#Mean is a base pacakage function to calculate average
mean(temperature)
median(temperature)
class(temperature) # Shows class ("numeric") of temperature vector
# Coercion vector. Precedence is applied.
#Order of precedence is Char, Numeric, Boolean
#Everything is converted to type "char"
#Class of vect will return "chararacter"
vect<-c(20,'B', TRUE)
class(vect)

##Matrices & Arrays ----

# A matrix is a data structure that represents a two-dimensional table, with rows and
# columns of data. R matrixes can contain any single type of data, although they are most
# often used for mathematical operations and therefore typically store only numeric data.
#The matrix cane be created row/column wise.

# Closely related to the matrix structure is the array, which is a multi-dimensional table
# of data. Where a matrix has rows and columns of values, an array has rows, columns,
# and any number of additional layers of values.

#Use ? help to see how to pass parameters to create a matrix/array
?matrix
?array
# create a 2x2 matrix
m <- matrix(c('a', 'b', 'c', 'd','e','f'), nrow = 3, byrow=TRUE)
m
dim(m)
# equivalent to the above
m <- matrix(c('a', 'b', 'c', 'd'), ncol = 2)
m
# create a 2x3 matrix
m <- matrix(c('a', 'b', 'c', 'd', 'e', 'f'), nrow = 2)
m
# create a 3x2 matrix
m <- matrix(c('a', 'b', 'c', 'd', 'e', 'f'), ncol = 2)
m
#create an array
ma <- array(1:24, dim=c(3,4,2))
ma2 <- array(1:20, dim=c(3,4,2))
# extract values from matrixes
m[1, 1]
m[3, 2]
m[1,]
m[,1]
# extract rows
m[c(1,3), ]
# extract columns
m[, 1:2]
# extract values from array
ma
ma[1,1,2]
ma[2,2,2]
ma[2,4,1]

##Factors -----

# A factor is a special case of vector that is solely
# used for representing nominal variables.
# add gender factor
gender <- factor(c("MALE", "FEMALE", "MALE"))
gender

# add blood type factor
blood <- factor(c("O", "AB", "A"),
                levels = c("A", "B", "AB", "O"))
blood2 = factor(c("O", "AB", "A"))
blood[4] = "AB"
blood[5] = "B"
blood[8] = "A"
blood
# display information for a patient
subject_name[1]
temperature[1]
flu_status[1]
gender[1]
blood[1]
 

##Lists ----

# Another special type of vector, a list, is used for storing an ordered set of values.
# However, unlike a vector that requires all elements to be the same type, a list allows
# different types of values to be collected. Due to this flexibility, lists are often used to
# store various types of input and output data and sets of configuration parameters for
# machine learning models
# create list for a patient
subject1 <- list(fullname = subject_name[1], 
                 temperature = temperature[1],
                 flu_status = flu_status[1],
                 gender = gender[1],
                 blood = blood[1])

mylist <- list(206, "A", FALSE, c(203,205,204))
## methods for accessing a list
subject1
# get a single list value by position
subject1[2]
subject1[[2]]
# get a single list value by name
subject1$temperature
# get several list items by specifying a vector of names
subject1[c("temperature", "flu_status")]
## access a list like a vector
# get values 4 and 5
subject1[4:5]

##Data Frames ----

# By far the most important R data structure utilized in machine learning is the data
# frame, a structure analogous to a spreadsheet or database since it has both rows and
# columns of data. In R terms, a data frame can be understood as a list of vectors or
# factors, each having exactly the same number of values. Because the data frame is
# literally a list of vectors, it combines aspects of both vectors and lists

# create a data frame from medical patient data
pt_data <- data.frame(subject_name, temperature, flu_status, gender,
                      blood, stringsAsFactors = FALSE)
# display the data frame
pt_data
View(pt_data)
## accessing a data frame
# get a single column
pt_data$subject_name
pt_data[1,]
pt_data[,2]
# get several columns by specifying a vector of names
pt_data[c("temperature", "flu_status")]
# this is the same as above, extracting temperature and flu_status
pt_data[2:3]
# accessing by row and column
pt_data[1, 2]
# accessing several rows and several columns using vectors
pt_data[c(1, 3), c(2, 4)]
#Leave a row or column blank to extract all rows or columns
# column 1, all rows
pt_data[, 1]
# row 1, all columns
pt_data[1, ]
# all rows and all columns
pt_data
# the following are equivalent to the above
pt_data[c(1, 3), c("temperature", "gender")]
pt_data[-2, c(-1, -3, -5)]

##Break & Assignment -----

BMI<-data.frame(height=c(185,167,172,145), Age=c(26,65,43,14))
names(BMI)<-c("Height(cm)","Age(Yrs)")
BMI

##Inbuilt Functions (Exploring Data - Part 1) ----

#Reading a csv file in r environment
#Please make sure your file is the same directory as your project
#Reading credit card transaction data and loading in a dataframe
cctrans<-read.csv('all_transactions.csv',header=TRUE, stringsAsFactors=FALSE,
                  sep=",")
#Reading hourly transaction data and loading in a dataframe
hrtrans<-read.csv('hour_transactions.csv',header=TRUE,  stringsAsFactors=FALSE,
                  sep=",")
#Reading diabetes and plasma data and loading in a dataframe
diabetes<-read.csv('Diabetes.csv',header=TRUE,  stringsAsFactors=FALSE,
                   sep=",")
plasma<-read.csv('Plasma.csv',header=TRUE,  stringsAsFactors=FALSE,
                 sep=",")
#Reading additional card data and loading in a dataframe
cardData<-read.csv('cardData.csv',header=TRUE,  stringsAsFactors=FALSE,
                   sep=",")

#Checking the structure of loaded file
str(cctrans)
str(hrtrans)
str(diabetes)

#View the sample n rows in a datframe
tail(diabetes, 5) #n-5
head(plasma, 15)
View(hrtrans)

#Summarize data
# summarize numeric variables
summary(cctrans)
summary(cctrans$numTrans)
summary(cctrans[c("numTrans", "numIntlTrans")])

#Combining rows of different dataframes using rbind
#Rbind can be used only when both dataframes have same number of columns
cctrans = cctrans[,-1]
cctrans_combined<-rbind(cctrans, hrtrans)

#Combining columns of different dataframes using cbind
#Cbind can be used only when both dataframes have same number of rows
complete_medical<-cbind(diabetes, plasma)

#Combining using merge
#Merge is typically used to join 2 dataframes when cbind/rbind cannot be used
#To use merge you need at least one common column in the 2 dataframes
#Else it creates a cartesian union
#Use below if your column name of common column is different
complete_card<-merge(cctrans, cardData, by.x="custID",by.y="ID_No",all=FALSE)
#Use below if your column name of common column is similiar
complete_card<-merge(cctrans, cardData, by.x="custID",by.y="ID_No", all=TRUE)

#Removing NA values
sum(complete_card$fakeId_Balance)
sum(complete_card$fakeId_Balance, na.rm=TRUE)

#Sorting in R
#Creating an index vector on creditLine column to sort on creditLine
#order function is used, see documentation for syntax
?order
indexes<-order(cctrans$creditLine)
#Sorting in ascending order and storing in a new data frame
#Take all columns with rows sorted by index of creditLine
#storing the results in a new dataframe
cctrans_sorted<-cctrans[-indexes,]
cctrans[,1]
cctrans_sorted2<-cctrans[indexes,1:2]#Select first 2 columns with rows sorted by index of creditLine
#Sorting in descnding order using rev on ascending indexes
cctrans[rev(indexes),]
#Creating descending order index
indexes<-order(cctrans$creditLine, decreasing=TRUE)

#Conditional subsetting
complete_medical[1:5,]#viewing first 5 rows & all columns
complete_medical[1:5,1:2]#viewing first 5 rows & first 2 columns
complete_medical[1:10,c(2,4)]#viewing first 10 rows & column 2 & 4
complete_medical[,-3]#viewing all rows & all columns except 3
complete_medical[-(10:700),-c(1,3)]#viewing all rows except rows 10-700 & all columns except 1&3
complete_card$balance[complete_card$balance>0]
complete_card[(complete_card$balance>0),]#view all balances > 0
complete_card[complete_card$balance==0,1]
complete_card[(complete_card$balance==0),]#view custId whose balance is 0
#view columns 2,4,6 where state is 2 and balance > 0
complete_card[(complete_card$state==35 & complete_card$balance>0),c(2,4,6)]
complete_card[(complete_card$state==2 | complete_card$balance>0),c(2,4,6)]
#show custID where fakeid_balance > 100 and not null(na)
complete_card[!is.na(complete_card$fakeId_Balance > 100),1]
#Subsetting using subset function and storing 
newdata <- subset(complete_card, (state!=2 & balance > 100))
newdata2 <- complete_card[(complete_card$state!=2 & complete_card$balance > 100),]

##Custom functions ----

#Creating a custom function to calculate the square of a number
#x is the input parameter (can be any data type:vector,list,matrix,dataframe)
# within the function

square<-function(x){
        if(is.numeric(x))(x*x)
        else(stop("Not a Number"))
}
square(9)
square("av")
num<-seq(0,20,2)
square(num)
#Creating a function to calculate average with default parameters
average<-function(x=c(10,20)){
        avg<-sum(x)/length(x)
        return(avg)
}
average()#default run
average(temperature)#with parameter
mean(temperature)
##Module 2 Class Assignment ----

#Assignment- Add a column called BMI Calc to the BMI dataframe
#BMI calc is a simple calculation BMI$Height/BMI$Age
#Add one more record using rbind
bmi_calc<-BMI$Height/BMI$Age
BMI<-cbind(BMI, bmi_calc)
bmi_new1<-c(190,78,10.6) #Creating a new record
BMI<-rbind(BMI, bmi_new1)
##Assignment - Play around with BMI & Telecom data and try to use inbuild funtions
#Examples below
BMI<-BMI[,1:2]
BMI[1:4,]
BMI[-3,]
BMI[c(1,2,4),]
BMI[,1]
#Also load iris dataset using below command and play around
data(iris)


square = function(x=1){
        z = x*x
        return(z)
}

square(3)
square()
square("ABC")
