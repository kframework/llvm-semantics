; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030914-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [16 x i32] }

define x86_fp80 @f(i32 %pa, %struct.s* nocapture byval align 8 %pb, x86_fp80 %pc) nounwind uwtable readonly {
entry:
  %arrayidx = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 0
  %0 = load i32* %arrayidx, align 8, !tbaa !0
  %conv = sitofp i32 %0 to x86_fp80
  %add = fadd x86_fp80 %conv, %pc
  %arrayidx.1 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 1
  %1 = load i32* %arrayidx.1, align 4, !tbaa !0
  %conv.1 = sitofp i32 %1 to x86_fp80
  %add.1 = fadd x86_fp80 %add, %conv.1
  %arrayidx.2 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 2
  %2 = load i32* %arrayidx.2, align 8, !tbaa !0
  %conv.2 = sitofp i32 %2 to x86_fp80
  %add.2 = fadd x86_fp80 %add.1, %conv.2
  %arrayidx.3 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 3
  %3 = load i32* %arrayidx.3, align 4, !tbaa !0
  %conv.3 = sitofp i32 %3 to x86_fp80
  %add.3 = fadd x86_fp80 %add.2, %conv.3
  %arrayidx.4 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 4
  %4 = load i32* %arrayidx.4, align 8, !tbaa !0
  %conv.4 = sitofp i32 %4 to x86_fp80
  %add.4 = fadd x86_fp80 %add.3, %conv.4
  %arrayidx.5 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 5
  %5 = load i32* %arrayidx.5, align 4, !tbaa !0
  %conv.5 = sitofp i32 %5 to x86_fp80
  %add.5 = fadd x86_fp80 %add.4, %conv.5
  %arrayidx.6 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 6
  %6 = load i32* %arrayidx.6, align 8, !tbaa !0
  %conv.6 = sitofp i32 %6 to x86_fp80
  %add.6 = fadd x86_fp80 %add.5, %conv.6
  %arrayidx.7 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 7
  %7 = load i32* %arrayidx.7, align 4, !tbaa !0
  %conv.7 = sitofp i32 %7 to x86_fp80
  %add.7 = fadd x86_fp80 %add.6, %conv.7
  %arrayidx.8 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 8
  %8 = load i32* %arrayidx.8, align 8, !tbaa !0
  %conv.8 = sitofp i32 %8 to x86_fp80
  %add.8 = fadd x86_fp80 %add.7, %conv.8
  %arrayidx.9 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 9
  %9 = load i32* %arrayidx.9, align 4, !tbaa !0
  %conv.9 = sitofp i32 %9 to x86_fp80
  %add.9 = fadd x86_fp80 %add.8, %conv.9
  %arrayidx.10 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 10
  %10 = load i32* %arrayidx.10, align 8, !tbaa !0
  %conv.10 = sitofp i32 %10 to x86_fp80
  %add.10 = fadd x86_fp80 %add.9, %conv.10
  %arrayidx.11 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 11
  %11 = load i32* %arrayidx.11, align 4, !tbaa !0
  %conv.11 = sitofp i32 %11 to x86_fp80
  %add.11 = fadd x86_fp80 %add.10, %conv.11
  %arrayidx.12 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 12
  %12 = load i32* %arrayidx.12, align 8, !tbaa !0
  %conv.12 = sitofp i32 %12 to x86_fp80
  %add.12 = fadd x86_fp80 %add.11, %conv.12
  %arrayidx.13 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 13
  %13 = load i32* %arrayidx.13, align 4, !tbaa !0
  %conv.13 = sitofp i32 %13 to x86_fp80
  %add.13 = fadd x86_fp80 %add.12, %conv.13
  %arrayidx.14 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 14
  %14 = load i32* %arrayidx.14, align 8, !tbaa !0
  %conv.14 = sitofp i32 %14 to x86_fp80
  %add.14 = fadd x86_fp80 %add.13, %conv.14
  %arrayidx.15 = getelementptr inbounds %struct.s* %pb, i64 0, i32 0, i64 15
  %15 = load i32* %arrayidx.15, align 4, !tbaa !0
  %conv.15 = sitofp i32 %15 to x86_fp80
  %add.15 = fadd x86_fp80 %add.14, %conv.15
  ret x86_fp80 %add.15
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
