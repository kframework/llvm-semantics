; ModuleID = '/home/david/src/c-semantics/tests/cil/test11.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@y = common global i8 0, align 1
@x = common global i32 0, align 4
@z = common global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [23 x i8] c"hello world - x is %d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i8 7, i8* @y, align 1, !tbaa !0
  store i32 -7, i32* @x, align 4, !tbaa !2
  %0 = load double* @z, align 8, !tbaa !3
  %tobool = fcmp une double %0, 0.000000e+00
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 7, i32* @x, align 4, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = phi i32 [ 7, %if.then ], [ -7, %entry ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 %1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"double", metadata !0}
