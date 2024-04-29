# 데이터 프레임 만들기
english <- c(90, 80, 60, 70)
english

math <- c(50, 60, 100, 20)
math

df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

# $ : DataFrame에 있는 field를 지정 
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(90, 80, 60, 70), 
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))

df_midterm


# 외부 데이터 이용하기
install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam

# DataFrame remove command
rm(data_exam)

mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

# field가 없을 때 기존 방식으로 파일을 불러오면 문제가 생김
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar


# sheet 파일 가져오기 
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet


# CSV 파일 가져오기
df_csv_exam <- read.csv("excel_exam.csv")
df_csv_exam

write.csv(df_csv_exam, file = "df_csv_write.csv")

