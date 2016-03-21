; ModuleID = './20031201-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.io = type { %struct.s1, %struct.s2 }
%struct.s1 = type { i32 }
%struct.s2 = type { i32 }

@i = internal global %struct.io* null, align 8
@test_t1 = internal global i64 0, align 8
@m = internal global i32 1, align 4
@test_length = internal global i32 2, align 4
@test_t0 = internal global i64 0, align 8
@d = internal global i32 1, align 4
@f0.washere = internal global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @f1(i8* %port) #0 {
  %1 = alloca i8*, align 8
  %fail_count = alloca i32, align 4
  %tlen = alloca i64, align 8
  %x0 = alloca %struct.s1, align 4
  %x1 = alloca %struct.s2, align 4
  %e = alloca i64, align 8
  %e1 = alloca i64, align 8
  store i8* %port, i8** %1, align 8
  store i32 0, i32* %fail_count, align 4
  %2 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 4, i32 4, i1 false)
  %3 = bitcast %struct.s2* %x1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 4, i32 4, i1 false)
  %4 = load i8*, i8** %1, align 8
  %5 = bitcast i8* %4 to %struct.io*
  store %struct.io* %5, %struct.io** @i, align 8
  %6 = bitcast %struct.s2* %x1 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = and i32 %7, -65536
  %9 = or i32 %8, 32
  store i32 %9, i32* %6, align 4
  %10 = bitcast %struct.s1* %x0 to i32*
  %11 = load i32, i32* %10, align 4
  %12 = and i32 %11, -65536
  %13 = or i32 %12, 32
  store i32 %13, i32* %10, align 4
  %14 = load %struct.io*, %struct.io** @i, align 8
  %15 = getelementptr inbounds %struct.io, %struct.io* %14, i32 0, i32 0
  %16 = bitcast %struct.s1* %15 to i8*
  %17 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 4, i32 4, i1 false)
  %18 = load %struct.io*, %struct.io** @i, align 8
  %19 = getelementptr inbounds %struct.io, %struct.io* %18, i32 0, i32 1
  %20 = bitcast %struct.s2* %19 to i8*
  %21 = bitcast %struct.s2* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 4, i32 4, i1 false)
  br label %22

; <label>:22                                      ; preds = %23, %0
  call void @f0()
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i64, i64* @test_t1, align 8
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %22, label %26

; <label>:26                                      ; preds = %23
  %27 = bitcast %struct.s2* %x1 to i32*
  %28 = load i32, i32* %27, align 4
  %29 = and i32 %28, -65536
  %30 = or i32 %29, 8
  store i32 %30, i32* %27, align 4
  %31 = bitcast %struct.s1* %x0 to i32*
  %32 = load i32, i32* %31, align 4
  %33 = and i32 %32, -65536
  %34 = or i32 %33, 8
  store i32 %34, i32* %31, align 4
  %35 = load %struct.io*, %struct.io** @i, align 8
  %36 = getelementptr inbounds %struct.io, %struct.io* %35, i32 0, i32 0
  %37 = bitcast %struct.s1* %36 to i8*
  %38 = bitcast %struct.s1* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 4, i32 4, i1 false)
  %39 = load %struct.io*, %struct.io** @i, align 8
  %40 = getelementptr inbounds %struct.io, %struct.io* %39, i32 0, i32 1
  %41 = bitcast %struct.s2* %40 to i8*
  %42 = bitcast %struct.s2* %x1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 4, i32 4, i1 false)
  call void @test()
  %43 = load i32, i32* @m, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %59

; <label>:45                                      ; preds = %26
  %46 = load i32, i32* @test_length, align 4
  %47 = mul nsw i32 2170, %46
  %48 = sext i32 %47 to i64
  store i64 %48, i64* %e, align 8
  %49 = load i64, i64* @test_t1, align 8
  %50 = load i64, i64* @test_t0, align 8
  %51 = sub i64 %49, %50
  store i64 %51, i64* %tlen, align 8
  %52 = load i64, i64* %tlen, align 8
  %53 = load i64, i64* %e, align 8
  %54 = sub i64 %52, %53
  %55 = and i64 %54, 2147483647
  %56 = icmp ugt i64 %55, 1000
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %45
  call void @f0()
  br label %58

; <label>:58                                      ; preds = %57, %45
  br label %59

; <label>:59                                      ; preds = %58, %26
  %60 = load i32, i32* @d, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %76

; <label>:62                                      ; preds = %59
  %63 = load i32, i32* @test_length, align 4
  %64 = mul nsw i32 2170, %63
  %65 = sext i32 %64 to i64
  store i64 %65, i64* %e1, align 8
  %66 = load i64, i64* @test_t1, align 8
  %67 = load i64, i64* @test_t0, align 8
  %68 = sub i64 %66, %67
  store i64 %68, i64* %tlen, align 8
  %69 = load i64, i64* %tlen, align 8
  %70 = load i64, i64* %e1, align 8
  %71 = sub i64 %69, %70
  %72 = and i64 %71, 2147483647
  %73 = icmp ugt i64 %72, 1000
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %62
  call void @f0()
  br label %75

; <label>:75                                      ; preds = %74, %62
  br label %76

; <label>:76                                      ; preds = %75, %59
  %77 = load i32, i32* %fail_count, align 4
  %78 = icmp ne i32 %77, 0
  %79 = select i1 %78, i32 1, i32 0
  ret i32 %79
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @f0() #0 {
  %iop = alloca %struct.io*, align 8
  %1 = load %struct.io*, %struct.io** @i, align 8
  store %struct.io* %1, %struct.io** %iop, align 8
  %2 = load i32, i32* @f0.washere, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @f0.washere, align 4
  %4 = icmp ne i32 %2, 0
  br i1 %4, label %19, label %5

; <label>:5                                       ; preds = %0
  %6 = load %struct.io*, %struct.io** %iop, align 8
  %7 = getelementptr inbounds %struct.io, %struct.io* %6, i32 0, i32 0
  %8 = bitcast %struct.s1* %7 to i32*
  %9 = load i32, i32* %8, align 4
  %10 = and i32 %9, 65535
  %11 = icmp ne i32 %10, 32
  br i1 %11, label %19, label %12

; <label>:12                                      ; preds = %5
  %13 = load %struct.io*, %struct.io** %iop, align 8
  %14 = getelementptr inbounds %struct.io, %struct.io* %13, i32 0, i32 1
  %15 = bitcast %struct.s2* %14 to i32*
  %16 = load i32, i32* %15, align 4
  %17 = and i32 %16, 65535
  %18 = icmp ne i32 %17, 32
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %12, %5, %0
  call void @abort() #4
  unreachable

; <label>:20                                      ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @test() #0 {
  %iop = alloca %struct.io*, align 8
  %1 = load %struct.io*, %struct.io** @i, align 8
  store %struct.io* %1, %struct.io** %iop, align 8
  %2 = load %struct.io*, %struct.io** %iop, align 8
  %3 = getelementptr inbounds %struct.io, %struct.io* %2, i32 0, i32 0
  %4 = bitcast %struct.s1* %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = and i32 %5, 65535
  %7 = icmp ne i32 %6, 8
  br i1 %7, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = load %struct.io*, %struct.io** %iop, align 8
  %10 = getelementptr inbounds %struct.io, %struct.io* %9, i32 0, i32 1
  %11 = bitcast %struct.s2* %10 to i32*
  %12 = load i32, i32* %11, align 4
  %13 = and i32 %12, 65535
  %14 = icmp ne i32 %13, 8
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8, %0
  call void @abort() #4
  unreachable

; <label>:16                                      ; preds = %8
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %io0 = alloca %struct.io, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.io* %io0 to i8*
  %3 = call i32 @f1(i8* %2)
  call void @abort() #4
  unreachable
                                                  ; No predecessors!
  %5 = load i32, i32* %1
  ret i32 %5
}

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
