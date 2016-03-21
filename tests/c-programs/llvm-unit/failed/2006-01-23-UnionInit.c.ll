; ModuleID = './2006-01-23-UnionInit.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.task_struct = type { [16 x i8] }
%struct.anon = type { i8, i8 }
%union.bt4 = type { %struct.at4 }
%struct.at4 = type { i64 }
%struct.anon.0 = type { i8, i8 }
%union.anon.3 = type { %struct.dvd_send_key }
%struct.dvd_send_key = type { i8, [5 x i8], [2 x i8] }
%struct.s = type { i32, i32, i32 }
%struct.foo2 = type <{ i16, [2 x i8], i64, i16, [2 x i8] }>
%struct.emptystruct = type {}
%union.ucast = type { %struct.s }
%struct.spinlock_t = type { %struct.emptystruct }
%struct.inflate_huft_s = type { %union.anon, i32 }
%union.anon = type { i32 }
%struct.bt1 = type { i16, [1 x i8] }
%struct.one = type { i32, [0 x i32] }
%struct.anon.1 = type { i32, [0 x i32] }
%struct.anon.2 = type { i8*, [0 x i8] }

@init_task_union = global { %struct.task_struct, [16368 x i8] } { %struct.task_struct { [16 x i8] c"swapper\00\00\00\00\00\00\00\00\00" }, [16368 x i8] undef }, align 8
@fixed_tl = global <{ { { %struct.anon, [2 x i8] }, i32 } }> <{ { { %struct.anon, [2 x i8] }, i32 } { { %struct.anon, [2 x i8] } { %struct.anon { i8 96, i8 7 }, [2 x i8] undef }, i32 256 } }>, align 4
@bkv4 = global %union.bt4 { %struct.at4 { i64 61172160 } }, align 8
@cav1 = global { i8, i8, [1 x i8], i8 } { i8 100, i8 1, [1 x i8] c"\02", i8 undef }, align 4
@V = global { %struct.anon.0, [2 x i8] } { %struct.anon.0 { i8 1, i8 2 }, [2 x i8] undef }, align 4
@nd = global { [64 x i8] } { [64 x i8] c"relname\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 4
@hobbit = global { i32, [3 x i32] } { i32 5, [3 x i32] [i32 1, i32 2, i32 3] }, align 4
@hobbit2 = global { i32, [3 x i32] } { i32 5, [3 x i32] [i32 1, i32 2, i32 3] }, align 4
@data = global { i32, [3 x i32] } { i32 0, [3 x i32] [i32 1, i32 2, i32 3] }, align 4
@s = global { i8*, [19 x i8] } { i8* null, [19 x i8] c"   xyzkasjdlf     \00" }, align 8
@ai = global %union.anon.3 { %struct.dvd_send_key { i8 3, [5 x i8] c"foo\00\00", [2 x i8] undef } }, align 4
@.str = private unnamed_addr constant [20 x i8] c"returning raw_lock\0A\00", align 1
@ucast_test.y = private unnamed_addr constant %struct.s { i32 1, i32 2, i32 0 }, align 4
@foo2 = global %struct.foo2 <{ i16 23122, [2 x i8] undef, i64 -12312731, i16 -312, [2 x i8] undef }>, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"PR156: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"PR295/PR568: %d, %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"PR574: %d, %d, %d, %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"PR162: %d, %d, %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"PR650: %s, %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"PR199: %d, %d, %d, %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"PR431: %d, %d, %d, %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"PR654: %ld, '%s'\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"PR323: %d, '%s'\0A\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"PR627: %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"PR684: %d, %d, %d %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [28 x i8] c"rdar://6828787: %d, %d, %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i8* @foo() #0 {
  ret i8* bitcast ({ i32, [3 x i32] }* @hobbit2 to i8*)
}

; Function Attrs: nounwind uwtable
define void @one_raw_spinlock() #0 {
  %1 = alloca %struct.emptystruct, align 1
  %raw = alloca %struct.emptystruct, align 1
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0))
  %3 = bitcast %struct.emptystruct* %1 to i8*
  %4 = bitcast %struct.emptystruct* %raw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 0, i32 1, i1 false)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define { i64, i32 } @ucast_test() #0 {
  %1 = alloca %union.ucast, align 4
  %y = alloca %struct.s, align 4
  %z = alloca %union.ucast, align 4
  %2 = alloca { i64, i32 }, align 4
  %3 = bitcast %struct.s* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.s* @ucast_test.y to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast %union.ucast* %z to %struct.s*
  %5 = bitcast %struct.s* %4 to i8*
  %6 = bitcast %struct.s* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 4, i1 false)
  %7 = bitcast %union.ucast* %1 to i8*
  %8 = bitcast %union.ucast* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 12, i32 4, i1 false)
  %9 = getelementptr %union.ucast, %union.ucast* %1, i32 0, i32 0
  %10 = bitcast { i64, i32 }* %2 to i8*
  %11 = bitcast %struct.s* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 4, i1 false)
  %12 = load { i64, i32 }, { i64, i32 }* %2, align 4
  ret { i64, i32 } %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %XX = alloca %union.ucast, align 4
  %lock = alloca %struct.spinlock_t, align 1
  %2 = alloca %struct.spinlock_t, align 1
  %3 = alloca %struct.emptystruct, align 1
  %4 = alloca %union.ucast, align 4
  %5 = alloca { i64, i32 }, align 4
  store i32 0, i32* %1
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ({ %struct.task_struct, [16368 x i8] }, { %struct.task_struct, [16368 x i8] }* @init_task_union, i32 0, i32 0, i32 0, i32 0))
  %7 = load i32, i32* bitcast (<{ { { %struct.anon, [2 x i8] }, i32 } }>* @fixed_tl to i32*), align 4
  %8 = load i32, i32* getelementptr inbounds ([1 x %struct.inflate_huft_s], [1 x %struct.inflate_huft_s]* bitcast (<{ { { %struct.anon, [2 x i8] }, i32 } }>* @fixed_tl to [1 x %struct.inflate_huft_s]*), i32 0, i64 0, i32 1), align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0), i32 %7, i32 %8)
  %10 = load i64, i64* getelementptr inbounds (%union.bt4, %union.bt4* @bkv4, i32 0, i32 0, i32 0), align 8
  %11 = trunc i64 %10 to i32
  %12 = load i16, i16* bitcast ({ i8, i8, [1 x i8], i8 }* @cav1 to i16*), align 4
  %13 = shl i16 %12, 12
  %14 = ashr i16 %13, 12
  %15 = sext i16 %14 to i32
  %16 = load i16, i16* bitcast ({ i8, i8, [1 x i8], i8 }* @cav1 to i16*), align 4
  %17 = shl i16 %16, 6
  %18 = ashr i16 %17, 10
  %19 = sext i16 %18 to i32
  %20 = load i8, i8* getelementptr inbounds (%struct.bt1, %struct.bt1* bitcast ({ i8, i8, [1 x i8], i8 }* @cav1 to %struct.bt1*), i32 0, i32 1, i64 0), align 1
  %21 = zext i8 %20 to i32
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %11, i32 %15, i32 %19, i32 %21)
  %23 = load i8, i8* getelementptr inbounds ({ %struct.anon.0, [2 x i8] }, { %struct.anon.0, [2 x i8] }* @V, i32 0, i32 0, i32 0), align 1
  %24 = sext i8 %23 to i32
  %25 = load i8, i8* getelementptr inbounds ({ %struct.anon.0, [2 x i8] }, { %struct.anon.0, [2 x i8] }* @V, i32 0, i32 0, i32 1), align 1
  %26 = sext i8 %25 to i32
  %27 = load i32, i32* bitcast ({ %struct.anon.0, [2 x i8] }* @V to i32*), align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0), i32 %24, i32 %26, i32 %27)
  %29 = load i32, i32* bitcast ({ [64 x i8] }* @nd to i32*), align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ({ [64 x i8] }, { [64 x i8] }* @nd, i32 0, i32 0, i32 0), i32 %29)
  %31 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit to %struct.one*), i32 0, i32 0), align 4
  %32 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit to %struct.one*), i32 0, i32 1, i64 0), align 4
  %33 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit to %struct.one*), i32 0, i32 1, i64 1), align 4
  %34 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit to %struct.one*), i32 0, i32 1, i64 2), align 4
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i32 %31, i32 %32, i32 %33, i32 %34)
  %36 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit2 to %struct.one*), i32 0, i32 0), align 4
  %37 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit2 to %struct.one*), i32 0, i32 1, i64 0), align 4
  %38 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit2 to %struct.one*), i32 0, i32 1, i64 1), align 4
  %39 = load i32, i32* getelementptr inbounds (%struct.one, %struct.one* bitcast ({ i32, [3 x i32] }* @hobbit2 to %struct.one*), i32 0, i32 1, i64 2), align 4
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i32 %36, i32 %37, i32 %38, i32 %39)
  %41 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i32, [3 x i32] }* @data to %struct.anon.1*), i32 0, i32 0), align 4
  %42 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i32, [3 x i32] }* @data to %struct.anon.1*), i32 0, i32 1, i64 0), align 4
  %43 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i32, [3 x i32] }* @data to %struct.anon.1*), i32 0, i32 1, i64 1), align 4
  %44 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i32, [3 x i32] }* @data to %struct.anon.1*), i32 0, i32 1, i64 2), align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i32 %41, i32 %42, i32 %43, i32 %44)
  %46 = load i8*, i8** getelementptr inbounds (%struct.anon.2, %struct.anon.2* bitcast ({ i8*, [19 x i8] }* @s to %struct.anon.2*), i32 0, i32 0), align 8
  %47 = ptrtoint i8* %46 to i64
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i32 0, i32 0), i64 %47, i8* getelementptr inbounds (%struct.anon.2, %struct.anon.2* bitcast ({ i8*, [19 x i8] }* @s to %struct.anon.2*), i32 0, i32 1, i32 0))
  %49 = load i8, i8* getelementptr inbounds (%union.anon.3, %union.anon.3* @ai, i32 0, i32 0, i32 0), align 4
  %50 = and i8 %49, 3
  %51 = zext i8 %50 to i32
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0), i32 %51, i8* getelementptr inbounds (%union.anon.3, %union.anon.3* @ai, i32 0, i32 0, i32 1, i32 0))
  call void @one_raw_spinlock()
  %53 = bitcast %struct.spinlock_t* %lock to i8*
  %54 = bitcast %struct.spinlock_t* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %54, i64 0, i32 1, i1 false)
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 0)
  %56 = call { i64, i32 } @ucast_test()
  %57 = getelementptr %union.ucast, %union.ucast* %4, i32 0, i32 0
  store { i64, i32 } %56, { i64, i32 }* %5, align 4
  %58 = bitcast { i64, i32 }* %5 to i8*
  %59 = bitcast %struct.s* %57 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %58, i64 12, i32 4, i1 false)
  %60 = bitcast %union.ucast* %XX to i8*
  %61 = bitcast %union.ucast* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %60, i8* %61, i64 12, i32 4, i1 false)
  %62 = bitcast %union.ucast* %XX to %struct.s*
  %63 = getelementptr inbounds %struct.s, %struct.s* %62, i32 0, i32 0
  %64 = load i32, i32* %63, align 4
  %65 = bitcast %union.ucast* %XX to %struct.s*
  %66 = getelementptr inbounds %struct.s, %struct.s* %65, i32 0, i32 1
  %67 = load i32, i32* %66, align 4
  %68 = bitcast %union.ucast* %XX to %struct.s*
  %69 = getelementptr inbounds %struct.s, %struct.s* %68, i32 0, i32 2
  %70 = load i32, i32* %69, align 4
  %71 = bitcast %union.ucast* %XX to i32*
  %72 = load i32, i32* %71, align 4
  %73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i32 0, i32 0), i32 %64, i32 %67, i32 %70, i32 %72)
  %74 = load i16, i16* getelementptr inbounds (%struct.foo2, %struct.foo2* @foo2, i32 0, i32 0), align 2
  %75 = sext i16 %74 to i32
  %76 = load i64, i64* getelementptr inbounds (%struct.foo2, %struct.foo2* @foo2, i32 0, i32 2), align 4
  %77 = trunc i64 %76 to i32
  %78 = load i16, i16* getelementptr inbounds (%struct.foo2, %struct.foo2* @foo2, i32 0, i32 3), align 2
  %79 = sext i16 %78 to i32
  %80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.12, i32 0, i32 0), i32 %75, i32 %77, i32 %79)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
