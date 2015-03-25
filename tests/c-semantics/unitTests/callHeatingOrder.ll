; ModuleID = './callHeatingOrder.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i8] }

@main.x11 = private unnamed_addr constant %struct.anon { [2 x i8] c"h\00" }, align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x11 = alloca %struct.anon, align 1
  store i32 0, i32* %1
  %2 = bitcast %struct.anon* %x11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds (%struct.anon* @main.x11, i32 0, i32 0, i32 0), i64 2, i32 1, i1 false)
  %3 = getelementptr inbounds %struct.anon* %x11, i32 0, i32 0
  %4 = getelementptr inbounds [2 x i8]* %3, i32 0, i32 0
  %5 = load i8* %4, align 1
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
