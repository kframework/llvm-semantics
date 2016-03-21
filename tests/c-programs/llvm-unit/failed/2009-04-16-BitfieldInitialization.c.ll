; ModuleID = './2009-04-16-BitfieldInitialization.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ty2 = type <{ float, i8, i32 }>
%struct.ty4 = type <{ x86_fp80, i8, x86_fp80 }>
%struct.anon = type { i8, i8 }
%struct.anon.2 = type <{ x86_fp80, i8 }>
%struct.sDescrItem = type { i8, i8*, i8 }
%struct.t10s = type <{ i16, [2 x i8], i32* }>
%struct.ty = type { i32, %union.anon }
%union.anon = type { i8* }
%struct.ty3 = type { i32, [0 x i8] }
%struct.anon.1 = type <{ i8, i16 }>
%struct.anon.0 = type <{ i8, i16 }>
%struct.anon.3 = type <{ i8, i16 }>
%struct.anon.4 = type <{ i8, i16 }>
%struct.resword = type { i32*, i32 }

@t1 = global { i32, [4 x i8], { i32, [4 x i8] } } { i32 101, [4 x i8] undef, { i32, [4 x i8] } { i32 1, [4 x i8] undef } }, align 8
@t2 = global %struct.ty2 <{ float 1.010000e+02, i8 1, i32 204 }>, align 1
@t3 = global { i32, [3 x i8] } { i32 4, [3 x i8] c"fo\00" }, align 4
@t4 = global %struct.ty4 <{ x86_fp80 0xK3FFF8000000000000000, i8 4, x86_fp80 0xK40038800000000000000 }>, align 1
@t5a = global %struct.anon { i8 101, i8 15 }, align 1
@t5b = global { i8, i8, i8 } { i8 101, i8 -49, i8 4 }, align 1
@t5 = global { i8, i8, i8 } { i8 101, i8 -65, i8 7 }, align 1
@t6 = global %struct.anon.2 <{ x86_fp80 0xK4005F6D2F1A9FBE77000, i8 5 }>, align 1
@t7 = global { i8, i8, i8 } { i8 101, i8 63, i8 0 }, align 1
@t7a = global { i8, i8, i8 } { i8 101, i8 -65, i8 7 }, align 1
@t8 = global %struct.sDescrItem { i8 16, i8* null, i8 32 }, align 8
@t9 = global { i32*, i8, i8, i8, i8 } { i32* null, i8 123, i8 0, i8 -56, i8 1 }, align 8
@x = global i32 42, align 4
@t10 = global %struct.t10s <{ i16 0, [2 x i8] undef, i32* @x }>, align 4
@.str = private unnamed_addr constant [11 x i8] c"1: %d, %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"2: %f, %d, %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"3: %d %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"4: %f %d %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"5: %d %d %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"5a: %d %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"5b: %d %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"6: %Lf %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"7: %d %d %d %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"7a: %d %d %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"8: %d %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"9: %d %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"10: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* getelementptr inbounds (%struct.ty, %struct.ty* bitcast ({ i32, [4 x i8], { i32, [4 x i8] } }* @t1 to %struct.ty*), i32 0, i32 0), align 4
  %3 = load i32, i32* bitcast (%union.anon* getelementptr inbounds (%struct.ty, %struct.ty* bitcast ({ i32, [4 x i8], { i32, [4 x i8] } }* @t1 to %struct.ty*), i32 0, i32 1) to i32*), align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %3)
  %5 = load float, float* getelementptr inbounds (%struct.ty2, %struct.ty2* @t2, i32 0, i32 0), align 1
  %6 = fpext float %5 to double
  %7 = load i8, i8* getelementptr inbounds (%struct.ty2, %struct.ty2* @t2, i32 0, i32 1), align 1
  %8 = sext i8 %7 to i32
  %9 = load i32, i32* getelementptr inbounds (%struct.ty2, %struct.ty2* @t2, i32 0, i32 2), align 1
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), double %6, i32 %8, i32 %9)
  %11 = load i32, i32* getelementptr inbounds (%struct.ty3, %struct.ty3* bitcast ({ i32, [3 x i8] }* @t3 to %struct.ty3*), i32 0, i32 0), align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %11, i8* getelementptr inbounds (%struct.ty3, %struct.ty3* bitcast ({ i32, [3 x i8] }* @t3 to %struct.ty3*), i32 0, i32 1, i32 0))
  %13 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.ty4, %struct.ty4* @t4, i32 0, i32 0), align 1
  %14 = fptrunc x86_fp80 %13 to double
  %15 = load i8, i8* getelementptr inbounds (%struct.ty4, %struct.ty4* @t4, i32 0, i32 1), align 1
  %16 = sext i8 %15 to i32
  %17 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.ty4, %struct.ty4* @t4, i32 0, i32 2), align 1
  %18 = fptrunc x86_fp80 %17 to double
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), double %14, i32 %16, double %18)
  %20 = load i8, i8* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i8, i8, i8 }* @t5 to %struct.anon.1*), i32 0, i32 0), align 1
  %21 = sext i8 %20 to i32
  %22 = load i16, i16* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i8, i8, i8 }* @t5 to %struct.anon.1*), i32 0, i32 1), align 1
  %23 = and i16 %22, 15
  %24 = trunc i16 %23 to i8
  %25 = zext i8 %24 to i32
  %26 = load i16, i16* getelementptr inbounds (%struct.anon.1, %struct.anon.1* bitcast ({ i8, i8, i8 }* @t5 to %struct.anon.1*), i32 0, i32 1), align 1
  %27 = lshr i16 %26, 4
  %28 = and i16 %27, 127
  %29 = trunc i16 %28 to i8
  %30 = zext i8 %29 to i32
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0), i32 %21, i32 %25, i32 %30)
  %32 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @t5a, i32 0, i32 0), align 1
  %33 = sext i8 %32 to i32
  %34 = load i8, i8* getelementptr inbounds (%struct.anon, %struct.anon* @t5a, i32 0, i32 1), align 1
  %35 = and i8 %34, 15
  %36 = zext i8 %35 to i32
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 %33, i32 %36)
  %38 = load i8, i8* getelementptr inbounds (%struct.anon.0, %struct.anon.0* bitcast ({ i8, i8, i8 }* @t5b to %struct.anon.0*), i32 0, i32 0), align 1
  %39 = sext i8 %38 to i32
  %40 = load i16, i16* getelementptr inbounds (%struct.anon.0, %struct.anon.0* bitcast ({ i8, i8, i8 }* @t5b to %struct.anon.0*), i32 0, i32 1), align 1
  %41 = and i16 %40, 4095
  %42 = zext i16 %41 to i32
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0), i32 %39, i32 %42)
  %44 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.anon.2, %struct.anon.2* @t6, i32 0, i32 0), align 1
  %45 = load i8, i8* getelementptr inbounds (%struct.anon.2, %struct.anon.2* @t6, i32 0, i32 1), align 1
  %46 = and i8 %45, 15
  %47 = zext i8 %46 to i32
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), x86_fp80 %44, i32 %47)
  %49 = load i8, i8* getelementptr inbounds (%struct.anon.3, %struct.anon.3* bitcast ({ i8, i8, i8 }* @t7 to %struct.anon.3*), i32 0, i32 0), align 1
  %50 = sext i8 %49 to i32
  %51 = load i16, i16* getelementptr inbounds (%struct.anon.3, %struct.anon.3* bitcast ({ i8, i8, i8 }* @t7 to %struct.anon.3*), i32 0, i32 1), align 1
  %52 = and i16 %51, 15
  %53 = trunc i16 %52 to i8
  %54 = zext i8 %53 to i32
  %55 = load i16, i16* getelementptr inbounds (%struct.anon.3, %struct.anon.3* bitcast ({ i8, i8, i8 }* @t7 to %struct.anon.3*), i32 0, i32 1), align 1
  %56 = lshr i16 %55, 4
  %57 = and i16 %56, 7
  %58 = trunc i16 %57 to i8
  %59 = zext i8 %58 to i32
  %60 = load i16, i16* getelementptr inbounds (%struct.anon.3, %struct.anon.3* bitcast ({ i8, i8, i8 }* @t7 to %struct.anon.3*), i32 0, i32 1), align 1
  %61 = lshr i16 %60, 7
  %62 = and i16 %61, 127
  %63 = trunc i16 %62 to i8
  %64 = zext i8 %63 to i32
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i32 %50, i32 %54, i32 %59, i32 %64)
  %66 = load i8, i8* getelementptr inbounds (%struct.anon.4, %struct.anon.4* bitcast ({ i8, i8, i8 }* @t7a to %struct.anon.4*), i32 0, i32 0), align 1
  %67 = sext i8 %66 to i32
  %68 = load i16, i16* getelementptr inbounds (%struct.anon.4, %struct.anon.4* bitcast ({ i8, i8, i8 }* @t7a to %struct.anon.4*), i32 0, i32 1), align 1
  %69 = and i16 %68, 15
  %70 = zext i16 %69 to i32
  %71 = load i16, i16* getelementptr inbounds (%struct.anon.4, %struct.anon.4* bitcast ({ i8, i8, i8 }* @t7a to %struct.anon.4*), i32 0, i32 1), align 1
  %72 = lshr i16 %71, 4
  %73 = zext i16 %72 to i32
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i32 %67, i32 %70, i32 %73)
  %75 = load i8, i8* getelementptr inbounds (%struct.sDescrItem, %struct.sDescrItem* @t8, i32 0, i32 0), align 1
  %76 = sext i8 %75 to i32
  %77 = load i8, i8* getelementptr inbounds (%struct.sDescrItem, %struct.sDescrItem* @t8, i32 0, i32 2), align 1
  %78 = sext i8 %77 to i32
  %79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i32 0, i32 0), i32 %76, i32 %78)
  %80 = load i32, i32* getelementptr inbounds (%struct.resword, %struct.resword* bitcast ({ i32*, i8, i8, i8, i8 }* @t9 to %struct.resword*), i32 0, i32 1), align 8
  %81 = and i32 %80, 65535
  %82 = load i32, i32* getelementptr inbounds (%struct.resword, %struct.resword* bitcast ({ i32*, i8, i8, i8, i8 }* @t9 to %struct.resword*), i32 0, i32 1), align 8
  %83 = ashr i32 %82, 16
  %84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0), i32 %81, i32 %83)
  %85 = load i32*, i32** getelementptr inbounds (%struct.t10s, %struct.t10s* @t10, i32 0, i32 2), align 4
  %86 = load i32, i32* %85, align 4
  %87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i32 %86)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
