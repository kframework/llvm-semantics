; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.barstruct = type { i8* }

@x = common global %struct.barstruct zeroinitializer, align 8
@.str = private unnamed_addr constant [14 x i8] c"Everything OK\00", align 1

define void @foo() nounwind uwtable noinline {
entry:
  %0 = load i8** getelementptr inbounds (%struct.barstruct* @x, i64 0, i32 0), align 8, !tbaa !0
  %tobool = icmp eq i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @baz(i32 %b) nounwind uwtable {
entry:
  %bar.0.0 = alloca %struct.barstruct, align 8
  %tobool = icmp eq i32 %b, 0
  %x.bar.0 = select i1 %tobool, %struct.barstruct* @x, %struct.barstruct* %bar.0.0
  %some_string = getelementptr inbounds %struct.barstruct* %x.bar.0, i64 0, i32 0
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** %some_string, align 8, !tbaa !0
  call void @foo()
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** %some_string, align 8, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.barstruct* @x, i64 0, i32 0), align 8, !tbaa !0
  tail call void @foo() nounwind
  store i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.barstruct* @x, i64 0, i32 0), align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
