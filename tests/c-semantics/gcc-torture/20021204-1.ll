; ModuleID = './20021204-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1
@z = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** %a, align 8
  %4 = load i8** %a, align 8
  %5 = getelementptr inbounds i8* %4, i64 2
  store i8* %5, i8** %b, align 8
  %6 = load i32* @z, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = load i8** %b, align 8
  %10 = load i8** %a, align 8
  %11 = ptrtoint i8* %9 to i64
  %12 = ptrtoint i8* %10 to i64
  %13 = sub i64 %11, %12
  br label %21

; <label>:14                                      ; preds = %0
  %15 = load i8** %b, align 8
  %16 = load i8** %a, align 8
  %17 = ptrtoint i8* %15 to i64
  %18 = ptrtoint i8* %16 to i64
  %19 = sub i64 %17, %18
  %20 = sub nsw i64 %19, 1
  br label %21

; <label>:21                                      ; preds = %14, %8
  %22 = phi i64 [ %13, %8 ], [ %20, %14 ]
  %23 = trunc i64 %22 to i32
  call void @foo(i32 %23)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %25 = load i32* %1
  ret i32 %25
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
