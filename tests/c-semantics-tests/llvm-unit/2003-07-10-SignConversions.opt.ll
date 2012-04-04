; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-07-10-SignConversions.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [39 x i8] c"%d %d --> unsigned: us = %d, us2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [39 x i8] c"%d %d -->   signed:  s = %d,  s2 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [39 x i8] c"%d %d --> unsigned: uc = %d, uc2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [39 x i8] c"%d %d -->   signed:  c = %d,  c2 = %d\0A\00", align 1

define zeroext i8 @getUC() nounwind uwtable readnone {
entry:
  ret i8 -128
}

define signext i8 @getC() nounwind uwtable readnone {
entry:
  ret i8 -128
}

define i32 @main() nounwind uwtable {
entry:
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i64 0, i64 0), i32 -128, i32 128, i32 65408, i32 128) nounwind
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str1, i64 0, i64 0), i32 -128, i32 128, i32 -128, i32 128) nounwind
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i64 0, i64 0), i32 -128, i32 128, i32 128, i32 128) nounwind
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i64 0, i64 0), i32 -128, i32 128, i32 -128, i32 -128) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
