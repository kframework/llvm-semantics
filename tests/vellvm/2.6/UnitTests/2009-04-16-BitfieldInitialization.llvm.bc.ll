; ModuleID = '2009-04-16-BitfieldInitialization.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, [3 x i8] }
%1 = type { i8, i8, i8 }
%2 = type { i8, i8 }
%3 = type { i32*, i8, i8, i8, i8 }
%4 = type { [4 x i8], i32* }
%5 = type <{ i8, i8, i8 }>
%6 = type <{ i8, i8 }>
%7 = type <{ i8, i16 }>
%struct.anon = type { i32 }
%struct.resword = type { i32*, i16, i16 }
%struct.sDescrItem = type { i8, i8*, i8 }
%struct.t10s = type { i16, i32* }
%struct.ty = type { i32, %struct.anon }
%struct.ty2 = type <{ float, i8, i32 }>
%struct.ty3 = type { i32, [0 x i8] }
%struct.ty4 = type <{ x86_fp80, i8, x86_fp80 }>

@.str = private constant [11 x i8] c"1: %d, %d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str1 = private constant [15 x i8] c"2: %f, %d, %d\0A\00", align 1 ; <[15 x i8]*> [#uses=1]
@t3 = internal global %0 { i32 4, [3 x i8] c"fo\00" } ; <%0*> [#uses=1]
@.str2 = private constant [10 x i8] c"3: %d %s\0A\00", align 1 ; <[10 x i8]*> [#uses=1]
@.str3 = private constant [13 x i8] c"4: %f %d %f\0A\00", align 1 ; <[13 x i8]*> [#uses=1]
@t5 = internal constant %1 { i8 101, i8 15, i8 123 } ; <%1*> [#uses=1]
@.str4 = private constant [13 x i8] c"5: %d %d %d\0A\00", align 1 ; <[13 x i8]*> [#uses=1]
@t5a = internal constant %2 { i8 101, i8 15 }     ; <%2*> [#uses=1]
@.str5 = private constant [11 x i8] c"5a: %d %d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@t5b = internal constant %1 { i8 101, i8 -49, i8 4 } ; <%1*> [#uses=1]
@.str6 = private constant [11 x i8] c"5b: %d %d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str7 = private constant [11 x i8] c"6: %Lf %d\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@t7 = internal constant %1 { i8 101, i8 63, i8 0 } ; <%1*> [#uses=1]
@.str8 = private constant [16 x i8] c"7: %d %d %d %d\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@t7a = internal constant %1 { i8 101, i8 -65, i8 7 } ; <%1*> [#uses=1]
@.str9 = private constant [14 x i8] c"7a: %d %d %d\0A\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str10 = private constant [10 x i8] c"8: %d %d\0A\00", align 1 ; <[10 x i8]*> [#uses=1]
@t9 = internal constant %3 { i32* null, i8 123, i8 0, i8 -56, i8 1 } ; <%3*> [#uses=1]
@.str11 = private constant [10 x i8] c"9: %d %d\0A\00", align 1 ; <[10 x i8]*> [#uses=1]
@x = internal global i32 42                       ; <i32*> [#uses=1]
@t10 = internal constant %4 { [4 x i8] zeroinitializer, i32* @x } ; <%4*> [#uses=1]
@.str12 = private constant [8 x i8] c"10: %d\0A\00", align 1 ; <[8 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 101, i32 1) nounwind ; <i32> [#uses=0]
  %1 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), double 1.010000e+02, i32 1, i32 204) nounwind ; <i32> [#uses=0]
  %2 = load i32* getelementptr (%struct.ty3* bitcast (%0* @t3 to %struct.ty3*), i32 0, i32 0), align 8 ; <i32> [#uses=1]
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %2, i8* getelementptr ([0 x i8]* bitcast (i32* getelementptr (%struct.ty3* bitcast (%0* @t3 to %struct.ty3*), i32 1, i32 0) to [0 x i8]*), i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %4 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), double 1.000000e+00, i32 4, double 1.700000e+01) nounwind ; <i32> [#uses=0]
  %5 = load i8* getelementptr (%5* bitcast (%1* @t5 to %5*), i32 0, i32 2), align 2 ; <i8> [#uses=1]
  %6 = and i8 %5, 127                             ; <i8> [#uses=1]
  %7 = zext i8 %6 to i32                          ; <i32> [#uses=1]
  %8 = load i8* getelementptr (%5* bitcast (%1* @t5 to %5*), i32 0, i32 1), align 1 ; <i8> [#uses=1]
  %9 = and i8 %8, 15                              ; <i8> [#uses=1]
  %10 = zext i8 %9 to i32                         ; <i32> [#uses=1]
  %11 = load i8* getelementptr (%5* bitcast (%1* @t5 to %5*), i32 0, i32 0), align 8 ; <i8> [#uses=1]
  %12 = sext i8 %11 to i32                        ; <i32> [#uses=1]
  %13 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0), i32 %12, i32 %10, i32 %7) nounwind ; <i32> [#uses=0]
  %14 = load i8* getelementptr (%6* bitcast (%2* @t5a to %6*), i32 0, i32 1), align 1 ; <i8> [#uses=1]
  %15 = and i8 %14, 15                            ; <i8> [#uses=1]
  %16 = zext i8 %15 to i32                        ; <i32> [#uses=1]
  %17 = load i8* getelementptr (%6* bitcast (%2* @t5a to %6*), i32 0, i32 0), align 8 ; <i8> [#uses=1]
  %18 = sext i8 %17 to i32                        ; <i32> [#uses=1]
  %19 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i32 %18, i32 %16) nounwind ; <i32> [#uses=0]
  %20 = load i16* getelementptr (%7* bitcast (%1* @t5b to %7*), i32 0, i32 1), align 1 ; <i16> [#uses=1]
  %21 = and i16 %20, 4095                         ; <i16> [#uses=1]
  %22 = zext i16 %21 to i32                       ; <i32> [#uses=1]
  %23 = load i8* getelementptr (%7* bitcast (%1* @t5b to %7*), i32 0, i32 0), align 8 ; <i8> [#uses=1]
  %24 = sext i8 %23 to i32                        ; <i32> [#uses=1]
  %25 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0), i32 %24, i32 %22) nounwind ; <i32> [#uses=0]
  %26 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0), x86_fp80 0xK4005F6D2F1A9FBE77000, i32 5) nounwind ; <i32> [#uses=0]
  %27 = load i8* getelementptr (%5* bitcast (%1* @t7 to %5*), i32 0, i32 2), align 2 ; <i8> [#uses=1]
  %28 = and i8 %27, 127                           ; <i8> [#uses=1]
  %29 = zext i8 %28 to i32                        ; <i32> [#uses=1]
  %30 = load i8* getelementptr (%5* bitcast (%1* @t7 to %5*), i32 0, i32 1), align 1 ; <i8> [#uses=2]
  %31 = lshr i8 %30, 4                            ; <i8> [#uses=1]
  %32 = and i8 %31, 7                             ; <i8> [#uses=1]
  %33 = zext i8 %32 to i32                        ; <i32> [#uses=1]
  %34 = and i8 %30, 15                            ; <i8> [#uses=1]
  %35 = zext i8 %34 to i32                        ; <i32> [#uses=1]
  %36 = load i8* getelementptr (%5* bitcast (%1* @t7 to %5*), i32 0, i32 0), align 8 ; <i8> [#uses=1]
  %37 = sext i8 %36 to i32                        ; <i32> [#uses=1]
  %38 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str8, i32 0, i32 0), i32 %37, i32 %35, i32 %33, i32 %29) nounwind ; <i32> [#uses=0]
  %39 = load i16* getelementptr (%7* bitcast (%1* @t7a to %7*), i32 0, i32 1), align 1 ; <i16> [#uses=2]
  %40 = lshr i16 %39, 4                           ; <i16> [#uses=1]
  %41 = zext i16 %40 to i32                       ; <i32> [#uses=1]
  %42 = and i16 %39, 15                           ; <i16> [#uses=1]
  %43 = zext i16 %42 to i32                       ; <i32> [#uses=1]
  %44 = load i8* getelementptr (%7* bitcast (%1* @t7a to %7*), i32 0, i32 0), align 8 ; <i8> [#uses=1]
  %45 = sext i8 %44 to i32                        ; <i32> [#uses=1]
  %46 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([14 x i8]* @.str9, i32 0, i32 0), i32 %45, i32 %43, i32 %41) nounwind ; <i32> [#uses=0]
  %47 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([10 x i8]* @.str10, i32 0, i32 0), i32 16, i32 32) nounwind ; <i32> [#uses=0]
  %48 = load i32* bitcast (i16* getelementptr (%struct.resword* bitcast (%3* @t9 to %struct.resword*), i32 0, i32 1) to i32*), align 4 ; <i32> [#uses=1]
  %49 = lshr i32 %48, 16                          ; <i32> [#uses=1]
  %50 = trunc i32 %49 to i16                      ; <i16> [#uses=1]
  %51 = sext i16 %50 to i32                       ; <i32> [#uses=1]
  %52 = load i16* getelementptr (%struct.resword* bitcast (%3* @t9 to %struct.resword*), i32 0, i32 1), align 4 ; <i16> [#uses=1]
  %53 = zext i16 %52 to i32                       ; <i32> [#uses=1]
  %54 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([10 x i8]* @.str11, i32 0, i32 0), i32 %53, i32 %51) nounwind ; <i32> [#uses=0]
  %55 = load i32** getelementptr (%struct.t10s* bitcast (%4* @t10 to %struct.t10s*), i32 0, i32 1), align 4 ; <i32*> [#uses=1]
  %56 = load i32* %55, align 4                    ; <i32> [#uses=1]
  %57 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str12, i32 0, i32 0), i32 %56) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
