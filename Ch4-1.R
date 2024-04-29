# 조건에 맞는 데이터만 추출하기
library(dplyr)

exam <- read.csv("csv_exam.csv")
exam

# %>% (파이프 연산자(pipe operator)) : dplyr 패키지 및 tidyverse 생태계에서 데이터 처리 작업을 위해 사용
# Command + Shift + M : %>% 자동 완성
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)

exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english <= 90 | science < 50)

exam %>% filter(class == 1 | class == 3 | class == 5)

class1 <- exam %>% filter(class == 1)
class1

class2 <- exam %>% filter(class == 2)
class2

mean(class1$math)
mean(class2$math)


# 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

# 수학을 제외한 나머지 column
exam %>% select(-math)
exam %>% select(-math, -english)

# class가 1인, 영어 점수 출력
exam %>% filter(class == 1) %>% select(english)
exam %>% 
  filter(class == 1) %>% 
  select(english)

