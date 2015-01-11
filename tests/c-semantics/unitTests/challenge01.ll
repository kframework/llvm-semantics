; ModuleID = './challenge01.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.t = type { i32 }

@s = common global %struct.t zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @f(i32 %s.coerce) #0 {
  %1 = alloca %struct.t, align 4
  %s = alloca %struct.t, align 4
  %2 = getelementptr %struct.t* %s, i32 0, i32 0
  store i32 %s.coerce, i32* %2
  %3 = getelementptr inbounds %struct.t* %s, i32 0, i32 0
  store i32 5, i32* %3, align 4
  %4 = bitcast %struct.t* %1 to i8*
  %5 = bitcast %struct.t* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 4, i32 4, i1 false)
  %6 = getelementptr %struct.t* %1, i32 0, i32 0
  %7 = load i32* %6
  ret i32 %7
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.t, align 4
  store i32 0, i32* %1
  %3 = load i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0)
  %4 = call i32 @f(i32 %3)
  %5 = getelementptr %struct.t* %2, i32 0, i32 0
  store i32 %4, i32* %5
  %6 = getelementptr inbounds %struct.t* %2, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = load i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0), align 4
  %9 = add nsw i32 %7, %8
  ret i32 %9
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
