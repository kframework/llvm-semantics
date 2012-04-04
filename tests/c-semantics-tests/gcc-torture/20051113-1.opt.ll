; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Struct3 = type <{ i32, [0 x %union.Union] }>
%union.Union = type { %struct.Struct2 }
%struct.Struct2 = type <{ i16, i16, i16, i64, i64, i64 }>

define i64 @Sum(%struct.Struct3* nocapture %instrs) nounwind uwtable readonly noinline {
entry:
  %Count = getelementptr inbounds %struct.Struct3* %instrs, i64 0, i32 0
  %0 = load i32* %Count, align 1, !tbaa !0
  %cmp2 = icmp sgt i32 %0, 0
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %count.03 = phi i64 [ %add, %for.body ], [ 0, %entry ]
  %1 = getelementptr inbounds %struct.Struct3* %instrs, i64 0, i32 1, i64 %indvars.iv, i32 0, i32 3
  %2 = load i64* %1, align 1, !tbaa !3
  %add = add i64 %2, %count.03
  %indvars.iv.next = add i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %3, %0
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %count.0.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  ret i64 %count.0.lcssa
}

define i64 @Sum2(%struct.Struct3* nocapture %instrs) nounwind uwtable readonly noinline {
entry:
  %Count = getelementptr inbounds %struct.Struct3* %instrs, i64 0, i32 0
  %0 = load i32* %Count, align 1, !tbaa !0
  %cmp1 = icmp sgt i32 %0, 0
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %count.02 = phi i64 [ %add, %for.body ], [ 0, %entry ]
  %1 = getelementptr inbounds %struct.Struct3* %instrs, i64 0, i32 1, i64 %indvars.iv, i32 0, i32 4
  %2 = load i64* %1, align 1, !tbaa !3
  %add = add nsw i64 %2, %count.02
  %indvars.iv.next = add i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %3, %0
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %count.0.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  ret i64 %count.0.lcssa
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 94) nounwind
  %0 = bitcast i8* %call to %struct.Struct3*
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 94, i32 1, i1 false)
  %Count = bitcast i8* %call to i32*
  store i32 3, i32* %Count, align 1, !tbaa !0
  %Count1 = getelementptr inbounds i8* %call, i64 10
  %1 = bitcast i8* %Count1 to i64*
  store i64 555, i64* %1, align 1, !tbaa !3
  %Count5 = getelementptr inbounds i8* %call, i64 40
  %2 = bitcast i8* %Count5 to i64*
  store i64 999, i64* %2, align 1, !tbaa !3
  %Count9 = getelementptr inbounds i8* %call, i64 70
  %3 = bitcast i8* %Count9 to i64*
  store i64 4311810305, i64* %3, align 1, !tbaa !3
  %Count2 = getelementptr inbounds i8* %call, i64 18
  %4 = bitcast i8* %Count2 to i64*
  store i64 555, i64* %4, align 1, !tbaa !3
  %Count216 = getelementptr inbounds i8* %call, i64 48
  %5 = bitcast i8* %Count216 to i64*
  store i64 999, i64* %5, align 1, !tbaa !3
  %Count220 = getelementptr inbounds i8* %call, i64 78
  %6 = bitcast i8* %Count220 to i64*
  store i64 4311810305, i64* %6, align 1, !tbaa !3
  %call21 = tail call i64 @Sum(%struct.Struct3* %0)
  %cmp = icmp eq i64 %call21, 4311811859
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call22 = tail call i64 @Sum2(%struct.Struct3* %0)
  %cmp23 = icmp eq i64 %call22, 4311811859
  br i1 %cmp23, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long long", metadata !1}
