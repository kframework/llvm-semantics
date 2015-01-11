; ModuleID = './test16.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.zz = type { i32, i32 }

@x = common global %struct.zz zeroinitializer, align 4
@.str = private unnamed_addr constant [39 x i8] c"hello world - x.a is %d and x.b is %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 2, i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 1), align 4
  store i32 2, i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 0), align 4
  %4 = load i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 0), align 4
  %8 = load i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 1), align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 1), align 4
  br label %10

; <label>:10                                      ; preds = %6, %0
  %11 = load i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 0), align 4
  %12 = load i32* getelementptr inbounds (%struct.zz* @x, i32 0, i32 1), align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %12)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
