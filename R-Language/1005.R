install.packages("readr")
library(readr)
setwd("d:/")#�H�]�w�u�@��d�Ѭ���
test <- read.csv("WHO.csv",sep = ",",header = TRUE,stringsAsFactors =
                   FALSE) #Ū���ɮ�
head(test)
str(test)#�d���ɮ׸�Ƶ��c
attach(test) #�s��ϥ�test�ɮ�

#���ܼ�--�ݶq�ܼ�
mean(CellularSubscribers) #����|���⤣�X
mean(CellularSubscribers, na.rm = T)#������|��
sd(CellularSubscribers)
sd(CellularSubscribers, na.rm = T)
hist(CellularSubscribers)#�ݶq���
hist(CellularSubscribers, breaks = 20)
boxplot(CellularSubscribers)
barplot(CellularSubscribers)
# �ݽ��ܼ�-���ܼ�
#barplot() ���ø�s�����Ϩӱ������O���W�v-�ݵ��Xtable:�p��X����
barplot(table(Region),las=2)
par(mfrow=c(1,1), cex=0.5, las=1) #�վ�e���榡
barplot(table(Region)) 

#�d����ܼƥi�����s
#������ Scatterplot -�ݶq���ݶq
par(mfrow=c(1,2), cex=0.6, las=2)
plot(Under15, GNI)
plot(test$Population,test$CellularSubscribers)
par(mfrow=c(1,2), cex=0.6, las=1)
plot(Under15, GNI)
plot(GNI,CellularSubscribers)
#������ Boxplot #�ݦ��ݽ�f�t�ݶq�ܼ�
boxplot(CellularSubscribers ~ Region, las=3)
boxplot(CellularSubscribers ~ Region,
        xlab = "", ylab = "CellularSubscribers",
        main = "CellularSubscribers of Countries by Region")
#�ݽ�f�t�ݶq�ܼ�--���G�ݥX���Y

#��¦ø��
#�����
hist(GNI, main = "GNI Histogram", xlab = "GNI")
#������
plot(GNI ~ LiteracyRate)
#��Ž�� ���ܼ�
boxplot(GNI) #�GŽ-- 1.5 IQR-�W�U���]�P�ǲβέp���P�^
boxplot(GNI)$stats #�e�{��Ž�Ϭ����έp��
#��Ž�� ���ܼ�
boxplot(GNI~Region,las=1)


#�i��ø��
install.packages("ggplot2")#�w��ggplot2�M��
library(ggplot2)
# as.factor(Region) #��Ʈ榡�ഫ-�ثe�ഫ�P�_�A���v�T
#���ܼ�-�i�[�W�C��--�����
ggplot(data = test) + geom_histogram(aes(x = GNI))
ggplot(data = test) + geom_histogram(aes(x = GNI),
                                     fill = "blue",bins = 30) #�[�W�C��ó]�w����

#���ܼơX�ݽ��ܼ�
ggplot(data = test) + geom_bar(aes(x=Region)) #�L���ϥ�table
ggplot(data = test) + geom_bar(aes(x=Region),fill =
                                 "pink")

#���ܼ� boxplot- �ݶq���ݽ�F�ݶq���ݶq
ggplot(data=test) + geom_boxplot(aes(x = GNI, color=Region))
ggplot(data=test) + geom_point(aes(x = GNI, y =
                                     LifeExpectancy))
ggplot(data=test) + geom_line(aes(x = GNI, y =
                                    LifeExpectancy))

#�T���ܼ� ����ݶq�f�t�@���ݽ�
ggplot(data=test) + geom_point(aes(x = GNI, y =
                                     LifeExpectancy)) #�Ȩ���ܼ�
ggplot(data=test) + geom_point(aes(x = GNI, y =
                                     LifeExpectancy, color= Region)) # �Q��cloro�[�J�ݽ��ܼ�
# �[�W�ݽ誺�ܼƫ�A�a���ܼƪ��S�x�����i�H�ݥX�I�I

ggplot(data=test) + geom_point(aes(x = GNI, y = LifeExpectancy)) +
  facet_wrap(~Region) #�z�L�ϼh�[�ĤT���ܼ�
ggplot(data=test) + geom_point(aes(x = GNI, y = LifeExpectancy,
                                   color= Region)) + facet_wrap(~Region)
#�ݥX�a�Ϯt���F��

# Diamonds ��ƶ�-���ة�ggplot2 �w�˧��i�����I�s
install.packages("ggplot2")
library(ggplot2)
head(diamonds)

#�T���ܼ� �@���ݶq�f�t����ݽ�X�ϥ�ggplot2���ظ�ƶ�-diamonds
str(test) #�Ȩ���ݽ��ܼ�
str(diamonds) #�h���ݽ��ܼ�
ggplot(data=diamonds) + geom_boxplot(aes(x = price, color=cut))
ggplot(data=diamonds) + geom_boxplot(aes(x = price,
                                         color=cut))+facet_wrap(~clarity)

#��δ�����-����ݶq�ܼ�+�@���ݽ�
ggplot(data=diamonds) + geom_point(aes(x = price, y=carat))
+facet_wrap(~cut)
# �Q��color�[�J�ĥ|���ܼ�
ggplot(data=diamonds) + geom_point(aes(x = price, y=carat,color= color))
+facet_wrap(~cut)

# ggplot2 ��ơB�y�жb�B�ϼh�~�A�|�i�[�J--�έp�u��
ggplot(data=diamonds) + geom_point(aes(x = price,
                                       y=carat,color= color)) +facet_wrap(~cut)+
  geom_smooth(aes(x = price, y=carat))


ggplot(data = diamonds) + geom_histogram(aes(x =
                                               carat,bins= 20)) +facet_wrap(~color)
#�����Ϭ��� �]��øY�b�AX�b�T�w��1�^�����Ϭ���
#�]��øY�b�AX�b�T�w��1�^
ggplot(diamonds, aes(y = carat, x = 1)) + geom_point()
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot() #��Ž��
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot() #�Hcut��X�b�Aø�X���P�ϼh
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() #�p���^��

#Hw - supermarket_sales.csv
install.packages("readr")
library(readr)
setwd("d:/")
testcsv <- read.csv("supermarket_sales.csv",sep=",",header = TRUE,stringsAsFactors =
                   FALSE)
str(testcsv)

install.packages("ggplot2")#�w��ggplot2�M��
library(ggplot2)
ggplot(data=testcsv) +  geom_boxplot(aes(x=cogs, y=gross.income,
                                       color=City))+ facet_wrap(~City)

ggplot(data=testcsv) +  geom_boxplot(aes(x=cogs, y=gross.income,
                                       color=Payment))+ facet_wrap(~Payment)

ggplot(data=testcsv) +  geom_boxplot(aes(x=Tax.5., y=Unit.price,
                                       color=Product.line))+ facet_wrap(~Product.line)

ggplot(data=testcsv) +  geom_boxplot(aes(x=cogs, y=gross.income,
                                       color= Gender))+ facet_wrap(~ Gender)