setwd("d:/rtemp")
getwd()
pkgs<-c("readr","dplyr","ggplot2")
install.packages(pkgs)
library(readr)

live <- read.csv("Live_20210128.csv", sep = ",", header = TRUE, 
                 stringsAsFactors = FALSE)
#�d�ݸ�Ƶ��c�M��z���
str(live)
live1 <- data.frame(live[,c(2,4:12)])
str(live1)
attach(live1)

as.factor(live1$status_type)

#Base: ���Φw��(R�J��)��ø�ϻP�ԭz�έp�A���˩w
#�V ���J���: readr (csv��), readxl(excel��) �V ø��: ggplot2
#�V ��ƾާ@:dplyr �V �M����:C5.0, tree, rpart, CHAID
#�V ���s���R:k-mean, hclust �b base, fpc (kmedoids)

#�|�ؤ��R
#��:status_type, status_published
#�q:
#num_reactions num_comments,num_shares
#num_likes num_loves num_wows num_hahas
#num_sads num_angrys

#4��status type�i�H���O�]�ԭz�ʲέp�Mdyplr������


#1.dplyr -��ƳB�z
library(dplyr)
attach(live1)
live1 %>% group_by(status_type)%>%select(num_reactions)%>%
  summarise(mean(num_reactions))%>%View()

live1 %>% group_by(status_type)%>%select(num_likes)%>%
  summarise(mean(num_likes))%>%View()

live1 %>% group_by(status_type)%>%select(num_shares)%>%
  summarise(mean(num_shares))%>%View()

#2. ANOVA�˩w- �ܲ��Ƥ��R
attach(live1)
bartlett.test(num_reactions~status_type) #�ܲ��Ƥ��P��
oneway.test(num_reactions~status_type, data=live1, var.equal = FALSE)
#�ƫ���R
library(DTK)
attach(live1)
posthoc <- with(live1, DTK.test(num_reactions, status_type))
posthoc

#3. �M����
install.packages("rpart")
library(rpart)
library(rpart.plot)

rptree <- rpart(status_type~num_reactions+num_likes+num_shares,
      data=live1, method="class", control=rpart.control(cp=0.001))
prp(rptree, box.palette=list("red","pink","Blues","green"))

#4. ø��(ggplot2)
library(ggplot2)
ggplot(data=live) + geom_point(aes(x = num_comments+num_likes+num_shares, 
      y =num_sads+num_angrys, color=status_type)) + facet_wrap(~status_type)