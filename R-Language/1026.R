getwd()
setwd("D:/")

install.packages("readxl")
library(readxl)
sales <- read_excel("salesR�_��.xlsx")
attach(sales)
t.test(profit2,conf.level=0.95)

t.test(profit2,mu=4500, conf.level=0.95) #�����˩w
#�˩w���G�P�w ��t�Ϊ�p�� �P�w�C
#���ҡX�����A��ۤ��Ǭ�0.025
#�X�˥��Ȧ�0.01876�����v�|�b4500�W�U
#�X�]������ڵ���X������4500
#R �Ҧ��H��϶�-�O�˥������ƪ��H��϶�


t.test(profit2,mu=4500, alternative="less", conf.level=0.90) #�����˩w
#�˩w���G�P�w:���ҡX����A
#�˥�t= -2.3528�A�j��4500��p�Ȭ�0.0094�A
#�]���ڵ���L���]�A������߰��]---���j��4500


t.test(profit2,mu=4500, alternative="greater", conf.level=0.90) #�k���˩w
#�˩w���G�P�w:�ڵ� -���ҡX����A
#��ۤ��Ǭ�0.1�A�˥�t= -2.3528�A
#��p�Ȭ�0.9906���i�ศ�󱵨���X������L���]�X�p��4500


#Practice
install.packages("ggplot2")
library(ggplot2)
attach(diamonds)

t.test(price, conf.level=0.9)
t.test(x, mu=5.7,  conf.level = 0.9)
t.test(x, mu=5.8,  alternative="less",conf.level = 0.9)
t.test(x, mu=5.74,  alternative="greater",conf.level = 0.9)


####
#���˥��˩w---�ݽ���ݶq�X�parea�����_���B�����A�Q���Q�_������profit�O�_���t��
#�ܲ��ƦP����˩w�X�z�פW�n��-�]����s����ܲ��ƦP��P�_�A�����P�˩w���
bartlett.test(profit2~area) #��Ӥ��Ǧb�P��� �� var.test (x, y) ���P�� #�n����Ʋզ��өw


attach(sales)
#���˥������˩w
t.test(profit2~ area, alternative= "two.sided",var.equal=T) # �]�ܼơ���ܼơA�˩w���A�A�ܲ��ƬO�_�۵� T:�ܲ��Ƭ۵�
t.test(profit2~ area, alternative= "two.sided",var.equal=F) #����


#Practice
attach(sales)
t.test(profit2~ area, alternative='two.sided',var.equal=F)
t.test(cost2~ area, alternative='two.sided',var.equal=F)

####
#�ܲ��ƦP���˩w
bartlett.test(sales2~(type))
#-----�ܲ��Ƥ��P��A�ƫ������R Welch's ANOVA
oneway.test(sales2 ~ type, data = sales, var.equal = FALSE)
#-----�ܲ��Ƥ��P��A�ƫ������R DTK
install.packages("DTK")
library(DTK)
attach(sales)
posthoc<- with(sales, DTK.test(sales2,type))
posthoc
#�ܲ��ƦP�褧�˩w�G
y<-aov(lm(sales2~factor(type)))
summary(y)
#�ƫ����G
TukeyHSD(y)
plot(TukeyHSD(y))
#���ݽ��ܼ�--�d���˩w----�˩w���ݽ��ܼƬO�_���t��
chisq.test(type,area)
chisq.test(type,catalogue)
chisq.test(type,city)
table(type,area) #�i���s�@�C�p���ݬO�_����ۮt���A����i���˩w

#Practice
attach(diamonds)
table(cut,clarity)
chisq.test(cut,clarity)

table(cut,color)
chisq.test(cut,color)

table(color,clarity)
chisq.test(color,clarity)