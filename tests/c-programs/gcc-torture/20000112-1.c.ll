; ModuleID = './20000112-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"ee\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"*e\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @special_format(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @special_format(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define internal i32 @special_format(i8* %fmt) #0 {
  %1 = alloca i8*, align 8
  store i8* %fmt, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i8* @strchr(i8* %2, i32 42) #4
  %4 = icmp ne i8* %3, null
  br i1 %4, label %17, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** %1, align 8
  %7 = call i8* @strchr(i8* %6, i32 86) #4
  %8 = icmp ne i8* %7, null
  br i1 %8, label %17, label %9

; <label>:9                                       ; preds = %5
  %10 = load i8*, i8** %1, align 8
  %11 = call i8* @strchr(i8* %10, i32 83) #4
  %12 = icmp ne i8* %11, null
  br i1 %12, label %17, label %13

; <label>:13                                      ; preds = %9
  %14 = load i8*, i8** %1, align 8
  %15 = call i8* @strchr(i8* %14, i32 110) #4
  %16 = icmp ne i8* %15, null
  br label %17

; <label>:17                                      ; preds = %13, %9, %5, %0
  %18 = phi i1 [ true, %9 ], [ true, %5 ], [ true, %0 ], [ %16, %13 ]
  %19 = zext i1 %18 to i32
  ret i32 %19
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
