# 순서대로 정렬하기
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam %>% arrange(math) # 오름차순 정렬
exam %>% arrange(desc(math)) # 내림차순 정렬

# class 먼저 정렬, 그 다음 math 정렬
exam %>% arrange(class, math)


# 파생변수 추가하기
exam %>%
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science) / 3) %>% 
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "Pass", "Fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head


# 집단 별로 요약하기
# summarise() : dplyr 패키지에서 제공, 데이터의 요약 통계를 계산할 때 사용한다.
exam %>% summarise(mean_math = mean(math))

# summarise()는 group_by() 함수와 함께 사용되어 그룹별로 데이터를 요약한다.
exam %>%
  group_by(class) %>% 
  summarise(mean_math = mean(math))

# n : 학생 수
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math), 
            sum_math = sum(math),
            median_math = median(math),
            n = n())


# 데이터 합치기

# 가로로 합치기
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
test1

test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test2
     
               
total <- left_join(test1, test2, by = "id")
total

# 세로로 합치기
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_a

group_b <-  data.frame(id = c(1, 2, 3, 4, 5),
                       test = c(70, 83, 65, 95, 80))
group_b

group_all <- bind_rows(group_a , group_b)
group_all

