getwd()
setwd("D:/")

install.packages("readxl")
library(readxl)
sales <- read_excel("salesR�_��.xlsx") 
unique(sales$area)
factor(sales$area)
attach(sales)

cor.test(profit2, sales2)

ss <- lm(profit2~sales2)
summary(ss)

slmmodel <- lm(profit2~sales2+cost2)
summary(slmmodel)

#�w��--�ئn�^�k�O�i�H�i��w��
#�إ߭n�w������ƭ�

newsales <- data.frame(sales2=5000)
newsales


#�Q�Ωҫ�ĳ���^�k�Ҧ��w���Q��
predict(ss,newsales)


#�^�k�Ҧ��˴��X�O�_�`�A�B�ݮt�O�_�L�T�w�Ҧ�
# �w�˨ø��J ggfortify �M��
install.packages("ggfortify")
library(ggfortify)
autoplot(ss)

shapiro.test(ss$residual)

install.packages("car")
library(car)


durbinWatsonTest(ss)

ncvTest(ss)

#�G�]�l�ܲ��Ƥ��R-�p�Q���Qtype��area��sales2���v�T--�]�N�O�O���O�Y
#�Ǧa�Ϫ��Y�ǪF��|��o����n
#�n�Ҽ{��X�椬�ĪG

twoway<-aov(sales2~type*area, data=sales) #���]�lANOVA�ttype*area��
#���@�ζ��A���G�s�Jtwoway
summary(twoway) #���F�˩w���

print(model.tables(twoway,"means"),digits=3) #��ܦU�ե�����-3*2��


twoway<-aov(sales2~type+area, data=sales) #���]�l�ܲ��Ƥ��D�ĪG���R-- �椬�@�Τ����
summary(twoway)


##Practice

install.packages("RcmdrMisc") #�w��ø�ϮM��
install.packages("sandwich") #�w��ø�ϮM��
library(RcmdrMisc)
library(sandwich)
with(twoway, plotMeans(sales2,type,area,error.bars="se")) #ø�X������


install.packages("ggplot2")
library(ggplot2)

str(diamonds)
attach(diamonds)

cor.test(price, carat)

dd <- lm(price~carat)
summary(dd)

newdd <- data.frame(carat=5.8)
newdd

predict(dd,newss)

dd_lm <- lm(price~carat+table+depth+x+y+z)
summary(dd_lm) 


twoway<-aov(price~cut+color, data=diamonds) #���]�l�ܲ��Ƥ��D�ĪG���R-- �椬�@�Τ����
summary(twoway)

with(twoway, plotMeans(price,cut,color,error.bars="se")) #ø�X������

######

#����ഫ
#�ݽ����ݽ�
table(quartly) #�T�{���h�֭�����,�H�νs�X
#�ϥ�car�M��̭���recode���
install.packages("car")
library(car)
str(sales)
sales$quartly_r <- recode


#�ݶq���ݽ�
summary(profit2) #�T�{profit2����Ƥ���
#�Nprofit2 -69051~-1346�ƽs�X???L�A-1347~4676???M�A4677�H�W???H
sales$profit2_r <-recode(sales$profit2, "-69051:-1346='L';
-1347:4676='M'; else='H'")
#���s�X��W�[�s�ܼ�profit2_r�ݽ�
str(sales)
#�ݶq���ݶq
summary(profit2) #�T�{profit2����Ƥ���
#�Nprofit2 -69051~-1346�ƽs�X???1�A-1347~4676???2�A4677�H�W???3
sales$profit2_r <-recode(sales$profit2, "lo:-1346='1';
-1347:4676='2'; else='3'")
#���s�X��W�[�s�ܼ�profit2_r�ݶq--lo�Ϊk
str(sales)


