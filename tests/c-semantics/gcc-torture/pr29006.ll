; ModuleID = './pr29006.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type <{ i8, i64 }>

@main.s = private unnamed_addr constant %struct.s <{ i8 1, i64 -1 }>, align 1

; Function Attrs: noinline nounwind uwtable
define void @foo(%struct.s* %s) #0 {
  %1 = alloca %struct.s*, align 8
  store %struct.s* %s, %struct.s** %1, align 8
  %2 = load %struct.s** %1, align 8
  %3 = getelementptr inbounds %struct.s* %2, i32 0, i32 1
  store i64 0, i64* %3, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %s = alloca %struct.s, align 1
  store i32 0, i32* %1
  %2 = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds (%struct.s* @main.s, i32 0, i32 0), i64 9, i32 1, i1 false)
  call void @foo(%struct.s* %s)
  %3 = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  %4 = load i64* %3, align 1
  %5 = icmp ne i64 %4, 0
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
