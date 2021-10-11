#자유자재로 데이터 가공하기
rm(list=ls())
library(dplyr)
exam <- read.csv("csv_exam.csv")

#Class가 1인 경우만 추출해 출력
exam %>% filter(class == 1)

#Class가 2인 경우만 추출해 출력
exam %>% filter(class == 2)

#Class가 1이 아닌 경우 추출해 출력
exam %>% filter(class != 1)

#Class가 3이 아닌 경우 추출해 출력
exam %>% filter(class !=3)

#초과, 미만, 이상, 이하 ,조건 걸기
exam %>% filter(math > 50) #수학 점수가 50점 초과한 경우
exam %>% filter(math < 50) #수학 점수가 50점 미만인 경우
exam %>% filter(english >= 80) #영어 점수가 80점 이상인 경우
exam %>% filter(english <= 80) #영어 점수가 80점 이하인 경우

#여러 조건을 충족하는 행 추출하기(and, or)
exam %>% filter(class == 1 & math >= 50) #1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 2 & english >=80) #2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(math >=90 | english >=90) #수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(english < 90 | science < 50) #영어 점수가 90점 미만이거나 과학 점수가 50점 미만인 경우

exam %>% filter(class == 1 | class == 2 | class == 3)
exam %>% filter(class %in% c(1, 3, 5))

#혼자서 해보기
#Q1 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다.
#displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요
rm(list=ls())
library(ggplot2)
mpg_copy <- as.data.frame(mpg)
mpg_five <- mpg_copy %>% filter(displ > 5)
mpg_four <- mpg_copy %>% filter(displ <= 4)

mean(mpg_five$hwy) #18.14
mean(mpg_four$hwy) #25.96

#Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다.
#"audi"와 "toyota" 중 어느 manufacturer의 cty(도시연비)가 평균적으로 더 높은지 알아보세요
head(mpg_copy, 3)
mpg_audi <- mpg_copy %>% filter(manufacturer == "audi")
mpg_toyota <- mpg_copy %>% filter(manufacturer == "toyota")

mean(mpg_audi$cty) #17.81
mean(mpg_toyota$cty) #18.53

#Q3. 쉐보레, 포드, 혼다 자동차의 고속도로 연비 평균을 알아보려고 합니다.
#이 회사들의 데이터를 추출한 후 hwy 전체 평균을 구해보세요
#feat. %in% 써보기
mpg_fit <- mpg_copy %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_fit$hwy) #22.51

