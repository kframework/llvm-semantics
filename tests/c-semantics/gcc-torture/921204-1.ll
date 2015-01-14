; ModuleID = './921204-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.bu = type { i32 }
%struct.bf = type { [4 x i8] }

; Function Attrs: nounwind uwtable
define i32 @f(i32 %i.coerce) #0 {
  %1 = alloca %union.bu, align 4
  %i = alloca %union.bu, align 4
  %o = alloca %union.bu, align 4
  %2 = getelementptr %union.bu* %i, i32 0, i32 0
  store i32 %i.coerce, i32* %2
  %3 = bitcast %union.bu* %o to i8*
  %4 = bitcast %union.bu* %i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 4, i32 4, i1 false)
  %5 = bitcast %union.bu* %o to %struct.bf*
  %6 = bitcast %struct.bf* %5 to i32*
  %7 = load i32* %6, align 4
  %8 = and i32 %7, 1
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %0
  %11 = bitcast %union.bu* %o to %struct.bf*
  %12 = bitcast %struct.bf* %11 to i32*
  %13 = load i32* %12, align 4
  %14 = and i32 %13, -262145
  %15 = or i32 %14, 262144
  store i32 %15, i32* %12, align 4
  %16 = bitcast %union.bu* %o to %struct.bf*
  %17 = bitcast %struct.bf* %16 to i32*
  %18 = load i32* %17, align 4
  %19 = and i32 %18, -1048577
  %20 = or i32 %19, 1048576
  store i32 %20, i32* %17, align 4
  br label %30

; <label>:21                                      ; preds = %0
  %22 = bitcast %union.bu* %o to %struct.bf*
  %23 = bitcast %struct.bf* %22 to i32*
  %24 = load i32* %23, align 4
  %25 = and i32 %24, -262145
  store i32 %25, i32* %23, align 4
  %26 = bitcast %union.bu* %o to %struct.bf*
  %27 = bitcast %struct.bf* %26 to i32*
  %28 = load i32* %27, align 4
  %29 = and i32 %28, -1048577
  store i32 %29, i32* %27, align 4
  br label %30

; <label>:30                                      ; preds = %21, %10
  %31 = bitcast %union.bu* %1 to i8*
  %32 = bitcast %union.bu* %o to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 4, i32 4, i1 false)
  %33 = getelementptr %union.bu* %1, i32 0, i32 0
  %34 = load i32* %33
  ret i32 %34
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %union.bu, align 4
  %r = alloca %union.bu, align 4
  %2 = alloca %union.bu, align 4
  store i32 0, i32* %1
  %3 = bitcast %union.bu* %a to i32*
  store i32 67108864, i32* %3, align 4
  %4 = bitcast %union.bu* %a to %struct.bf*
  %5 = bitcast %struct.bf* %4 to i32*
  %6 = load i32* %5, align 4
  %7 = and i32 %6, -2
  store i32 %7, i32* %5, align 4
  %8 = getelementptr %union.bu* %a, i32 0, i32 0
  %9 = load i32* %8
  %10 = call i32 @f(i32 %9)
  %11 = getelementptr %union.bu* %2, i32 0, i32 0
  store i32 %10, i32* %11
  %12 = bitcast %union.bu* %r to i8*
  %13 = bitcast %union.bu* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 4, i32 4, i1 false)
  %14 = bitcast %union.bu* %a to i32*
  %15 = load i32* %14, align 4
  %16 = bitcast %union.bu* %r to i32*
  %17 = load i32* %16, align 4
  %18 = icmp ne i32 %15, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %22 = load i32* %1
  ret i32 %22
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
