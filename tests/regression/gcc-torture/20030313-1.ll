; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030313-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i64, i64, i64, i64 }

@x = global %struct.A { i64 13, i64 14, i64 15, i64 16 }, align 8

define void @foo(i64* %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i64*, align 8
  %y.addr = alloca i32, align 4
  store i64* %x, i64** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %y.addr, align 4
  %cmp = icmp ne i32 %tmp, 12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i64** %x.addr, align 8
  %arrayidx = getelementptr inbounds i64* %tmp1, i64 0
  %tmp2 = load i64* %arrayidx
  %cmp3 = icmp ne i64 %tmp2, 1
  br i1 %cmp3, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %tmp4 = load i64** %x.addr, align 8
  %arrayidx5 = getelementptr inbounds i64* %tmp4, i64 1
  %tmp6 = load i64* %arrayidx5
  %cmp7 = icmp ne i64 %tmp6, 11
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %lor.lhs.false
  %tmp10 = load i64** %x.addr, align 8
  %arrayidx11 = getelementptr inbounds i64* %tmp10, i64 2
  %tmp12 = load i64* %arrayidx11
  %cmp13 = icmp ne i64 %tmp12, 2
  br i1 %cmp13, label %if.then19, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %if.end9
  %tmp15 = load i64** %x.addr, align 8
  %arrayidx16 = getelementptr inbounds i64* %tmp15, i64 3
  %tmp17 = load i64* %arrayidx16
  %cmp18 = icmp ne i64 %tmp17, 12
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %lor.lhs.false14, %if.end9
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %lor.lhs.false14
  %tmp21 = load i64** %x.addr, align 8
  %arrayidx22 = getelementptr inbounds i64* %tmp21, i64 4
  %tmp23 = load i64* %arrayidx22
  %cmp24 = icmp ne i64 %tmp23, 3
  br i1 %cmp24, label %if.then30, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.end20
  %tmp26 = load i64** %x.addr, align 8
  %arrayidx27 = getelementptr inbounds i64* %tmp26, i64 5
  %tmp28 = load i64* %arrayidx27
  %cmp29 = icmp ne i64 %tmp28, 13
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %lor.lhs.false25, %if.end20
  call void @abort() noreturn
  unreachable

if.end31:                                         ; preds = %lor.lhs.false25
  %tmp32 = load i64** %x.addr, align 8
  %arrayidx33 = getelementptr inbounds i64* %tmp32, i64 6
  %tmp34 = load i64* %arrayidx33
  %cmp35 = icmp ne i64 %tmp34, 4
  br i1 %cmp35, label %if.then41, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %if.end31
  %tmp37 = load i64** %x.addr, align 8
  %arrayidx38 = getelementptr inbounds i64* %tmp37, i64 7
  %tmp39 = load i64* %arrayidx38
  %cmp40 = icmp ne i64 %tmp39, 14
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %lor.lhs.false36, %if.end31
  call void @abort() noreturn
  unreachable

if.end42:                                         ; preds = %lor.lhs.false36
  %tmp43 = load i64** %x.addr, align 8
  %arrayidx44 = getelementptr inbounds i64* %tmp43, i64 8
  %tmp45 = load i64* %arrayidx44
  %cmp46 = icmp ne i64 %tmp45, 5
  br i1 %cmp46, label %if.then52, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %if.end42
  %tmp48 = load i64** %x.addr, align 8
  %arrayidx49 = getelementptr inbounds i64* %tmp48, i64 9
  %tmp50 = load i64* %arrayidx49
  %cmp51 = icmp ne i64 %tmp50, 15
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %lor.lhs.false47, %if.end42
  call void @abort() noreturn
  unreachable

if.end53:                                         ; preds = %lor.lhs.false47
  %tmp54 = load i64** %x.addr, align 8
  %arrayidx55 = getelementptr inbounds i64* %tmp54, i64 10
  %tmp56 = load i64* %arrayidx55
  %cmp57 = icmp ne i64 %tmp56, 6
  br i1 %cmp57, label %if.then63, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %if.end53
  %tmp59 = load i64** %x.addr, align 8
  %arrayidx60 = getelementptr inbounds i64* %tmp59, i64 11
  %tmp61 = load i64* %arrayidx60
  %cmp62 = icmp ne i64 %tmp61, 16
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %lor.lhs.false58, %if.end53
  call void @abort() noreturn
  unreachable

if.end64:                                         ; preds = %lor.lhs.false58
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [40 x i64], align 16
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %b, align 4
  %tmp = load i32* %b, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* %b, align 4
  %idxprom = sext i32 %tmp to i64
  %arrayidx = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx, align 8
  %tmp1 = load i32* %b, align 4
  %inc2 = add nsw i32 %tmp1, 1
  store i32 %inc2, i32* %b, align 4
  %idxprom3 = sext i32 %tmp1 to i64
  %arrayidx4 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom3
  store i64 11, i64* %arrayidx4, align 8
  %tmp5 = load i32* %b, align 4
  %inc6 = add nsw i32 %tmp5, 1
  store i32 %inc6, i32* %b, align 4
  %idxprom7 = sext i32 %tmp5 to i64
  %arrayidx8 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom7
  store i64 2, i64* %arrayidx8, align 8
  %tmp9 = load i32* %b, align 4
  %inc10 = add nsw i32 %tmp9, 1
  store i32 %inc10, i32* %b, align 4
  %idxprom11 = sext i32 %tmp9 to i64
  %arrayidx12 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom11
  store i64 12, i64* %arrayidx12, align 8
  %tmp13 = load i32* %b, align 4
  %inc14 = add nsw i32 %tmp13, 1
  store i32 %inc14, i32* %b, align 4
  %idxprom15 = sext i32 %tmp13 to i64
  %arrayidx16 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom15
  store i64 3, i64* %arrayidx16, align 8
  %call = call %struct.A* @bar()
  %p = getelementptr inbounds %struct.A* %call, i32 0, i32 0
  %tmp17 = load i64* %p, align 8
  %tmp18 = load i32* %b, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %b, align 4
  %idxprom20 = sext i32 %tmp18 to i64
  %arrayidx21 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom20
  store i64 %tmp17, i64* %arrayidx21, align 8
  %tmp22 = load i32* %b, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %b, align 4
  %idxprom24 = sext i32 %tmp22 to i64
  %arrayidx25 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom24
  store i64 4, i64* %arrayidx25, align 8
  %call26 = call %struct.A* @bar()
  %q = getelementptr inbounds %struct.A* %call26, i32 0, i32 1
  %tmp27 = load i64* %q, align 8
  %tmp28 = load i32* %b, align 4
  %inc29 = add nsw i32 %tmp28, 1
  store i32 %inc29, i32* %b, align 4
  %idxprom30 = sext i32 %tmp28 to i64
  %arrayidx31 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom30
  store i64 %tmp27, i64* %arrayidx31, align 8
  %tmp32 = load i32* %b, align 4
  %inc33 = add nsw i32 %tmp32, 1
  store i32 %inc33, i32* %b, align 4
  %idxprom34 = sext i32 %tmp32 to i64
  %arrayidx35 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom34
  store i64 5, i64* %arrayidx35, align 8
  %call36 = call %struct.A* @bar()
  %r = getelementptr inbounds %struct.A* %call36, i32 0, i32 2
  %tmp37 = load i64* %r, align 8
  %tmp38 = load i32* %b, align 4
  %inc39 = add nsw i32 %tmp38, 1
  store i32 %inc39, i32* %b, align 4
  %idxprom40 = sext i32 %tmp38 to i64
  %arrayidx41 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom40
  store i64 %tmp37, i64* %arrayidx41, align 8
  %tmp42 = load i32* %b, align 4
  %inc43 = add nsw i32 %tmp42, 1
  store i32 %inc43, i32* %b, align 4
  %idxprom44 = sext i32 %tmp42 to i64
  %arrayidx45 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom44
  store i64 6, i64* %arrayidx45, align 8
  %call46 = call %struct.A* @bar()
  %s = getelementptr inbounds %struct.A* %call46, i32 0, i32 3
  %tmp47 = load i64* %s, align 8
  %tmp48 = load i32* %b, align 4
  %inc49 = add nsw i32 %tmp48, 1
  store i32 %inc49, i32* %b, align 4
  %idxprom50 = sext i32 %tmp48 to i64
  %arrayidx51 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom50
  store i64 %tmp47, i64* %arrayidx51, align 8
  %arraydecay = getelementptr inbounds [40 x i64]* %a, i32 0, i32 0
  %tmp52 = load i32* %b, align 4
  call void @foo(i64* %arraydecay, i32 %tmp52)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal %struct.A* @bar() nounwind uwtable inlinehint {
entry:
  %r = alloca %struct.A*, align 8
  store %struct.A* @x, %struct.A** %r, align 8
  %tmp = load %struct.A** %r, align 8
  ret %struct.A* %tmp
}

declare void @exit(i32) noreturn
