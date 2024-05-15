# 한국인의 삶 분석

library(dplyr)
library(ggplot2)
library(foreign)

# 데이터 파일 불러오기
koweps <- read.spss("Koweps_hpda15_2020_beta1.1.sav")
koweps <- as.data.frame(koweps)

# 데이터 구조 확인
str(koweps)

# 필요한 변수 추출 및 이름 변경
# h15_g3(성별), h15_g4(출생 연도), h15_g6(교육 수준)
# h15_reg5(지역), h15_eco9(직종)
# h15_inc2(상용 근로자 급여), h15_inc3(임시 일용 근로자 급여)

welfare <- koweps %>% 
  select(h15_g3, h15_g4, h15_g6, h15_reg5, h15_eco9, h15_inc2, h15_inc3)

# 변수 이름 변경
welfare <- welfare %>% 
  rename(sex = h15_g3, 
         birth = h15_g4,
         edu = h15_g6,
         region = h15_reg5,
         job_code = h15_eco9,
         p_salary = h15_inc2,
         t_salary = h15_inc3)

# 변수 유형 확인
str(welfare)

# 결측치 및 이상치 확인
summary(welfare)

# 급여가 0인 경우 NA로 처리
welfare$p_salary <- ifelse(welfare$p_salary == 0, NA, welfare$p_salary)
welfare$t_salary <- ifelse(welfare$t_salary == 0, NA, welfare$t_salary)

# 결측치 개수 확인
table(is.na(welfare$p_salary))
table(is.na(welfare$t_salary))

# 성별 변수 처리
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")

# 출생 연도 변수로 나이 계산
welfare$age <- 2020 - welfare$birth + 1
range(welfare$age)

# 교육 수준 변수 처리
welfare$edu_grade <- ifelse(welfare$edu %in% c(1, 2, 3, 4), "중학 이하",
                            ifelse(welfare$edu == 5, "고교",
                                   ifelse(welfare$edu == 6, "전문대학", "대학 이상")))

# 교육 수준 변수 확인
table(welfare$edu_grade)

# 권역 변수 처리
region_name <- data.frame(region = c(1, 2, 3, 4, 5),
                          region1 = c("서울", "광역시", "시", "구", "도농복합군"))

# 권역 정보 병합
welfare <- left_join(welfare, region_name, by = "region")

# 직종 변수 처리
library(readxl)
job_name <- read_excel("(2020년 15차 한국복지패널조사) 조사설계서-가구용(beta1).xlsx", sheet =  5)

# 직종 변수 구조 확인
str(job_name)

# 직종 정보 병합
welfare <- left_join(welfare, job_name, by = "job_code")
str(welfare)

# 상용직과 임시 일용직의 평균 총급여 비교
mean(welfare$p_salary, na.rm = TRUE)
mean(welfare$t_salary, na.rm = TRUE)

# 상용직의 성별에 따른 평균 총급여 차이 검정
# 귀무가설: 성별의 평균 총급여는 차이가 없다.
# 대립가설: 성별의 평균 총급여는 차이가 있다.
t.test(data = welfare, p_salary ~ sex)

# 연령별 평균 총급여 계산
age_salary1 <- welfare %>% 
  filter(!is.na(p_salary)) %>% 
  group_by(age) %>% 
  summarise(m = mean(p_salary))

# 연령별 평균 총급여 상위 3개 연령대 확인
age_salary1 %>% 
  arrange(desc(m)) %>% 
  head(3)

# 연령별 평균 총급여 그래프
ggplot(data = age_salary1, aes(x = age, y = m)) + 
  geom_line() + 
  xlab("연령") + 
  ylab("총급여")

# 연령별 남녀 평균 총급여 그래프
age_salary2 <- welfare %>% 
  filter(!is.na(p_salary)) %>% 
  group_by(age, sex) %>% 
  summarise(m = mean(p_salary))

ggplot(data = age_salary2, aes(x = age, y = m, col = sex)) +
  geom_line() +
  xlab("연령") +
  ylab("총급여")

# 교육 수준별 상용직 평균 총급여 비교
edu_salary1 <- welfare %>% 
  filter(!is.na(p_salary)) %>% 
  group_by(edu_grade) %>% 
  summarise(m = mean(p_salary))

edu_salary1 %>% 
  arrange(desc(m))

# 교육 수준별 상용직 평균 총급여 그래프
ggplot(data = edu_salary1, aes(x = reorder(edu_grade, m), y = m)) +
  geom_col() +
  xlab("교육 수준") +
  ylab("평균 총급여")

# 교육 수준과 성별에 따른 상용직 근로자의 총급여 분석
edu_salary2 <- welfare %>% 
  filter(!is.na(p_salary)) %>% 
  group_by(edu_grade, sex) %>% 
  summarise(m = mean(p_salary))

edu_salary2 %>% 
  arrange(desc(m))

# 교육 수준과 성별에 따른 상용직 근로자의 총급여 그래프
ggplot(data = edu_salary2, aes(x = edu_grade, y = m, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("중학 이하", "고교", "전문대학", "대학 이상")) +
  xlab("교육 수준") +
  ylab("평균 총급여")

