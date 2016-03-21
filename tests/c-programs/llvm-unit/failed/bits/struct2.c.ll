; ModuleID = './struct2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Globals = type { i8, [1 x %struct.min_info], %struct.min_info* }
%struct.min_info = type { i32, i32 }

@G = common global %struct.Globals zeroinitializer, align 8
@.str = private unnamed_addr constant [7 x i8] c"error\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @assign() #0 {
  %1 = alloca i32, align 4
  store %struct.min_info* getelementptr inbounds (%struct.Globals, %struct.Globals* @G, i32 0, i32 1, i32 0), %struct.min_info** getelementptr inbounds (%struct.Globals, %struct.Globals* @G, i32 0, i32 2), align 8
  %2 = load i32, i32* %1
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @assign()
  %3 = load %struct.min_info*, %struct.min_info** getelementptr inbounds (%struct.Globals, %struct.Globals* @G, i32 0, i32 2), align 8
  %4 = icmp ne %struct.min_info* %3, getelementptr inbounds (%struct.Globals, %struct.Globals* @G, i32 0, i32 1, i32 0)
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
