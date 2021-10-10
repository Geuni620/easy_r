#install.packages("ggplot2")
library(ggplot2)
rm(list=ls())

#데이터 프레임 만들기
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
df_midterm <- data.frame(english, math)

class <- c(1, 1, 2, 2)
df_midterm <- data.frame(english, math, class)

#분석하기
mean(df_midterm$english)
mean(df_midterm$math)

#데이터 프레임 한번에 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))

#책에서 제시하는 문제
# df_fruit <- data.frame(가격 = c(1800, 1500, 3000),
#                        판매량 = c(24, 38, 13))
# a <- c("사과", "수박", "딸기")
# df_fruit <- data.frame(df_fruit, row.names = a)

df_fruit <- data.frame(fruit = c("사과", "딸기", "수박"),
                       price = c(1800, 1500, 3000),
                       volumn = c(24, 38, 13))

#외부 데이터 이용하기
install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx")

mean(df_exam$english)
mean(df_exam$science)

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=3, col_names = F)
df_csv_exam <- read.csv("csv_exam.csv", header = T, stringsAsFactors = F)

#데이터 프레임을 CSV 파일로 저장하기
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
write.csv(df_midterm, file = "df_midterm.csv")

#RData 활용하기
save(df_midterm, file = "df_midterm.rda")

#load 하기전 df_midterm 삭제
rm(df_midterm)
load("df_midterm.rda")

#데이터 파악하기
exam <- read.csv("csv_exam.csv")
head(exam) # 앞에서부터 6행까지 출력
head(exam , 10) #앞에서부터 10행까지 출력

tail(exam) # 뒤에서부터 6행까지 출력
tail(exam, 10) #뒤에서부터 10행까지 출력

install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
dim(mpg)

?mpg
str(mpg)

#변수명 바꾸기
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
# df_raw
# install.packages("dplyr")
# library(dplyr)

df_new <- df_raw
df_new <- rename(df_new, V2 = var2)

#책에서 내는 문제
#ggplot2() 패키지의 mpg 데잍를 사용할 수 있도록 불러온 후 복사본을 만들기
rm(list=ls())
library(ggplot2)
mpg_modi <- mpg

#복사본 데이터를 이용해 cty → city, hwy → highway로 수정
mpg_modi <- rename(mpg_modi, city=cty, highway=hwy)
str(mpg_modi)

#책 정답
mpg_new <- as.data.frame(ggplot2::mpg)
mpg_new <- rename(mpg_new, city=cty, highway=hwy)
str(mpg_new)

#파생변수 만들기
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df$sum <- df$var1+df$var2
df$mean <- (df$var1+df$var2)/2

mpg$total <- mpg$ty + mpg$hwy

mpg$total <- (mpg$cty+ mpg$hwy)/2
head(mpg)

mean(mpg$total)

#조건문을 활용해 파생변수 만들기
##전체 자동차 중에서 연비 기준을 충족해 '고연비 합격 판정'을 받은 자동차가 몇 대?
summary(mpg$total)
#히스토그램 만들기
hist(mpg$total)

#조건문
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
#빈도
table(mpg$test)
library(ggplot2)
qplot(mpg$test)

#중첩 조건문
mpg$grade <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C"))
head(mpg$grade, 10)

#빈도
table(mpg$grade)
qplot(mpg$grade)


#원하는 만큼 범주 만들기
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))

#분석 도전!
rm(list=ls())
#Q1. ggplo2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 특징을 파악하세요.
library(ggplot2)
library(dplyr)
head(midwest, 10)
midwest_rename <-as.data.frame(midwest)

#Q2. poptoal 변수를 total로, popasian변수를 asian으로 수정정
midwest_rename <- rename(midwest, total = poptotal, asian = popasian)
head(midwest_rename)

#Q3. total, asian 변수를 이용해 전체 인구 대비 아시아 인구 백분율 파생변수로 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 보기
midwest_rename$percent <- (midwest_rename$asian/midwest_rename$total) 
round(midwest_rename$percent, 3)
hist(midwest_rename$percent)

#Q4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 large, 그외는 small을 부여하는 파생변수 만들기
midwest_rename$mean <- mean(midwest_rename$percent)
midwest_rename$volunm <- ifelse(midwest_rename$percent > midwest_rename$mean, "large", "small")

#Q5. large와 small에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해 보기.
table(midwest_rename$volunm)
qplot(midwest_rename$volunm)

