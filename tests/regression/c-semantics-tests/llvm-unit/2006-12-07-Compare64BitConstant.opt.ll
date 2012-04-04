; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2006-12-07-Compare64BitConstant.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@Large = global i64 1407374883553280, align 8
@str = private unnamed_addr constant [7 x i8] c"Works.\00"
@str2 = private unnamed_addr constant [9 x i8] c"Doesn't.\00"

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load i64* @Large, align 8, !tbaa !0
  %and = and i64 %0, 1970324836974592
  %cmp = icmp eq i64 %and, 1407374883553280
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str2, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
