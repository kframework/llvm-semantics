; ModuleID = './20000818-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@temporary_obstack = common global i8* null, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %ch = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @yylex()
  store i32 %2, i32* %ch, align 4
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %4 = load i32* %1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @yylex() #0 {
  %ch = alloca i32, align 4
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = call i32 @input()
  store i32 %2, i32* %ch, align 4
  %3 = load i32* %ch, align 4
  %4 = call i32 @ISALNUM(i32 %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %1
  %7 = load i32* %ch, align 4
  call void @obstack_1grow(i8** @temporary_obstack, i32 %7)
  br label %13

; <label>:8                                       ; preds = %1
  %9 = load i32* %ch, align 4
  %10 = icmp ne i32 %9, 95
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  br label %14

; <label>:12                                      ; preds = %8
  br label %13

; <label>:13                                      ; preds = %12, %6
  br label %1

; <label>:14                                      ; preds = %11
  %15 = load i32* %ch, align 4
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @input() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @ISALNUM(i32 %ch) #0 {
  %1 = alloca i32, align 4
  store i32 %ch, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 65
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = icmp sle i32 %5, 90
  br i1 %6, label %21, label %7

; <label>:7                                       ; preds = %4, %0
  %8 = load i32* %1, align 4
  %9 = icmp sge i32 %8, 97
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %7
  %11 = load i32* %1, align 4
  %12 = icmp sle i32 %11, 122
  br i1 %12, label %21, label %13

; <label>:13                                      ; preds = %10, %7
  %14 = load i32* %1, align 4
  %15 = icmp sge i32 %14, 48
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %13
  %17 = load i32* %1, align 4
  %18 = icmp sle i32 %17, 48
  br label %19

; <label>:19                                      ; preds = %16, %13
  %20 = phi i1 [ false, %13 ], [ %18, %16 ]
  br label %21

; <label>:21                                      ; preds = %19, %10, %4
  %22 = phi i1 [ true, %10 ], [ true, %4 ], [ %20, %19 ]
  %23 = zext i1 %22 to i32
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define internal void @obstack_1grow(i8** %ptr, i32 %ch) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32, align 4
  store i8** %ptr, i8*** %1, align 8
  store i32 %ch, i32* %2, align 4
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
