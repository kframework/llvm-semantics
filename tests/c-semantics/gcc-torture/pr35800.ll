; ModuleID = './pr35800.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"char\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"short\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"long\00", align 1
@.str4 = private unnamed_addr constant [14 x i8] c"unsigned char\00", align 1
@.str5 = private unnamed_addr constant [12 x i8] c"signed char\00", align 1
@.str6 = private unnamed_addr constant [15 x i8] c"unsigned short\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"unsigned int\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"unsigned\00", align 1
@.str9 = private unnamed_addr constant [14 x i8] c"unsigned long\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@.str11 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str12 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@.str13 = private unnamed_addr constant [12 x i8] c"long double\00", align 1
@.str14 = private unnamed_addr constant [8 x i8] c"integer\00", align 1
@.str15 = private unnamed_addr constant [8 x i8] c"boolean\00", align 1
@.str16 = private unnamed_addr constant [11 x i8] c"short real\00", align 1
@.str17 = private unnamed_addr constant [5 x i8] c"real\00", align 1
@.str18 = private unnamed_addr constant [10 x i8] c"stringptr\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"character\00", align 1
@.str20 = private unnamed_addr constant [10 x i8] c"logical*1\00", align 1
@.str21 = private unnamed_addr constant [10 x i8] c"logical*2\00", align 1
@.str22 = private unnamed_addr constant [10 x i8] c"logical*4\00", align 1
@.str23 = private unnamed_addr constant [8 x i8] c"logical\00", align 1
@.str24 = private unnamed_addr constant [8 x i8] c"complex\00", align 1
@.str25 = private unnamed_addr constant [15 x i8] c"double complex\00", align 1
@.str26 = private unnamed_addr constant [10 x i8] c"integer*1\00", align 1
@.str27 = private unnamed_addr constant [10 x i8] c"integer*2\00", align 1
@.str28 = private unnamed_addr constant [10 x i8] c"integer*4\00", align 1
@.str29 = private unnamed_addr constant [6 x i8] c"wchar\00", align 1
@.str30 = private unnamed_addr constant [10 x i8] c"long long\00", align 1
@.str31 = private unnamed_addr constant [19 x i8] c"unsigned long long\00", align 1
@.str32 = private unnamed_addr constant [10 x i8] c"logical*8\00", align 1
@.str33 = private unnamed_addr constant [10 x i8] c"integer*8\00", align 1

; Function Attrs: nounwind uwtable
define i32 @stab_xcoff_builtin_type(i32 %typenum) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %name = alloca i8*, align 8
  store i32 %typenum, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = icmp slt i32 %6, -34
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  store i32 0, i32* %1
  br label %51

; <label>:9                                       ; preds = %5
  %10 = load i32* %2, align 4
  %11 = sub nsw i32 0, %10
  switch i32 %11, label %46 [
    i32 1, label %12
    i32 2, label %13
    i32 3, label %14
    i32 4, label %15
    i32 5, label %16
    i32 6, label %17
    i32 7, label %18
    i32 8, label %19
    i32 9, label %20
    i32 10, label %21
    i32 11, label %22
    i32 12, label %23
    i32 13, label %24
    i32 14, label %25
    i32 15, label %26
    i32 16, label %27
    i32 17, label %28
    i32 18, label %29
    i32 19, label %30
    i32 20, label %31
    i32 21, label %32
    i32 22, label %33
    i32 23, label %34
    i32 24, label %35
    i32 25, label %36
    i32 26, label %37
    i32 27, label %38
    i32 28, label %39
    i32 29, label %40
    i32 30, label %41
    i32 31, label %42
    i32 32, label %43
    i32 33, label %44
    i32 34, label %45
  ]

; <label>:12                                      ; preds = %9
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %name, align 8
  br label %46

; <label>:13                                      ; preds = %9
  store i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i8** %name, align 8
  br label %14

; <label>:14                                      ; preds = %9, %13
  store i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i8** %name, align 8
  br label %46

; <label>:15                                      ; preds = %9
  store i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i8** %name, align 8
  br label %16

; <label>:16                                      ; preds = %9, %15
  store i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0), i8** %name, align 8
  br label %17

; <label>:17                                      ; preds = %9, %16
  store i8* getelementptr inbounds ([12 x i8]* @.str5, i32 0, i32 0), i8** %name, align 8
  br label %18

; <label>:18                                      ; preds = %9, %17
  store i8* getelementptr inbounds ([15 x i8]* @.str6, i32 0, i32 0), i8** %name, align 8
  br label %19

; <label>:19                                      ; preds = %9, %18
  store i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), i8** %name, align 8
  br label %20

; <label>:20                                      ; preds = %9, %19
  store i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0), i8** %name, align 8
  br label %21

; <label>:21                                      ; preds = %9, %20
  store i8* getelementptr inbounds ([14 x i8]* @.str9, i32 0, i32 0), i8** %name, align 8
  br label %22

; <label>:22                                      ; preds = %9, %21
  store i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0), i8** %name, align 8
  br label %23

; <label>:23                                      ; preds = %9, %22
  store i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0), i8** %name, align 8
  br label %24

; <label>:24                                      ; preds = %9, %23
  store i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0), i8** %name, align 8
  br label %25

; <label>:25                                      ; preds = %9, %24
  store i8* getelementptr inbounds ([12 x i8]* @.str13, i32 0, i32 0), i8** %name, align 8
  br label %26

; <label>:26                                      ; preds = %9, %25
  store i8* getelementptr inbounds ([8 x i8]* @.str14, i32 0, i32 0), i8** %name, align 8
  br label %27

; <label>:27                                      ; preds = %9, %26
  store i8* getelementptr inbounds ([8 x i8]* @.str15, i32 0, i32 0), i8** %name, align 8
  br label %28

; <label>:28                                      ; preds = %9, %27
  store i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0), i8** %name, align 8
  br label %29

; <label>:29                                      ; preds = %9, %28
  store i8* getelementptr inbounds ([5 x i8]* @.str17, i32 0, i32 0), i8** %name, align 8
  br label %30

; <label>:30                                      ; preds = %9, %29
  store i8* getelementptr inbounds ([10 x i8]* @.str18, i32 0, i32 0), i8** %name, align 8
  br label %31

; <label>:31                                      ; preds = %9, %30
  store i8* getelementptr inbounds ([10 x i8]* @.str19, i32 0, i32 0), i8** %name, align 8
  br label %32

; <label>:32                                      ; preds = %9, %31
  store i8* getelementptr inbounds ([10 x i8]* @.str20, i32 0, i32 0), i8** %name, align 8
  br label %33

; <label>:33                                      ; preds = %9, %32
  store i8* getelementptr inbounds ([10 x i8]* @.str21, i32 0, i32 0), i8** %name, align 8
  br label %34

; <label>:34                                      ; preds = %9, %33
  store i8* getelementptr inbounds ([10 x i8]* @.str22, i32 0, i32 0), i8** %name, align 8
  br label %35

; <label>:35                                      ; preds = %9, %34
  store i8* getelementptr inbounds ([8 x i8]* @.str23, i32 0, i32 0), i8** %name, align 8
  br label %36

; <label>:36                                      ; preds = %9, %35
  store i8* getelementptr inbounds ([8 x i8]* @.str24, i32 0, i32 0), i8** %name, align 8
  br label %37

; <label>:37                                      ; preds = %9, %36
  store i8* getelementptr inbounds ([15 x i8]* @.str25, i32 0, i32 0), i8** %name, align 8
  br label %38

; <label>:38                                      ; preds = %9, %37
  store i8* getelementptr inbounds ([10 x i8]* @.str26, i32 0, i32 0), i8** %name, align 8
  br label %39

; <label>:39                                      ; preds = %9, %38
  store i8* getelementptr inbounds ([10 x i8]* @.str27, i32 0, i32 0), i8** %name, align 8
  br label %40

; <label>:40                                      ; preds = %9, %39
  store i8* getelementptr inbounds ([10 x i8]* @.str28, i32 0, i32 0), i8** %name, align 8
  br label %41

; <label>:41                                      ; preds = %9, %40
  store i8* getelementptr inbounds ([6 x i8]* @.str29, i32 0, i32 0), i8** %name, align 8
  br label %42

; <label>:42                                      ; preds = %9, %41
  store i8* getelementptr inbounds ([10 x i8]* @.str30, i32 0, i32 0), i8** %name, align 8
  br label %43

; <label>:43                                      ; preds = %9, %42
  store i8* getelementptr inbounds ([19 x i8]* @.str31, i32 0, i32 0), i8** %name, align 8
  br label %44

; <label>:44                                      ; preds = %9, %43
  store i8* getelementptr inbounds ([10 x i8]* @.str32, i32 0, i32 0), i8** %name, align 8
  br label %45

; <label>:45                                      ; preds = %9, %44
  store i8* getelementptr inbounds ([10 x i8]* @.str33, i32 0, i32 0), i8** %name, align 8
  br label %46

; <label>:46                                      ; preds = %45, %9, %14, %12
  %47 = load i8** %name, align 8
  %48 = getelementptr inbounds i8* %47, i64 0
  %49 = load i8* %48, align 1
  %50 = sext i8 %49 to i32
  store i32 %50, i32* %1
  br label %51

; <label>:51                                      ; preds = %46, %8
  %52 = load i32* %1
  ret i32 %52
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @stab_xcoff_builtin_type(i32 0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @stab_xcoff_builtin_type(i32 -1)
  %7 = icmp ne i32 %6, 105
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @stab_xcoff_builtin_type(i32 -2)
  %11 = icmp ne i32 %10, 115
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @stab_xcoff_builtin_type(i32 -3)
  %15 = icmp ne i32 %14, 115
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  store i32 -4, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %27, %17
  %19 = load i32* %i, align 4
  %20 = icmp sge i32 %19, -34
  br i1 %20, label %21, label %30

; <label>:21                                      ; preds = %18
  %22 = load i32* %i, align 4
  %23 = call i32 @stab_xcoff_builtin_type(i32 %22)
  %24 = icmp ne i32 %23, 105
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %21
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, i32* %i, align 4
  br label %18

; <label>:30                                      ; preds = %18
  %31 = call i32 @stab_xcoff_builtin_type(i32 -35)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %30
  call void @abort() #2
  unreachable

; <label>:34                                      ; preds = %30
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
