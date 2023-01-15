#�@�BR�M����򥻮M��---- 
#A.C5.0
install.packages("C50")
library(C50)
c50tree=C5.0(Species~ .,data=iris) # iris R���ظ�ƶ�
summary(c50tree)
plot(c50tree)

#B.rpart 
install.packages("rpart")
library(rpart)
rptree <- rpart(Species~ .,data=iris,
                method = "class", control = rpart.control(cp = 0.001)) #method �]��"anova"
#h control = �i�@���ŪK���k�h--�վ� cp = ����
par(mfrow = c(1,2),xpd = NA) #�ϧΪ��y�ЬO�qR�̭��ϧε�������ض}�l��
plot(rptree)
text(rptree,use.n = TRUE)
#�i�H�����rattle�ӵerpart����
install.packages("rattle")
library("rattle")
fancyRpartPlot(rptree)
summary(rptree)

#C.tree
install.packages("tree")
library(tree)
par(mfrow = c(1,1),xpd = NA) #�ϧΪ��y�ЬO�qR�̭��ϧε�������ض}�l��
t_tree<-tree(Species~ .,data=iris)
plot(t_tree)
text(t_tree)
summary(t_tree)

#�Ҧ�²�����p
getwd()
irisnew2=read.table("iris_new2.txt",header=T,sep=",")
iris.pred=predict(c50tree,irisnew2,type='class')#�HPREDICT��ƶi��w��-�����Ҧ��H�θ��
iris.pred
irisall=data.frame(irisnew2,iris.pred)#�X�ַs��ƻP�w����merge predict result and output
irisall #²����k�A�Ҧ��n�a�å�����
iris.pred=predict(rptree,irisnew2,type='class')#���rpart�Ҧ��i��w��-�����Ҧ��H�θ��
iris.pred

#�m�� 1
#�]�ܼơGcard�A���ܼơX��Greports, age, income, 
#expenditure, owner, dependents, active
install.packages("AER")
library(AER)
data(CreditCard)
head(CreditCard)
rptree <- rpart(card~ .,data=CreditCard,
                method = "class", control = rpart.control(cp = 0.001)) #method �]��"anova"
#h control = �i�@���ŪK���k�h--�վ� cp = ����
par(mfrow = c(1,2),xpd = NA) #�ϧΪ��y�ЬO�qR�̭��ϧε�������ض}�l��
plot(rptree)
text(rptree,use.n = TRUE)
install.packages("rattle")
library("rattle")
fancyRpartPlot(rptree)
summary(rptree)


#�m��2
#���Jsales_D.Rdata�A�]�ܼơG group_p�A�D�藍�P��
#�ơA�վ�control = rpart.control(cp = 0.001)�X�ŪK�A
#�p�G0.05���h���վ�
load("sales_D.RData")
head(sales_D)
str(sales_D)
rptree <- rpart(group_p~ .,data=sales_D,
                method = "class", control = rpart.control(cp = 0.05)) #method �]��"anova"
#h control = �i�@���ŪK���k�h--�վ� cp = ����
par(mfrow = c(1,1),xpd = NA) #�ϧΪ��y�ЬO�qR�̭��ϧε�������ض}�l��
plot(rptree)
text(rptree,use.n = TRUE)
install.packages("rattle")
library("rattle")
fancyRpartPlot(rptree)
summary(rptree)

#�ҫ�m��
#�E �H�����Ҫ�����ɬ��ҡA�]�ܼƬ�Total�A�ХH���ܼ�
#Channel, Region, Fresh, Milk����J�ܼơA�m�߶]�M���ơC
#�E �p�G�L�k���Q�]�X�A�иյ۱Ntotal����(�Ѧ�08�έp�˩w2
#                       ���q)�A�Ѧҫ��O
quantile(Total, c(0.33,0.67))
max(Total)
min(Total)
install.packages("car")
library(car)
#�Hrecode���O�NTotal�ର���B�C�A�Ϊ̰����C�A���]�M����

install.packages("readxl")
library(readxl)

getwd()
setwd("D:/")

sales <- read_xlsx("wholesalesR.xlsx")

#�ݶq���ݽ�
summary(sales$Total) #�T�{profit2����Ƥ���
sales$Total_r <-recode(sales$Total, "904:26938='H1';
26940:110829='M'; else='H2'")
#���s�X��W�[�s�ܼ�profit2_r�ݽ�
str(sales)



rptree <- rpart(card~ .,data=sales,
                method = "class", control = rpart.control(cp = 0.001)) #method �]��"anova"
#h control = �i�@���ŪK���k�h--�վ� cp = ����
par(mfrow = c(1,2),xpd = NA) #�ϧΪ��y�ЬO�qR�̭��ϧε�������ض}�l��
plot(rptree)
text(rptree,use.n = TRUE)
install.packages("rattle")
library("rattle")
fancyRpartPlot(rptree)
summary(rptree)