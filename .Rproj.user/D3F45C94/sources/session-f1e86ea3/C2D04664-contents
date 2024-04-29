# 데이터 프레임 생성: 성별(sex)과 점수(score)를 변수로 가지며, 일부 데이터에는 결측치(NA)가 포함
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                         score = c(5, 4, 3, 4, NA))
df

# 결측지 확인하기
# 데이터 프레임 내 모든 요소에 대해 결측치 여부를 확인
is.na(df)

# 데이터 프레임 내 각 요소의 결측치 여부를 요약하여 표로 나타낸다.
table(is.na(df))

# 'sex' 열에 대한 결측치 수를 표로 나타낸다.
table(is.na(df$sex))

# 'score' 열에 대한 결측치 수를 표로 나타낸다.
table(is.na(df$score))

# 'sex' 열의 평균을 구하려 하지만, 문자형 데이터이므로 계산되지 않는다.
mean(df$sex)

# 'score' 열의 평균을 계산합니다. NA가 있으므로 결과는 NA
mean(df$score)


library(dplyr)

# 결측치 제거하기
# 'score'에서 결측치인 데이터만 필터링
df %>% filter(is.na(score))

# 'score'에서 결측치가 아닌 데이터만 필터링
df %>% filter(!is.na(score))

# 'score'의 결측치를 제외하고 새로운 데이터 프레임을 생성
df_nomiss <- df %>% filter(!is.na(score))

# 결측치가 제거된 데이터의 'score' 평균 및 합을 계산
mean(df_nomiss$score)
sum(df_nomiss$score)

# 여러 변수 동시에 결측치 없는 데이터 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df)
df_nomiss2

# 함수의 결측치 제외 기능 이용하기
# 함수를 사용하여 결측치 제외 옵션(na.rm = TRUE)으로 'score'의 평균과 합을 다시 계산
mean(df$score)
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)


# csv 파일에서 데이터를 불러온 후, 특정 행의 'math' 점수에 결측치를 할당
exam <- read.csv("csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
exam

# 'math' 점수의 평균을 계산할 때 결측치를 제외하거나 포함하여 계산
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

# 결측치 대체하기
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

# 이상치 제거하기
# 이상치를 확인하고 처리하는 과정'sex'가 3인 이상치를 NA로 대체하고, 'score'가 5를 초과하는 이상치를 NA로 대체
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)# 데이터 프레임 생성: 성별(sex)과 점수(score)를 변수로 가지며, 일부 데이터에는 결측치(NA)가 포함
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                         score = c(5, 4, 3, 4, NA))
df

# 결측지 확인하기
# 데이터 프레임 내 모든 요소에 대해 결측치 여부를 확인
is.na(df)

# 데이터 프레임 내 각 요소의 결측치 여부를 요약하여 표로 나타낸다.
table(is.na(df))

# 'sex' 열에 대한 결측치 수를 표로 나타낸다.
table(is.na(df$sex))

# 'score' 열에 대한 결측치 수를 표로 나타낸다.
table(is.na(df$score))

# 'sex' 열의 평균을 구하려 하지만, 문자형 데이터이므로 계산되지 않는다.
mean(df$sex)

# 'score' 열의 평균을 계산합니다. NA가 있으므로 결과는 NA
mean(df$score)


library(dplyr)

# 결측치 제거하기
# 'score'에서 결측치인 데이터만 필터링
df %>% filter(is.na(score))

# 'score'에서 결측치가 아닌 데이터만 필터링
df %>% filter(!is.na(score))

# 'score'의 결측치를 제외하고 새로운 데이터 프레임을 생성
df_nomiss <- df %>% filter(!is.na(score))

# 결측치가 제거된 데이터의 'score' 평균 및 합을 계산
mean(df_nomiss$score)
sum(df_nomiss$score)

# 여러 변수 동시에 결측치 없는 데이터 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df)
df_nomiss2

# 함수의 결측치 제외 기능 이용하기
# 함수를 사용하여 결측치 제외 옵션(na.rm = TRUE)으로 'score'의 평균과 합을 다시 계산
mean(df$score)
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)


# csv 파일에서 데이터를 불러온 후, 특정 행의 'math' 점수에 결측치를 할당
exam <- read.csv("csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
exam

# 'math' 점수의 평균을 계산할 때 결측치를 제외하거나 포함하여 계산
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

# 결측치 대체하기
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

# 이상치 제거하기
# 이상치를 확인하고 처리하는 과정'sex'가 3인 이상치를 NA로 대체하고, 'score'가 5를 초과하는 이상치를 NA로 대체
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$sex
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier$score
outlier

# 이상치를 제거한 데이터에서 'sex'별로 그룹화하여 'score'의 평균을 계산
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))


table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$sex
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier$score
outlier

# 이상치를 제거한 데이터에서 'sex'별로 그룹화하여 'score'의 평균을 계산
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

