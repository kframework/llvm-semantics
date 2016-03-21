; ModuleID = './921204-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.bu = type { %struct.bf }
%struct.bf = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @f(i32 %i.coerce) #0 {
  %1 = alloca %union.bu, align 4
  %i = alloca %union.bu, align 4
  %o = alloca %union.bu, align 4
  %2 = getelementptr %union.bu, %union.bu* %i, i32 0, i32 0
  %3 = getelementptr %struct.bf, %struct.bf* %2, i32 0, i32 0
  store i32 %i.coerce, i32* %3, align 4
  %4 = bitcast %union.bu* %o to i8*
  %5 = bitcast %union.bu* %i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 4, i32 4, i1 false)
  %6 = bitcast %union.bu* %o to %struct.bf*
  %7 = bitcast %struct.bf* %6 to i32*
  %8 = load i32, i32* %7, align 4
  %9 = and i32 %8, 1
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %0
  %12 = bitcast %union.bu* %o to %struct.bf*
  %13 = bitcast %struct.bf* %12 to i32*
  %14 = load i32, i32* %13, align 4
  %15 = and i32 %14, -262145
  %16 = or i32 %15, 262144
  store i32 %16, i32* %13, align 4
  %17 = bitcast %union.bu* %o to %struct.bf*
  %18 = bitcast %struct.bf* %17 to i32*
  %19 = load i32, i32* %18, align 4
  %20 = and i32 %19, -1048577
  %21 = or i32 %20, 1048576
  store i32 %21, i32* %18, align 4
  br label %31

; <label>:22                                      ; preds = %0
  %23 = bitcast %union.bu* %o to %struct.bf*
  %24 = bitcast %struct.bf* %23 to i32*
  %25 = load i32, i32* %24, align 4
  %26 = and i32 %25, -262145
  store i32 %26, i32* %24, align 4
  %27 = bitcast %union.bu* %o to %struct.bf*
  %28 = bitcast %struct.bf* %27 to i32*
  %29 = load i32, i32* %28, align 4
  %30 = and i32 %29, -1048577
  store i32 %30, i32* %28, align 4
  br label %31

; <label>:31                                      ; preds = %22, %11
  %32 = bitcast %union.bu* %1 to i8*
  %33 = bitcast %union.bu* %o to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 4, i32 4, i1 false)
  %34 = getelementptr %union.bu, %union.bu* %1, i32 0, i32 0
  %35 = getelementptr %struct.bf, %struct.bf* %34, i32 0, i32 0
  %36 = load i32, i32* %35, align 4
  ret i32 %36
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
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %6, -2
  store i32 %7, i32* %5, align 4
  %8 = getelementptr %union.bu, %union.bu* %a, i32 0, i32 0
  %9 = getelementptr %struct.bf, %struct.bf* %8, i32 0, i32 0
  %10 = load i32, i32* %9, align 4
  %11 = call i32 @f(i32 %10)
  %12 = getelementptr %union.bu, %union.bu* %2, i32 0, i32 0
  %13 = getelementptr %struct.bf, %struct.bf* %12, i32 0, i32 0
  store i32 %11, i32* %13, align 4
  %14 = bitcast %union.bu* %r to i8*
  %15 = bitcast %union.bu* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 4, i32 4, i1 false)
  %16 = bitcast %union.bu* %a to i32*
  %17 = load i32, i32* %16, align 4
  %18 = bitcast %union.bu* %r to i32*
  %19 = load i32, i32* %18, align 4
  %20 = icmp ne i32 %17, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %24 = load i32, i32* %1
  ret i32 %24
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
