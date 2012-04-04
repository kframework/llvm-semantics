; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980612-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fd = type { i8, i8 }

@f = global %struct.fd { i8 5, i8 0 }, align 1

define %struct.fd* @g() nounwind uwtable readnone {
entry:
  ret %struct.fd* @f
}

define i32 @h() nounwind uwtable readnone {
entry:
  ret i32 -1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i8 -1, i8* getelementptr inbounds (%struct.fd* @f, i64 0, i32 1), align 1, !tbaa !0
  %0 = load i8* getelementptr inbounds (%struct.fd* @f, i64 0, i32 0), align 1, !tbaa !0
  %conv2 = zext i8 %0 to i32
  %and3 = and i32 %conv2, 111
  %cmp = icmp ult i32 %and3, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
