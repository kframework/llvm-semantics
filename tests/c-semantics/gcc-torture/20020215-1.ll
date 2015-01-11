; ModuleID = './20020215-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i16, i64, i16 }

; Function Attrs: nounwind uwtable
define void @foo(%struct.s* noalias sret %agg.result, %struct.s* byval align 8 %s) #0 {
  %1 = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  %2 = load i64* %1, align 8
  %3 = add nsw i64 %2, 1
  store i64 %3, i64* %1, align 8
  %4 = bitcast %struct.s* %agg.result to i8*
  %5 = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.s, align 8
  %2 = alloca %struct.s, align 8
  %3 = alloca %struct.s, align 8
  store i32 0, i32* %1
  %4 = getelementptr inbounds %struct.s* %2, i32 0, i32 0
  store i16 1000, i16* %4, align 2
  %5 = getelementptr inbounds %struct.s* %2, i32 0, i32 1
  store i64 2000, i64* %5, align 8
  %6 = getelementptr inbounds %struct.s* %2, i32 0, i32 2
  store i16 3000, i16* %6, align 2
  %7 = bitcast %struct.s* %3 to i8*
  %8 = bitcast %struct.s* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 24, i32 8, i1 false)
  call void @foo(%struct.s* sret %s, %struct.s* byval align 8 %3)
  %9 = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  %10 = load i16* %9, align 2
  %11 = sext i16 %10 to i32
  %12 = icmp ne i32 %11, 1000
  br i1 %12, label %22, label %13

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  %15 = load i64* %14, align 8
  %16 = icmp ne i64 %15, 2001
  br i1 %16, label %22, label %17

; <label>:17                                      ; preds = %13
  %18 = getelementptr inbounds %struct.s* %s, i32 0, i32 2
  %19 = load i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp ne i32 %20, 3000
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17, %13, %0
  call void @abort() #3
  unreachable

; <label>:23                                      ; preds = %17
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %25 = load i32* %1
  ret i32 %25
}

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
