; ModuleID = './20071029-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.T = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, i32 }

@test.i = internal global i32 11, align 4

; Function Attrs: noinline nounwind uwtable
define void @test(%union.T* %t) #0 {
  %1 = alloca %union.T*, align 8
  store %union.T* %t, %union.T** %1, align 8
  %2 = load %union.T*, %union.T** %1, align 8
  %3 = bitcast %union.T* %2 to %struct.anon*
  %4 = getelementptr inbounds %struct.anon, %struct.anon* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = load i32, i32* @test.i, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @test.i, align 4
  %8 = icmp ne i32 %5, %6
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load %union.T*, %union.T** %1, align 8
  %12 = bitcast %union.T* %11 to %struct.anon*
  %13 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %70, label %16

; <label>:16                                      ; preds = %10
  %17 = load %union.T*, %union.T** %1, align 8
  %18 = bitcast %union.T* %17 to %struct.anon*
  %19 = getelementptr inbounds %struct.anon, %struct.anon* %18, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %70, label %22

; <label>:22                                      ; preds = %16
  %23 = load %union.T*, %union.T** %1, align 8
  %24 = bitcast %union.T* %23 to %struct.anon*
  %25 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %70, label %28

; <label>:28                                      ; preds = %22
  %29 = load %union.T*, %union.T** %1, align 8
  %30 = bitcast %union.T* %29 to %struct.anon*
  %31 = getelementptr inbounds %struct.anon, %struct.anon* %30, i32 0, i32 4
  %32 = load i32, i32* %31, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %70, label %34

; <label>:34                                      ; preds = %28
  %35 = load %union.T*, %union.T** %1, align 8
  %36 = bitcast %union.T* %35 to %struct.anon*
  %37 = getelementptr inbounds %struct.anon, %struct.anon* %36, i32 0, i32 5
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %70, label %40

; <label>:40                                      ; preds = %34
  %41 = load %union.T*, %union.T** %1, align 8
  %42 = bitcast %union.T* %41 to %struct.anon*
  %43 = getelementptr inbounds %struct.anon, %struct.anon* %42, i32 0, i32 6
  %44 = load i32, i32* %43, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %70, label %46

; <label>:46                                      ; preds = %40
  %47 = load %union.T*, %union.T** %1, align 8
  %48 = bitcast %union.T* %47 to %struct.anon*
  %49 = getelementptr inbounds %struct.anon, %struct.anon* %48, i32 0, i32 7
  %50 = load i32, i32* %49, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %70, label %52

; <label>:52                                      ; preds = %46
  %53 = load %union.T*, %union.T** %1, align 8
  %54 = bitcast %union.T* %53 to %struct.anon*
  %55 = getelementptr inbounds %struct.anon, %struct.anon* %54, i32 0, i32 8
  %56 = load i64, i64* %55, align 8
  %57 = icmp ne i64 %56, 0
  br i1 %57, label %70, label %58

; <label>:58                                      ; preds = %52
  %59 = load %union.T*, %union.T** %1, align 8
  %60 = bitcast %union.T* %59 to %struct.anon*
  %61 = getelementptr inbounds %struct.anon, %struct.anon* %60, i32 0, i32 9
  %62 = load i64, i64* %61, align 8
  %63 = icmp ne i64 %62, 0
  br i1 %63, label %70, label %64

; <label>:64                                      ; preds = %58
  %65 = load %union.T*, %union.T** %1, align 8
  %66 = bitcast %union.T* %65 to %struct.anon*
  %67 = getelementptr inbounds %struct.anon, %struct.anon* %66, i32 0, i32 10
  %68 = load i32, i32* %67, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %64, %58, %52, %46, %40, %34, %28, %22, %16, %10
  call void @abort() #4
  unreachable

; <label>:71                                      ; preds = %64
  %72 = load i32, i32* @test.i, align 4
  %73 = icmp eq i32 %72, 20
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %71
  call void @exit(i32 0) #4
  unreachable

; <label>:75                                      ; preds = %71
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %i) #0 {
  %1 = alloca i32, align 4
  %t = alloca %union.T, align 8
  %2 = alloca %union.T, align 8
  store i32 %i, i32* %1, align 4
  br label %3

; <label>:3                                       ; preds = %3, %0
  %4 = bitcast %union.T* %2 to %struct.anon*
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 0
  %6 = load i32, i32* %1, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %1, align 4
  store i32 %7, i32* %5, align 4
  %8 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 1
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 2
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 3
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 4
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 5
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 6
  store i32 0, i32* %13, align 4
  %14 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 7
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 8
  store i64 0, i64* %15, align 8
  %16 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 9
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 10
  store i32 0, i32* %17, align 4
  %18 = bitcast %union.T* %t to i8*
  %19 = bitcast %union.T* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 56, i32 8, i1 false)
  call void @test(%union.T* %t)
  br label %3
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #3 {
  %1 = alloca i32, align 4
  %t1 = alloca %union.T*, align 8
  %t2 = alloca %union.T*, align 8
  %cnt = alloca i32, align 4
  %2 = alloca %union.T, align 8
  store i32 0, i32* %1
  store i32 0, i32* %cnt, align 4
  store %union.T* null, %union.T** %t1, align 8
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load %union.T*, %union.T** %t1, align 8
  store %union.T* %4, %union.T** %t2, align 8
  %5 = bitcast %union.T* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 56, i32 8, i1 false)
  %6 = bitcast %union.T* %2 to %struct.anon*
  %7 = getelementptr inbounds %struct.anon, %struct.anon* %6, i32 0, i32 8
  %8 = load i32, i32* %cnt, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %cnt, align 4
  %10 = sext i32 %8 to i64
  store i64 %10, i64* %7, align 8
  store %union.T* %2, %union.T** %t1, align 8
  %11 = load i32, i32* %cnt, align 4
  %12 = icmp slt i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %3
  br label %3

; <label>:14                                      ; preds = %3
  %15 = load %union.T*, %union.T** %t1, align 8
  %16 = load %union.T*, %union.T** %t2, align 8
  %17 = icmp ne %union.T* %15, %16
  br i1 %17, label %24, label %18

; <label>:18                                      ; preds = %14
  %19 = load %union.T*, %union.T** %t1, align 8
  %20 = bitcast %union.T* %19 to %struct.anon*
  %21 = getelementptr inbounds %struct.anon, %struct.anon* %20, i32 0, i32 8
  %22 = load i64, i64* %21, align 8
  %23 = icmp ne i64 %22, 2
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %18, %14
  call void @abort() #4
  unreachable

; <label>:25                                      ; preds = %18
  call void @foo(i32 10)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
