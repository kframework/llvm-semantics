; ModuleID = './20001130-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@which_alternative = internal global i32 3, align 4
@.str = private unnamed_addr constant [10 x i8] c"mov\09%1,%0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"ld\09%1,%0\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"st\09%1,%0\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"foo\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %1
  %2 = call i8* @output_25()
  store i8* %2, i8** %s, align 8
  %3 = load i8*, i8** %s, align 8
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 115
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define internal i8* @output_25() #0 {
  %1 = alloca i8*, align 8
  %2 = load i32, i32* @which_alternative, align 4
  switch i32 %2, label %8 [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %6
    i32 3, label %7
  ]

; <label>:3                                       ; preds = %0
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i8** %1
  br label %9

; <label>:4                                       ; preds = %0
  %5 = call i8* @i960_output_ldconst()
  store i8* %5, i8** %1
  br label %9

; <label>:6                                       ; preds = %0
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i8** %1
  br label %9

; <label>:7                                       ; preds = %0
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8** %1
  br label %9

; <label>:8                                       ; preds = %0
  store i8* null, i8** %1
  br label %9

; <label>:9                                       ; preds = %8, %7, %6, %4, %3
  %10 = load i8*, i8** %1
  ret i8* %10
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal i8* @i960_output_ldconst() #0 {
  ret i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0)
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
