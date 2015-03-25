; ModuleID = './c1x0607020119.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.v = type { %union.anon, i32 }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { i64, i64 }
%struct.anon = type { i32, i32 }

@v1 = common global %struct.v zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 2, i32* getelementptr inbounds (%struct.anon* bitcast (%struct.v* @v1 to %struct.anon*), i32 0, i32 0), align 4
  %2 = load i32* getelementptr inbounds (%struct.anon* bitcast (%struct.v* @v1 to %struct.anon*), i32 0, i32 0), align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %2)
  store i64 5, i64* getelementptr inbounds (%struct.v* @v1, i32 0, i32 0, i32 0, i32 0), align 8
  %4 = load i64* getelementptr inbounds (%struct.v* @v1, i32 0, i32 0, i32 0, i32 0), align 8
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i64 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
