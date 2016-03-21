; ModuleID = './pr35472.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { [16 x i32] }

@p = common global %struct.S* null, align 8

; Function Attrs: noinline nounwind uwtable
define void @foo(%struct.S* %a, %struct.S* %b) #0 {
  %1 = alloca %struct.S*, align 8
  %2 = alloca %struct.S*, align 8
  store %struct.S* %a, %struct.S** %1, align 8
  store %struct.S* %b, %struct.S** %2, align 8
  %3 = load %struct.S*, %struct.S** %1, align 8
  %4 = getelementptr inbounds %struct.S, %struct.S* %3, i32 0, i32 0
  %5 = getelementptr inbounds [16 x i32], [16 x i32]* %4, i32 0, i64 0
  store i32 -1, i32* %5, align 4
  %6 = load %struct.S*, %struct.S** %2, align 8
  store %struct.S* %6, %struct.S** @p, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @test() #1 {
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %1 = getelementptr inbounds %struct.S, %struct.S* %a, i32 0, i32 0
  %2 = getelementptr inbounds [16 x i32], [16 x i32]* %1, i32 0, i64 0
  %3 = bitcast i32* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 64, i32 4, i1 false)
  %4 = getelementptr inbounds %struct.S, %struct.S* %b, i32 0, i32 0
  %5 = getelementptr inbounds [16 x i32], [16 x i32]* %4, i32 0, i64 0
  %6 = bitcast i32* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 64, i32 4, i1 false)
  call void @foo(%struct.S* %a, %struct.S* %b)
  %7 = load %struct.S*, %struct.S** @p, align 8
  %8 = bitcast %struct.S* %7 to i8*
  %9 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 64, i32 4, i1 false)
  %10 = load %struct.S*, %struct.S** @p, align 8
  %11 = bitcast %struct.S* %10 to i8*
  %12 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 64, i32 4, i1 false)
  %13 = getelementptr inbounds %struct.S, %struct.S* %b, i32 0, i32 0
  %14 = getelementptr inbounds [16 x i32], [16 x i32]* %13, i32 0, i64 0
  %15 = load i32, i32* %14, align 4
  %16 = icmp ne i32 %15, -1
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:18                                      ; preds = %0
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
