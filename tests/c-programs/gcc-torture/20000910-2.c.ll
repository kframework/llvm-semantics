; ModuleID = './20000910-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@list = global [2 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @foo()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @foo() #0 {
  %i = alloca i32, align 4
  %fmt = alloca i8*, align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32, i32* %i, align 4
  %3 = sext i32 %2 to i64
  %4 = icmp ult i64 %3, 2
  br i1 %4, label %5, label %22

; <label>:5                                       ; preds = %1
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i8*], [2 x i8*]* @list, i32 0, i64 %7
  %9 = load i8*, i8** %8, align 8
  store i8* %9, i8** %fmt, align 8
  %10 = load i8*, i8** %fmt, align 8
  %11 = call i32 @bar(i8* %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %5
  br label %19

; <label>:14                                      ; preds = %5
  %15 = load i32, i32* %i, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  call void @abort() #3
  unreachable

; <label>:18                                      ; preds = %14
  call void @exit(i32 0) #3
  unreachable

; <label>:19                                      ; preds = %13
  %20 = load i32, i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %1

; <label>:22                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @bar(i8* %fmt) #0 {
  %1 = alloca i8*, align 8
  store i8* %fmt, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i8* @strchr(i8* %2, i32 42) #4
  %4 = icmp ne i8* %3, null
  %5 = zext i1 %4 to i32
  ret i32 %5
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
