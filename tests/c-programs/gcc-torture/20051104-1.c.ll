; ModuleID = './20051104-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i8* }

@s = common global %struct.anon zeroinitializer, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 8
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %3 = sext i32 %2 to i64
  %4 = load i8*, i8** getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 %3
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0), align 4
  %11 = sext i32 %10 to i64
  %12 = load i8*, i8** getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1), align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 %11
  store i8 0, i8* %13, align 1
  br label %14

; <label>:14                                      ; preds = %9, %0
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
