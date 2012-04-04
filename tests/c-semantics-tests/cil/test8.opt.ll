; ModuleID = '/home/david/src/c-semantics/tests/cil/test8.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@y = common global i8 0, align 1
@x = common global i32 0, align 4
@.str = private unnamed_addr constant [23 x i8] c"hello world - x is %d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i8 7, i8* @y, align 1, !tbaa !0
  %tobool = icmp eq i32 %argc, 0
  %. = select i1 %tobool, i32 -7, i32 7
  store i32 %., i32* @x, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 %.) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
