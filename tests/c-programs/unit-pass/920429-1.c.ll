; ModuleID = './920429-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@i = common global i32 0, align 4
@j = common global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"ab\00", align 1

; Function Attrs: nounwind uwtable
define i8* @f(i8* %p) #0 {
  %1 = alloca i8*, align 8
  %c = alloca i8, align 1
  store i8* %p, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %3, i8** %1, align 8
  %4 = load i8, i8* %2, align 1
  store i8 %4, i8* %c, align 1
  %5 = load i8, i8* %c, align 1
  %6 = sext i8 %5 to i32
  %7 = and i32 %6, 2
  %8 = icmp ne i32 %7, 0
  %9 = select i1 %8, i32 1, i32 0
  store i32 %9, i32* @i, align 4
  %10 = load i8, i8* %c, align 1
  %11 = sext i8 %10 to i32
  %12 = and i32 %11, 7
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @j, align 4
  %14 = load i8*, i8** %1, align 8
  ret i8* %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p0 = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8** %p0, align 8
  %2 = load i8*, i8** %p0, align 8
  %3 = call i8* @f(i8* %2)
  store i8* %3, i8** %p1, align 8
  %4 = load i8*, i8** %p0, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 1
  %6 = load i8*, i8** %p1, align 8
  %7 = icmp ne i8* %5, %6
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

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
