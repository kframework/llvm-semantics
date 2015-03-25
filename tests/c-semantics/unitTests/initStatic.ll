; ModuleID = './initStatic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32 }
%struct.anon.0 = type { i32, i32 }
%union.anon.1 = type { i32 }

@y = global i32 5, align 4
@pair = global %struct.anon { i32 2, i32 3 }, align 4
@un2 = global { i8, [3 x i8] } { i8 120, [3 x i8] undef }, align 4
@x = common global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"x != 0\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"y != 5\0A\00", align 1
@pt = common global %struct.anon.0 zeroinitializer, align 4
@.str2 = private unnamed_addr constant [11 x i8] c"pt.x != 0\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"pt.y != 0\0A\00", align 1
@.str4 = private unnamed_addr constant [13 x i8] c"pair.x != 2\0A\00", align 1
@.str5 = private unnamed_addr constant [13 x i8] c"pair.y != 3\0A\00", align 1
@un = common global %union.anon.1 zeroinitializer, align 4
@.str6 = private unnamed_addr constant [11 x i8] c"un.x != 0\0A\00", align 1
@.str7 = private unnamed_addr constant [14 x i8] c"un2.x != 'x'\0A\00", align 1
@arr = common global [5 x i32] zeroinitializer, align 16
@.str8 = private unnamed_addr constant [13 x i8] c"arr[0] != 0\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32* @x, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = load i32* @y, align 4
  %8 = icmp ne i32 %7, 5
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %6
  %10 = call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %9, %6
  %12 = load i32* getelementptr inbounds (%struct.anon.0* @pt, i32 0, i32 0), align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %11
  %15 = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0))
  br label %16

; <label>:16                                      ; preds = %14, %11
  %17 = load i32* getelementptr inbounds (%struct.anon.0* @pt, i32 0, i32 1), align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19                                      ; preds = %16
  %20 = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0))
  br label %21

; <label>:21                                      ; preds = %19, %16
  %22 = load i32* getelementptr inbounds (%struct.anon* @pair, i32 0, i32 0), align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %21
  %25 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0))
  br label %26

; <label>:26                                      ; preds = %24, %21
  %27 = load i32* getelementptr inbounds (%struct.anon* @pair, i32 0, i32 1), align 4
  %28 = icmp ne i32 %27, 3
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %26
  %30 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str5, i32 0, i32 0))
  br label %31

; <label>:31                                      ; preds = %29, %26
  %32 = load i8* bitcast (%union.anon.1* @un to i8*), align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %31
  %36 = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0))
  br label %37

; <label>:37                                      ; preds = %35, %31
  %38 = load i8* getelementptr inbounds ({ i8, [3 x i8] }* @un2, i32 0, i32 0), align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 120
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %37
  %42 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str7, i32 0, i32 0))
  br label %43

; <label>:43                                      ; preds = %41, %37
  %44 = load i32* getelementptr inbounds ([5 x i32]* @arr, i32 0, i64 0), align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %43
  %47 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str8, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %46, %43
  ret i32 0
}

declare i32 @puts(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
