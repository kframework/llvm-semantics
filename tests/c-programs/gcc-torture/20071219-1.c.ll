; ModuleID = './20071219-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { [25 x i8] }

@p = common global %struct.S* null, align 8

; Function Attrs: noinline nounwind uwtable
define void @foo(%struct.S* %x, i32 %set) #0 {
  %1 = alloca %struct.S*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.S* %x, %struct.S** %1, align 8
  store i32 %set, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %30, %0
  %4 = load i32, i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = icmp ult i64 %5, 25
  br i1 %6, label %7, label %33

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.S*, %struct.S** %1, align 8
  %11 = getelementptr inbounds %struct.S, %struct.S* %10, i32 0, i32 0
  %12 = getelementptr inbounds [25 x i8], [25 x i8]* %11, i32 0, i64 %9
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %7
  call void @abort() #4
  unreachable

; <label>:17                                      ; preds = %7
  %18 = load i32, i32* %2, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %28

; <label>:20                                      ; preds = %17
  %21 = load i32, i32* %2, align 4
  %22 = trunc i32 %21 to i8
  %23 = load i32, i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = load %struct.S*, %struct.S** %1, align 8
  %26 = getelementptr inbounds %struct.S, %struct.S* %25, i32 0, i32 0
  %27 = getelementptr inbounds [25 x i8], [25 x i8]* %26, i32 0, i64 %24
  store i8 %22, i8* %27, align 1
  br label %28

; <label>:28                                      ; preds = %20, %17
  br label %29

; <label>:29                                      ; preds = %28
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32, i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %3

; <label>:33                                      ; preds = %3
  %34 = load %struct.S*, %struct.S** %1, align 8
  store %struct.S* %34, %struct.S** @p, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noinline nounwind uwtable
define void @test1() #0 {
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %1 = getelementptr inbounds %struct.S, %struct.S* %a, i32 0, i32 0
  %2 = bitcast [25 x i8]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %3 = bitcast %struct.S* %b to i8*
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %5 = bitcast %struct.S* %b to i8*
  %6 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 25, i32 1, i1 false)
  %7 = bitcast %struct.S* %b to i8*
  %8 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define void @test2() #0 {
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %1 = getelementptr inbounds %struct.S, %struct.S* %a, i32 0, i32 0
  %2 = bitcast [25 x i8]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %3 = bitcast %struct.S* %b to i8*
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %5 = bitcast %struct.S* %b to i8*
  %6 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 25, i32 1, i1 false)
  %7 = load %struct.S*, %struct.S** @p, align 8
  %8 = bitcast %struct.S* %b to i8*
  %9 = bitcast %struct.S* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @test3() #0 {
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %1 = getelementptr inbounds %struct.S, %struct.S* %a, i32 0, i32 0
  %2 = bitcast [25 x i8]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %3 = bitcast %struct.S* %b to i8*
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %5 = load %struct.S*, %struct.S** @p, align 8
  %6 = bitcast %struct.S* %5 to i8*
  %7 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 25, i32 1, i1 false)
  %8 = load %struct.S*, %struct.S** @p, align 8
  %9 = bitcast %struct.S* %8 to i8*
  %10 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test1()
  call void @test2()
  call void @test3()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
