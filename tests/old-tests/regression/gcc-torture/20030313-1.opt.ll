; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030313-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i64, i64, i64, i64 }

@x = global %struct.A { i64 13, i64 14, i64 15, i64 16 }, align 8

define void @foo(i64* %x, i32 %y) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %y, 12
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i64* %x, align 8
  %cmp3 = icmp eq i64 %tmp2, 1
  br i1 %cmp3, label %lor.lhs.false, label %if.then8

lor.lhs.false:                                    ; preds = %if.end
  %arrayidx5 = getelementptr inbounds i64* %x, i64 1
  %tmp6 = load i64* %arrayidx5, align 8
  %cmp7 = icmp eq i64 %tmp6, 11
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %lor.lhs.false
  %arrayidx11 = getelementptr inbounds i64* %x, i64 2
  %tmp12 = load i64* %arrayidx11, align 8
  %cmp13 = icmp eq i64 %tmp12, 2
  br i1 %cmp13, label %lor.lhs.false14, label %if.then19

lor.lhs.false14:                                  ; preds = %if.end9
  %arrayidx16 = getelementptr inbounds i64* %x, i64 3
  %tmp17 = load i64* %arrayidx16, align 8
  %cmp18 = icmp eq i64 %tmp17, 12
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %lor.lhs.false14, %if.end9
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %lor.lhs.false14
  %arrayidx22 = getelementptr inbounds i64* %x, i64 4
  %tmp23 = load i64* %arrayidx22, align 8
  %cmp24 = icmp eq i64 %tmp23, 3
  br i1 %cmp24, label %lor.lhs.false25, label %if.then30

lor.lhs.false25:                                  ; preds = %if.end20
  %arrayidx27 = getelementptr inbounds i64* %x, i64 5
  %tmp28 = load i64* %arrayidx27, align 8
  %cmp29 = icmp eq i64 %tmp28, 13
  br i1 %cmp29, label %if.end31, label %if.then30

if.then30:                                        ; preds = %lor.lhs.false25, %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %lor.lhs.false25
  %arrayidx33 = getelementptr inbounds i64* %x, i64 6
  %tmp34 = load i64* %arrayidx33, align 8
  %cmp35 = icmp eq i64 %tmp34, 4
  br i1 %cmp35, label %lor.lhs.false36, label %if.then41

lor.lhs.false36:                                  ; preds = %if.end31
  %arrayidx38 = getelementptr inbounds i64* %x, i64 7
  %tmp39 = load i64* %arrayidx38, align 8
  %cmp40 = icmp eq i64 %tmp39, 14
  br i1 %cmp40, label %if.end42, label %if.then41

if.then41:                                        ; preds = %lor.lhs.false36, %if.end31
  tail call void @abort() noreturn nounwind
  unreachable

if.end42:                                         ; preds = %lor.lhs.false36
  %arrayidx44 = getelementptr inbounds i64* %x, i64 8
  %tmp45 = load i64* %arrayidx44, align 8
  %cmp46 = icmp eq i64 %tmp45, 5
  br i1 %cmp46, label %lor.lhs.false47, label %if.then52

lor.lhs.false47:                                  ; preds = %if.end42
  %arrayidx49 = getelementptr inbounds i64* %x, i64 9
  %tmp50 = load i64* %arrayidx49, align 8
  %cmp51 = icmp eq i64 %tmp50, 15
  br i1 %cmp51, label %if.end53, label %if.then52

if.then52:                                        ; preds = %lor.lhs.false47, %if.end42
  tail call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %lor.lhs.false47
  %arrayidx55 = getelementptr inbounds i64* %x, i64 10
  %tmp56 = load i64* %arrayidx55, align 8
  %cmp57 = icmp eq i64 %tmp56, 6
  br i1 %cmp57, label %lor.lhs.false58, label %if.then63

lor.lhs.false58:                                  ; preds = %if.end53
  %arrayidx60 = getelementptr inbounds i64* %x, i64 11
  %tmp61 = load i64* %arrayidx60, align 8
  %cmp62 = icmp eq i64 %tmp61, 16
  br i1 %cmp62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %lor.lhs.false58, %if.end53
  tail call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %lor.lhs.false58
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %a = alloca [40 x i64], align 16
  %arrayidx = getelementptr inbounds [40 x i64]* %a, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16
  %arrayidx4 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 1
  store i64 11, i64* %arrayidx4, align 8
  %arrayidx8 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 2
  store i64 2, i64* %arrayidx8, align 16
  %arrayidx12 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 3
  store i64 12, i64* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 4
  store i64 3, i64* %arrayidx16, align 16
  %tmp17 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 0), align 8
  %arrayidx21 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 5
  store i64 %tmp17, i64* %arrayidx21, align 8
  %arrayidx25 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 6
  store i64 4, i64* %arrayidx25, align 16
  %tmp27 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 1), align 8
  %arrayidx31 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 7
  store i64 %tmp27, i64* %arrayidx31, align 8
  %arrayidx35 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 8
  store i64 5, i64* %arrayidx35, align 16
  %tmp37 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 2), align 8
  %arrayidx41 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 9
  store i64 %tmp37, i64* %arrayidx41, align 8
  %arrayidx45 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 10
  store i64 6, i64* %arrayidx45, align 16
  %tmp47 = load i64* getelementptr inbounds (%struct.A* @x, i64 0, i32 3), align 8
  %arrayidx51 = getelementptr inbounds [40 x i64]* %a, i64 0, i64 11
  store i64 %tmp47, i64* %arrayidx51, align 8
  call void @foo(i64* %arrayidx, i32 12)
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
