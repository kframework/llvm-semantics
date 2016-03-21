; ModuleID = './bf-sign-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i16, [2 x i8] }

@main.x = private unnamed_addr constant { i8, i8, [2 x i8] } { i8 -1, i8 1, [2 x i8] undef }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.anon, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.anon* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ({ i8, i8, [2 x i8] }, { i8, i8, [2 x i8] }* @main.x, i32 0, i32 0), i64 4, i32 4, i1 false)
  %3 = bitcast %struct.anon* %x to i16*
  %4 = load i16, i16* %3, align 4
  %5 = lshr i16 %4, 3
  %6 = and i16 %5, 7
  %7 = zext i16 %6 to i32
  %8 = icmp ne i32 %7, 7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:10                                      ; preds = %0
  %11 = bitcast %struct.anon* %x to i16*
  %12 = load i16, i16* %11, align 4
  %13 = shl i16 %12, 13
  %14 = ashr i16 %13, 13
  %15 = sext i16 %14 to i32
  %16 = icmp ne i32 %15, -1
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10
  call void @abort() #3
  unreachable

; <label>:18                                      ; preds = %10
  %19 = bitcast %struct.anon* %x to i16*
  %20 = load i16, i16* %19, align 4
  %21 = shl i16 %20, 7
  %22 = ashr i16 %21, 13
  %23 = sext i16 %22 to i32
  %24 = icmp ne i32 %23, -1
  br i1 %24, label %25, label %33

; <label>:25                                      ; preds = %18
  %26 = bitcast %struct.anon* %x to i16*
  %27 = load i16, i16* %26, align 4
  %28 = shl i16 %27, 7
  %29 = ashr i16 %28, 13
  %30 = sext i16 %29 to i32
  %31 = icmp ne i32 %30, 7
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %25
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %25, %18
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %35 = load i32, i32* %1
  ret i32 %35
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

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
