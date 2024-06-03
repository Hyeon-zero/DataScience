# 캐글 영화 평점 데이터 분석

# 데이터 불러오기
df <- read.csv("movie_metadata.csv", header = T, stringsAsFactors = F)

# 데이터의 처음 5개 열 확인
head(df[ , 1 : 5])

# 감독별 영화 개수 세기
head(sort(table(df$director_name), decreasing = T), 10)

library(dplyr)

# 감독별 영화 개수를 세고, 이름이 없는 감독은 제외하고 내림차순으로 정렬
df %>% 
  count(director_name) %>% 
  filter(director_name != "") %>% 
  arrange(desc(n))

# 가장 높은 수익을 올린 10개의 영화 데이터 추출
max_groos <- head(df[order(-df$gross), ], 10)
max_groos[ , c("director_name", "movie_title", "actor_1_name", "gross", "imdb_score")]

# sqldf 패키지 설치 및 로드
install.packages("sqldf")
library(sqldf)

# SQL 문법을 사용하여 데이터 프레임 생성
# select : 조회할 변수 선택
# from : 데이터셋 선택
# group by : 그룹화할 변수 선택
# order by : 정렬할 변수와 기준 설정

df_grp <- sqldf("SELECT director_name, movie_title, actor_1_name, gross, imdb_score
                FROM df
                GROUP BY director_name, movie_title, actor_1_name, gross, imdb_score
                ORDER BY gross DESC")

head(df_grp, 10)

max_score <- df[order(-df$imdb_score), ]
head(max_score[ , c("director_name", "movie_title", "actor_1_name", "gross", "imdb_score"), 10])

summary(df$imdb_score)

hist(df$imdb_score, main = "score hist", xlab = "score")

library(ggplot2)

# 히스토그램 생성
g1 <- ggplot(df, aes(x = df$imdb_score))
g1 + geom_histogram(breaks = seq(0, 10, by = 0.5), fill = "white", colour = "black")

# 히스토그램을 빈도에 따라 색상을 다르게 설정하여 생성
g1 + geom_histogram(breaks = seq(0, 10, by = 0.5), aes(fill = ..count..), colour = "black")

