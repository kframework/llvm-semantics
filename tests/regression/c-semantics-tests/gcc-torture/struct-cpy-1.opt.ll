; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-cpy-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tty_driver = type { [38 x i8], %struct.termios, [4 x i8] }
%struct.termios = type { i32, i32, i32, i32, [28 x i8] }

@pty = internal unnamed_addr global %struct.tty_driver zeroinitializer, align 8

define void @ini() nounwind uwtable {
entry:
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.termios* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1) to i8*), i8 0, i64 44, i32 8, i1 false)
  store i32 1, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 0), align 8, !tbaa !0
  store i32 2, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 1), align 4, !tbaa !0
  store i32 3, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 2), align 8, !tbaa !0
  store i32 4, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 3), align 4, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.termios* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1) to i8*), i8 0, i64 44, i32 8, i1 false) nounwind
  store i32 1, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 0), align 8, !tbaa !0
  store i32 2, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 1), align 4, !tbaa !0
  store i32 3, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 2), align 8, !tbaa !0
  store i32 4, i32* getelementptr inbounds (%struct.tty_driver* @pty, i64 0, i32 1, i32 3), align 4, !tbaa !0
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
