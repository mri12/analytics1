# Data Structures

#vectors----
v1 = 1:100  #create vector from 1 to 100
v2 = c(1,4,5,10)

class(v1)  #vector with no decimal values - integer
class(v2) #vector with decimal - numberic (like double)

v3 = c('a','Mridula','Maha')
v3 #print the vector

class(v3)

v4 = c(TRUE,FALSE,T,F,T)
class(v4)

#summary on vectors
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(women$height)
v2[v2>5]

x = rnorm(60,mean=60, sd=10)
x
plot(x)
hist(x)

plot(density(x))
abline(v=60)
#rectangles and density line together
hist(x,freq=F)
lines (density(x))
hist(x,breaks=10,col=1:3)

length(x)
sd(x)

?sample

x1 = LETTERS[5:20]
x1

set.seed(1234) #to set the required order of execution -to repeat the sequence
y1=sample(x1)
y1


(y2=sample(x1,size=5))


(gender = sample(c('M','F'),size = 1000000,replace=T,prob=c(.3,.7)))
(t1=table(gender))
prop.table(t1)

pie(t1)


barplot(t1,col=1:2,horiz=T)



#matrix-----
(m1 = matrix(1:24,nrow =4))

(m1 = matrix(1:24,nrow =4,byrow=T)) #to fill row-wise - by default it is byrow = F

(m3 = matrix(1:24,ncol =4,byrow=T))

(x = trunc(runif(60,60,100)))

plot(density(x))

#round, trunc, ceiling , floor -  used to remove decimal values

(m4 = matrix(x,ncol =6))

colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)

m4[m4>67]
m4[m4>67 & m4<86]

m4[8:10, ] #print rows 8-10

m4[8:10,c(1,3,5)]

rowSums(m4[8:10,c(1,3,5)])


#array----


#data.frame
#roll no., name, gender, course, marks1 ,marks2
(rollno = 1:60)
(name = paste('student1',1:60,sep = '-'))

(gender = sample(c('Male','Female'),size = 60,replace=T,prob= c(.3,.7)))

(course = sample(c('BBA','MBA','FPM'),size = 60, replace=T,prob = c(0.2,0.5,0.3)))

(marks1 = ceiling(rnorm(60,mean=65,sd=7)))
(marks2 = ceiling(rnorm(60,mean = 60,sd =11)))

(grades = sample(c('A','B','C'),size = 60, replace =T))


students = data.frame(rollno,name, gender,course,marks1,marks2,grades,stringsAsFactors = F)

class(students)
summary(students)

students[,c('name')]

students[students$gender == 'Male',c('rollno','gender','marks1')]
students[students$gender == 'Male' & students$grades == 'C',c('rollno','gender','marks1')]

students[students$marks1>55 | students$marks1<75,c('name','marks1')]

students$gender

t1=table(students$gender)

barplot(table(students$course))

str(students)
nrow(students)
names(students)
dim(students)


aggregate(students$marks1, by=list(students$gender),FUN = mean)
aggregate(students$marks2, by=list(students$course),FUN = max)

aggregate(students$marks2, by=list(students$course,students$gender),FUN = mean)


#dplyr
library(dplyr)
?dplyr

# piping  - to group and create aggregates
students %>% group_by(gender) %>% summarise(mean(marks1))

students %>% group_by(course, gender) %>% summarise(meanmarks1 = mean(marks1),min(marks2),max(marks2)) %>% arrange(desc(meanmarks1))

students %>% arrange(desc(marks1)) %>% filter(gender == 'Male') %>% top_n(5)



# sample_frac

students %>% sample_frac(.1) %>% arrange(course)
students %>% sample_n(2)





#factors
names(students)
students$gender = factor(students$gender)
summary(students$gender)
summary(students$course)

students$course = factor(students$course,ordered = T, levels =c('FPM','MBA','BBA'))
summary(students$course)

students$grades
#C,A,B
students$grades = factor(students$grades,ordered=T,levels=c('C','A','B'))
students$grades

table(students$grades)
barplot(table(students$grades))

students

# writing to a csv
write.csv(students,'./data/iimtrichy.csv')

students2 = read.csv('./data/iimtrichy.csv')
head(students2)









#extra-commands
name[1:10]
name[15:20]
name[c(15,20,37)]
name[-c(1:10)]
rev(name)
name[60:1]
name[-c(1:10,35:40)]