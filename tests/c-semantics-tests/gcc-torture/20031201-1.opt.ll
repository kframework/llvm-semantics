; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.io = type { %struct.s1, %struct.s2 }
%struct.s1 = type { [2 x i8], [2 x i8] }
%struct.s2 = type { [2 x i8], [2 x i8] }

@i = internal unnamed_addr global %struct.io* null, align 8
@f0.washere = internal unnamed_addr global i32 0, align 4

define i32 @f1(i8* %port) noreturn nounwind uwtable noinline {
entry:
  %0 = bitcast i8* %port to %struct.io*
  store %struct.io* %0, %struct.io** @i, align 8, !tbaa !0
  %1 = bitcast i8* %port to i32*
  store i32 32, i32* %1, align 4
  %2 = load %struct.io** @i, align 8, !tbaa !0
  %i16 = getelementptr inbounds %struct.io* %2, i64 0, i32 1
  %3 = bitcast %struct.s2* %i16 to i32*
  store i32 32, i32* %3, align 4
  tail call void @f0()
  %4 = load %struct.io** @i, align 8, !tbaa !0
  %5 = bitcast %struct.io* %4 to i32*
  store i32 8, i32* %5, align 4
  %6 = load %struct.io** @i, align 8, !tbaa !0
  %i162 = getelementptr inbounds %struct.io* %6, i64 0, i32 1
  %7 = bitcast %struct.s2* %i162 to i32*
  store i32 8, i32* %7, align 4
  tail call void @test()
  unreachable
}

define void @f0() nounwind uwtable noinline {
entry:
  %0 = load %struct.io** @i, align 8, !tbaa !0
  %1 = load i32* @f0.washere, align 4, !tbaa !3
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @f0.washere, align 4, !tbaa !3
  %tobool = icmp eq i32 %1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = bitcast %struct.io* %0 to i32*
  %3 = load i32* %2, align 4
  %bf.clear = and i32 %3, 65535
  %cmp = icmp eq i32 %bf.clear, 32
  br i1 %cmp, label %lor.lhs.false1, label %if.then

lor.lhs.false1:                                   ; preds = %lor.lhs.false
  %i16 = getelementptr inbounds %struct.io* %0, i64 0, i32 1
  %4 = bitcast %struct.s2* %i16 to i32*
  %5 = load i32* %4, align 4
  %bf.clear2 = and i32 %5, 65535
  %cmp3 = icmp eq i32 %bf.clear2, 32
  br i1 %cmp3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false1, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false1
  ret void
}

define void @test() noreturn nounwind uwtable noinline {
entry:
  %0 = load %struct.io** @i, align 8, !tbaa !0
  %1 = bitcast %struct.io* %0 to i32*
  %2 = load i32* %1, align 4
  %bf.clear = and i32 %2, 65535
  %cmp = icmp eq i32 %bf.clear, 8
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %i16 = getelementptr inbounds %struct.io* %0, i64 0, i32 1
  %3 = bitcast %struct.s2* %i16 to i32*
  %4 = load i32* %3, align 4
  %bf.clear1 = and i32 %4, 65535
  %cmp2 = icmp eq i32 %bf.clear1, 8
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %io01 = alloca [8 x i8], align 4
  %io01.sub = getelementptr inbounds [8 x i8]* %io01, i64 0, i64 0
  %call = call i32 @f1(i8* %io01.sub)
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
