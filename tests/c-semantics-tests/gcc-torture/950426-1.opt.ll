; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950426-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tag = type { i32, [5 x i8*] }

@s1 = common global %struct.tag zeroinitializer, align 8
@p1 = common global %struct.tag* null, align 8
@i = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"123\00", align 1

define i32 @main() noreturn nounwind uwtable {
if.then:
  store i32 -1, i32* getelementptr inbounds (%struct.tag* @s1, i64 0, i32 0), align 8, !tbaa !0
  store %struct.tag* @s1, %struct.tag** @p1, align 8, !tbaa !3
  store i32 3, i32* @i, align 4, !tbaa !0
  store i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 1), i8** getelementptr inbounds (%struct.tag* @s1, i64 0, i32 1, i64 3), align 8, !tbaa !3
  %call1 = tail call i64 @strlen(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)) nounwind readonly
  %cmp2 = icmp eq i64 %call1, 3
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.then
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.else4:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare i64 @strlen(i8* nocapture) nounwind readonly

declare void @exit(i32) noreturn nounwind

define i32 @func1(i32* nocapture %p) nounwind uwtable readonly {
entry:
  %0 = load i32* %p, align 4, !tbaa !0
  ret i32 %0
}

define void @foo(i8* nocapture %s) nounwind uwtable readnone {
entry:
  ret void
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
