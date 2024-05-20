# 분석 파일을 R로 불러오기
library(dplyr)
library(ggplot2)
library(foreign)

mental <- read.spss("한국행정연구원_사회통합실태조사_데이터_2020.sav", reencode = "UTF-8")
class(mental)

mental <- as.data.frame(mental)
class(mental)

# 분석 변수 추출하고 이름 변경
# q32_2 : suicide, 4점 척도
# q1_4 : satisfaction, 11점 척도
# q32_1 : loneliness, 4점 척도
# q34_1 : family_belief, 4점 척도
# q52 : wealth, 10점 척도
# d17 : health, 5점 척도
# d1 : sex
# d2 : age
# ara : area

mental <- mental %>% 
  select(q32_2, q1_4, q32_1, q34_1, q52, d17, d1, d2, ara) %>% 
  rename(suicide = q32_2,
         satisfaction = q1_4,
         loneliness = q32_1,
         family_belief = q34_1,
         wealth = q52,
         health = d17,
         sex = d1,
         age = d2,
         area = ara)

# 변수 유형 변경과 정리
str(mental)
table(mental$suicide)
table(mental$health)
table(mental$satisfaction)

mental$suicide <- as.integer(mental$suicide)
mental$satisfaction <- as.integer(mental$satisfaction)
mental$loneliness <- as.integer(mental$loneliness)
mental$family_belief <- as.integer(mental$family_belief)
mental$wealth <- as.integer(mental$wealth)
mental$health <- as.integer(mental$health)

table(mental$suicide)
table(mental$health)
table(mental$satisfaction)


mental$satisfaction <- mental$satisfaction - 1
mental$wealth <- mental$wealth - 1

table(mental$satisfaction)
table(mental$wealth)

mental$sex <- as.character(mental$sex)
mental$age <- as.character(mental$age)
mental$area <- as.character(mental$area)

table(mental$sex)
table(mental$age)
table(mental$area)

mental$age <- ifelse(mental$age == "19~29세", "20대",
                     ifelse(mental$age == "60세 이상", "60대", mental$age))

table(mental$age)


# 결측치, 이상치 확인하기
summary(mental)

# 데이터 분석
# 빈도 분석
mental %>% 
  group_by(sex) %>% 
  summarise(n = n()) %>% 
  mutate(total = sum(n),
         pct = round(n / total * 100, 1)) 
  
mental %>% 
  group_by(age) %>% 
  summarise(n = n()) %>% 
  mutate(total = sum(n),
         pct = round(n / total * 100, 1))

# 교차 분석
table(mental$sex, mental$age)
prop.table(table(mental$sex, mental$age), 1)
round(prop.table(table(mental$sex, mental$age), 1) * 100, 1)


# 귀무가설 : 성별과 연령 간에는 연관이 없다.
# 대립가설 : 성별과 연령 간에는 연관이 있다.

chisq.test(mental$sex, mental$age)

# 평균 비교
mental %>% 
  summarise(m1 = mean(suicide), m2 = mean(satisfaction), m3 = mean(loneliness), 
            m4 = mean(family_belief), m5 = mean(wealth), m6 = mean(health))

# 상관 관계 (삶의 만족도와 외로움)
cor.test(mental$satisfaction, mental$loneliness)


# 성별에 따른 삶의 만족도 차이
# 귀무가설 : 성별에 따라 삶의 만족도의 차이는 없다.
# 대립가설 : 성별에 따라 삶의 만족도의 차이는 있다.

t.test(data = mental, satisfaction ~ sex)


# 연령에 따른 삶의 만족도 차이
# 귀무가설 : 연령에 따라 삶의 만족도의 차이는 없다.
# 대립가설 : 연령에 따라 삶의 만족도의 차이는 있다.

mental_age <- aov(satisfaction ~ age, data = mental)
mental_age
summary(mental_age)
model.tables(mental_age, type = "mean")
TukeyHSD(mental_age)


# 지역별 삶의 만족도 분석과 그래프 그리기
area_satisfaction <- mental %>% 
  group_by(area) %>% 
  summarise(m = mean(satisfaction)) %>% 
  arrange(desc(m)) 

ggplot(data = area_satisfaction, aes(x = reorder(area, m), y = m)) + 
  geom_col() + 
  xlab("지역") + 
  ylab("만족도") + 
  coord_flip()

