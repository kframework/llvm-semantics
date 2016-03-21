; ModuleID = './20011109-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"foo\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c1 = alloca i8*, align 8
  %c2 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8** %c1, align 8
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8** %c2, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %21, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load i8*, i8** %c1, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 %7
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32, i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = load i8*, i8** %c2, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 %13
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %11, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %5
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %5
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32, i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %2

; <label>:24                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %26 = load i32, i32* %1
  ret i32 %26
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
