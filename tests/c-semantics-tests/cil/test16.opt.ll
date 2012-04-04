; ModuleID = '/home/david/src/c-semantics/tests/cil/test16.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.zz = type { i32, i32 }

@x = common global %struct.zz zeroinitializer, align 4
@.str = private unnamed_addr constant [39 x i8] c"hello world - x.a is %d and x.b is %d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 2, i32* getelementptr inbounds (%struct.zz* @x, i64 0, i32 1), align 4, !tbaa !0
  store i32 2, i32* getelementptr inbounds (%struct.zz* @x, i64 0, i32 0), align 4, !tbaa !0
  %tobool = icmp eq i32 %argc, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 4, i32* getelementptr inbounds (%struct.zz* @x, i64 0, i32 1), align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %0 = phi i32 [ 2, %entry ], [ 4, %if.then ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i64 0, i64 0), i32 2, i32 %0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
