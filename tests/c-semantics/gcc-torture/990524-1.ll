; ModuleID = './990524-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global [6 x i8] c"12345\00", align 1
@b = global [6 x i8] c"12345\00", align 1

; Function Attrs: nounwind uwtable
define void @loop(i8* %pz, i8* %pzDta) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %pz, i8** %1, align 8
  store i8* %pzDta, i8** %2, align 8
  br label %3

; <label>:3                                       ; preds = %19, %0
  %4 = load i8** %2, align 8
  %5 = getelementptr inbounds i8* %4, i32 1
  store i8* %5, i8** %2, align 8
  %6 = load i8* %4, align 1
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i32 1
  store i8* %8, i8** %1, align 8
  store i8 %6, i8* %7, align 1
  %9 = sext i8 %6 to i32
  switch i32 %9, label %19 [
    i32 0, label %10
    i32 34, label %11
    i32 92, label %11
  ]

; <label>:10                                      ; preds = %3
  br label %20

; <label>:11                                      ; preds = %3, %3
  %12 = load i8** %1, align 8
  %13 = getelementptr inbounds i8* %12, i64 -1
  store i8 92, i8* %13, align 1
  %14 = load i8** %2, align 8
  %15 = getelementptr inbounds i8* %14, i64 -1
  %16 = load i8* %15, align 1
  %17 = load i8** %1, align 8
  %18 = getelementptr inbounds i8* %17, i32 1
  store i8* %18, i8** %1, align 8
  store i8 %16, i8* %17, align 1
  br label %19

; <label>:19                                      ; preds = %11, %3
  br label %3

; <label>:20                                      ; preds = %10
  %21 = load i8** %1, align 8
  %22 = ptrtoint i8* %21 to i64
  %23 = sub i64 ptrtoint ([6 x i8]* @a to i64), %22
  %24 = load i8** %2, align 8
  %25 = ptrtoint i8* %24 to i64
  %26 = sub i64 ptrtoint ([6 x i8]* @b to i64), %25
  %27 = icmp ne i64 %23, %26
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %20
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %20
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @loop(i8* getelementptr inbounds ([6 x i8]* @a, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @b, i32 0, i32 0))
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
