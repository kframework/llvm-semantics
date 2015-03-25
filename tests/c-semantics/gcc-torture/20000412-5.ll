; ModuleID = './20000412-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32 }

@main.lastglob = private unnamed_addr constant [1 x %struct.anon] [%struct.anon { i32 0, i32 1 }], align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %lastglob = alloca [1 x %struct.anon], align 4
  store i32 0, i32* %1
  %2 = bitcast [1 x %struct.anon]* %lastglob to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([1 x %struct.anon]* @main.lastglob to i8*), i64 8, i32 4, i1 false)
  %3 = getelementptr inbounds [1 x %struct.anon]* %lastglob, i32 0, i64 0
  %4 = getelementptr inbounds %struct.anon* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %12, label %7

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds [1 x %struct.anon]* %lastglob, i32 0, i64 0
  %9 = getelementptr inbounds %struct.anon* %8, i32 0, i32 1
  %10 = load i32* %9, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %7, %0
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %7
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
