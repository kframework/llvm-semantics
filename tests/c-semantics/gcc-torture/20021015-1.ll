; ModuleID = './20021015-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g_list = global [1 x i8] c"1", align 1

; Function Attrs: nounwind uwtable
define void @g(i8* %p, i8* %list, i32 %length, i8** %elementPtr, i8** %nextPtr) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8**, align 8
  store i8* %p, i8** %1, align 8
  store i8* %list, i8** %2, align 8
  store i32 %length, i32* %3, align 4
  store i8** %elementPtr, i8*** %4, align 8
  store i8** %nextPtr, i8*** %5, align 8
  %6 = load i8*** %5, align 8
  %7 = load i8** %6, align 8
  %8 = icmp ne i8* %7, getelementptr inbounds ([1 x i8]* @g_list, i32 0, i32 0)
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load i8*** %5, align 8
  %12 = load i8** %11, align 8
  store i8 0, i8* %12, align 1
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %list = alloca i8*, align 8
  %element = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %prevList = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([1 x i8]* @g_list, i32 0, i32 0), i8** %list, align 8
  store i32 100, i32* %length, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i8** %list, align 8
  %4 = load i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %23

; <label>:7                                       ; preds = %2
  %8 = load i8** %list, align 8
  store i8* %8, i8** %prevList, align 8
  %9 = load i8** %list, align 8
  %10 = load i32* %length, align 4
  call void @g(i8* null, i8* %9, i32 %10, i8** %element, i8** %list)
  %11 = load i8** %list, align 8
  %12 = load i8** %prevList, align 8
  %13 = ptrtoint i8* %11 to i64
  %14 = ptrtoint i8* %12 to i64
  %15 = sub i64 %13, %14
  %16 = load i32* %length, align 4
  %17 = sext i32 %16 to i64
  %18 = sub nsw i64 %17, %15
  %19 = trunc i64 %18 to i32
  store i32 %19, i32* %length, align 4
  br label %20

; <label>:20                                      ; preds = %7
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %2

; <label>:23                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
