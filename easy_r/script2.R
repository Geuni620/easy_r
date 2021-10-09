install.packages("ggplot2")
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
library(readxl)
getwd()
install.packages('Rcpp')
df_exam <- read_excel("excel_exam.xlsx")

#문제 발생
remove.packages("ggplot2")

