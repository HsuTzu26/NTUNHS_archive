pkgs <- c("gapminder", "dplyr","ggplot2") #�ϥ�c ��Ƥ@���˦h�ӮM��
install.packages(pkgs)
library(dplyr) #�޽u�ާ@�n��
library(gapminder) #�m�ߥΪ���ƶ�
library(ggplot2)
str(gapminder)
x <- 1200
x %>% log %>% sqrt %>% mean # ���G���P�U��
mean(sqrt(log(x)))

colnames(gapminder)

str(gapminder)

unique(gapminder$country) 

gapminder %>% filter(year == 2007) %>% View()

gapminder %>% filter(year == 2007) %>% select(country)%>% View()

gapminder %>% mutate(pop_new = pop / 1000)

gapminder %>% arrange(year)

gapminder %>% filter(year == 2007) %>% summarise(sum(pop))

gapminder %>% filter(year == 2007) %>% group_by(continent)%>% summarise(sum(pop))

dim(gapminder) # �d�ݦh�ֵ���Ʀh���ܼ�
gapminder %>% dim() #
head(gapminder) # �d�ݸ�ƫe����
gapminder %>% head() #
str(gapminder)
tail(gapminder)
colnames(gapminder)
summary(gapminder) #�J�`��
unique(gapminder$country) #�d�ݰ�a��즳���ǿW�߸�ƭ�unique(gapminder$continent)
unique(gapminder$year) #Year�Ȧ�12�Ӧ~��

# filter()
filter(gapminder, country == "Taiwan") %>%View() #��a�欰�x�W�����
gapminder %>%
filter(country %in% c("Taiwan", "Japan")) %>% View() # A %in% B�GA�O�_�bB ��
# select() ��X�ŦX�������
gapminder %>% select(country, continent)%>% View() #�ߧY�d�ݵ��G
gc <-gapminder %>% select(country, continent) #�N���G���w��gc�ܼ�
# arrange() ��ƱƧ�
gapminder %>% arrange(pop)

# summarise() �D��ŦX�~�׬�2007�A�ñNpop�ର�ƭȫ�D�X�J�`��
gapminder %>% filter(year == 2007) %>% summarise(sum(as.numeric(pop)))
#as.numeric()-�T�O�ର�Ʀr
#�Q�A�ѦU�~�ת��H�f��
# group_by() �H�~�צX�ָ�ơA�èD�Xpop�J�`��
gapminder %>% group_by(year) %>% summarise(sum(as.numeric(pop))) %>% View()
gap_year<- gapminder %>% group_by(year) %>%
  summarise(sum(as.numeric(pop))) #��ƥt�s�J�ܼ�
gap_year #�d���ܼƭ�
names(gap_year) <- c("year","sum_pop") #������ܼƦW��

#dplyr �Pggplot2���X
#�e�X�U�~�ת��J�`��
ggplot(gap_year)+ geom_point(aes(x = year, y = sum_pop))
ggplot(gap_year)+ geom_point(aes(x = year, y = sum_pop,size=sum_pop))





# Practice
##1�D�X2007�~�׸�ơA������j�w��pop�PlifeExp��gdpPercap�����Y
gapminder %>% filter(year == 2007) %>% View()

str(gapminder)
unique(gapminder$year)
gapminder_2007 <- gapminder %>%filter(year == 2007)

ggplot(gapminder_2007)+ geom_point(aes(x = pop, 
    y = gdpPercap,size=gdpPercap, color=continent)) + 
    scale_x_log10() + scale_y_log10()

##2 ��X2007�~�פ��Ȭw����a-gdpPercap�Ѥj��p�ƦC�Apop�Ѥp��j
gapminder %>% filter(year == 2007, continent=="Asia") %>%
  arrange(pop, desc(gdpPercap)) %>% View()

##3 ��X2007�~�פ��Ȭw����a�A�ä��pop�PlifeExp�����Y
gapminder_2007_Asia <- gapminder %>% filter(year == 2007, continent=="Asia") %>%
  arrange(pop, desc(gdpPercap))
gapminder_2007_Asia

ggplot(gapminder_2007_Asia)+ geom_point(aes(x = pop, 
    y = lifeExp,size=gdpPercap, color=country)) + 
    scale_x_log10() + scale_y_log10()

