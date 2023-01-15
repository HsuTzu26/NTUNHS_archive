setwd("D:/rtemp")
getwd()
load("sales_D.RData")
head(sales_D)
str(sales_D)
sales_D$group_p1 <- ifelse(sales_D$group_p == 'H', 1, 0)#�N"H"/"L"�ഫ��0/1


sales1_glm1 <- glm(formula = group_p1 ~ ., family = "binomial", data = sales_D)

sales1_glm2 <- glm(formula = group_p1 ~ catalogue+type+sales2+cost2+profit2, family = "binomial", 
                   data = sales_D)

sales1_glm3 <- glm(formula = group_p1 ~ cost2, family = "binomial", data = sales_D) #���_�վ��J�ܼ�

summary(sales1_glm3)


##Practice
install.packages("AER")
library(AER)
data(CreditCard)

new <- data.frame(reports=0, age=30, income=10, owner="yes", months=50)

card_glm <- glm(formula = card ~ ., family = "binomial", data = CreditCard)

backcard <- subset(CreditCard, select = c(card, reports, age, income, owner, months))

card_glm <- glm(formula = card~., family = "binomial", data = backcard)

result <- predict(card_glm, newdata = new, type="response")
result # 0.98

new2 <- data.frame(reports=1, age=30, income=5, owner="no", months=50)

result <- predict(card_glm, newdata = new2, type="response")
result # 0.66

####
#kmeans iris����
iris2=iris[,-5] #�簣�̫�@��--�~���ܼơA���ͷs��ƶ�iris2
set.seed(1234)
kmeans.result=kmeans(iris2,3) #�]�w3�U�Ӷ��s�A�Hkmean��ƶi����s
kmeans.result #���ͷs�����cluster
kmeans.result$cluster #�d�ݦU��ƪ��������G
table(kmeans.result$cluster)
table(iris$Species, kmeans.result$cluster) #���즳�����P�s����
head(iris)
plot(iris2,col=kmeans.result$cluster)
#ø�� �H�Ḱ���׻P�e�׬���b�A�[�W���s���G
plot(iris2[c("Sepal.Length", "Sepal.Width")], col=kmeans.result$cluster)
#ø�� �H�����׻P�e�׬���b�A�[�W���s���G
plot(iris2[c("Petal.Length", "Petal.Width")], col=kmeans.result$cluster)

#k-K-Medoids
install.packages("fpc") #���JK-Medoids�M��
library(fpc)
pamk.result=pamk(iris2) #���γ]�w���s��
pamk.result
table(iris$Species, pamk.result$clustering)
table(iris$Species, pamk.result$pamobject$clustering)
plot(iris2, col=pamk.result$pamobject$clusterin) #ø��-- plot(pamk.result$pamobject$clusterin) #ø��--�ݤ��s���
#ø�� �H�Ḱ���׻P�e�׬���b�A�[�W���s���G
plot(iris2[c("Sepal.Length", "Sepal.Width")], 
     col=pamk.result$pamobject$clusterin)
#ø�� �H�����׻P�e�׬���b�A�[�W���s���G
plot(iris2[c("Petal.Length", "Petal.Width")], 
     col=pamk.result$pamobject$clusterin)

#ø��-�s�E��
plot(pamk.result$pamobject) #Silhouett�Y�ƽd��b-1 (�D�`�t)�M1 (�D�`�n)����
#��]��3�s
pamk.resultB=pamk(iris2,3) #�]�w3�s
pamk.resultB
table(iris$Species, pamk.resultB$pamobject$clustering)
plot(iris2, col=pamk.resultB$pamobject$clustering) #ø��-- plot(pamk.resultB$pamobject$clustering) #ø��--�ݤ��s���
plot(iris2[c("Sepal.Length", "Sepal.Width")], 
     col=pamk.resultB$pamobject$clusterin)
#ø��-�s�E��
plot(pamk.resultB$pamobject)