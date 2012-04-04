; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-02-CastTest3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"s1   = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"us2  = %u\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %argc, 2
  %0 = trunc i32 %argc to i16
  %conv = select i1 %cmp, i16 %0, i16 -769
  %conv1 = sext i16 %conv to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %conv1) nounwind
  %conv2 = zext i16 %conv to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %conv2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
