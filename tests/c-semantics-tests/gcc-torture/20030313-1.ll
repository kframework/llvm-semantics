; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030313-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i64, i64, i64, i64 }

@x = global %struct.A { i64 13, i64 14, i64 15, i64 16 }, align 8

define void @foo(i64* %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i64*, align 8
  %y.addr = alloca i32, align 4
  store i64* %x, i64** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %y.addr, align 4
  %cmp = icmp ne i32 %0, 12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i64** %x.addr, align 8
  %arrayidx = getelementptr inbounds i64* %1, i64 0
  %2 = load i64* %arrayidx, align 8
  %cmp1 = icmp ne i64 %2, 1
  br i1 %cmp1, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %3 = load i64** %x.addr, align 8
  %arrayidx2 = getelementptr inbounds i64* %3, i64 1
  %4 = load i64* %arrayidx2, align 8
  %cmp3 = icmp ne i64 %4, 11
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn
  unreachable

if.end5:                                          ; preds = %lor.lhs.false
  %5 = load i64** %x.addr, align 8
  %arrayidx6 = getelementptr inbounds i64* %5, i64 2
  %6 = load i64* %arrayidx6, align 8
  %cmp7 = icmp ne i64 %6, 2
  br i1 %cmp7, label %if.then11, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %if.end5
  %7 = load i64** %x.addr, align 8
  %arrayidx9 = getelementptr inbounds i64* %7, i64 3
  %8 = load i64* %arrayidx9, align 8
  %cmp10 = icmp ne i64 %8, 12
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %lor.lhs.false8, %if.end5
  call void @abort() noreturn
  unreachable

if.end12:                                         ; preds = %lor.lhs.false8
  %9 = load i64** %x.addr, align 8
  %arrayidx13 = getelementptr inbounds i64* %9, i64 4
  %10 = load i64* %arrayidx13, align 8
  %cmp14 = icmp ne i64 %10, 3
  br i1 %cmp14, label %if.then18, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.end12
  %11 = load i64** %x.addr, align 8
  %arrayidx16 = getelementptr inbounds i64* %11, i64 5
  %12 = load i64* %arrayidx16, align 8
  %cmp17 = icmp ne i64 %12, 13
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false15, %if.end12
  call void @abort() noreturn
  unreachable

if.end19:                                         ; preds = %lor.lhs.false15
  %13 = load i64** %x.addr, align 8
  %arrayidx20 = getelementptr inbounds i64* %13, i64 6
  %14 = load i64* %arrayidx20, align 8
  %cmp21 = icmp ne i64 %14, 4
  br i1 %cmp21, label %if.then25, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %if.end19
  %15 = load i64** %x.addr, align 8
  %arrayidx23 = getelementptr inbounds i64* %15, i64 7
  %16 = load i64* %arrayidx23, align 8
  %cmp24 = icmp ne i64 %16, 14
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %lor.lhs.false22, %if.end19
  call void @abort() noreturn
  unreachable

if.end26:                                         ; preds = %lor.lhs.false22
  %17 = load i64** %x.addr, align 8
  %arrayidx27 = getelementptr inbounds i64* %17, i64 8
  %18 = load i64* %arrayidx27, align 8
  %cmp28 = icmp ne i64 %18, 5
  br i1 %cmp28, label %if.then32, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %if.end26
  %19 = load i64** %x.addr, align 8
  %arrayidx30 = getelementptr inbounds i64* %19, i64 9
  %20 = load i64* %arrayidx30, align 8
  %cmp31 = icmp ne i64 %20, 15
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %lor.lhs.false29, %if.end26
  call void @abort() noreturn
  unreachable

if.end33:                                         ; preds = %lor.lhs.false29
  %21 = load i64** %x.addr, align 8
  %arrayidx34 = getelementptr inbounds i64* %21, i64 10
  %22 = load i64* %arrayidx34, align 8
  %cmp35 = icmp ne i64 %22, 6
  br i1 %cmp35, label %if.then39, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %if.end33
  %23 = load i64** %x.addr, align 8
  %arrayidx37 = getelementptr inbounds i64* %23, i64 11
  %24 = load i64* %arrayidx37, align 8
  %cmp38 = icmp ne i64 %24, 16
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %lor.lhs.false36, %if.end33
  call void @abort() noreturn
  unreachable

if.end40:                                         ; preds = %lor.lhs.false36
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
  %0 = load i32* %b, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %b, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx, align 8
  %1 = load i32* %b, align 4
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, i32* %b, align 4
  %idxprom2 = sext i32 %1 to i64
  %arrayidx3 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom2
  store i64 11, i64* %arrayidx3, align 8
  %2 = load i32* %b, align 4
  %inc4 = add nsw i32 %2, 1
  store i32 %inc4, i32* %b, align 4
  %idxprom5 = sext i32 %2 to i64
  %arrayidx6 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom5
  store i64 2, i64* %arrayidx6, align 8
  %3 = load i32* %b, align 4
  %inc7 = add nsw i32 %3, 1
  store i32 %inc7, i32* %b, align 4
  %idxprom8 = sext i32 %3 to i64
  %arrayidx9 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom8
  store i64 12, i64* %arrayidx9, align 8
  %4 = load i32* %b, align 4
  %inc10 = add nsw i32 %4, 1
  store i32 %inc10, i32* %b, align 4
  %idxprom11 = sext i32 %4 to i64
  %arrayidx12 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom11
  store i64 3, i64* %arrayidx12, align 8
  %call = call %struct.A* @bar()
  %p = getelementptr inbounds %struct.A* %call, i32 0, i32 0
  %5 = load i64* %p, align 8
  %6 = load i32* %b, align 4
  %inc13 = add nsw i32 %6, 1
  store i32 %inc13, i32* %b, align 4
  %idxprom14 = sext i32 %6 to i64
  %arrayidx15 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom14
  store i64 %5, i64* %arrayidx15, align 8
  %7 = load i32* %b, align 4
  %inc16 = add nsw i32 %7, 1
  store i32 %inc16, i32* %b, align 4
  %idxprom17 = sext i32 %7 to i64
  %arrayidx18 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom17
  store i64 4, i64* %arrayidx18, align 8
  %call19 = call %struct.A* @bar()
  %q = getelementptr inbounds %struct.A* %call19, i32 0, i32 1
  %8 = load i64* %q, align 8
  %9 = load i32* %b, align 4
  %inc20 = add nsw i32 %9, 1
  store i32 %inc20, i32* %b, align 4
  %idxprom21 = sext i32 %9 to i64
  %arrayidx22 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom21
  store i64 %8, i64* %arrayidx22, align 8
  %10 = load i32* %b, align 4
  %inc23 = add nsw i32 %10, 1
  store i32 %inc23, i32* %b, align 4
  %idxprom24 = sext i32 %10 to i64
  %arrayidx25 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom24
  store i64 5, i64* %arrayidx25, align 8
  %call26 = call %struct.A* @bar()
  %r = getelementptr inbounds %struct.A* %call26, i32 0, i32 2
  %11 = load i64* %r, align 8
  %12 = load i32* %b, align 4
  %inc27 = add nsw i32 %12, 1
  store i32 %inc27, i32* %b, align 4
  %idxprom28 = sext i32 %12 to i64
  %arrayidx29 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom28
  store i64 %11, i64* %arrayidx29, align 8
  %13 = load i32* %b, align 4
  %inc30 = add nsw i32 %13, 1
  store i32 %inc30, i32* %b, align 4
  %idxprom31 = sext i32 %13 to i64
  %arrayidx32 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom31
  store i64 6, i64* %arrayidx32, align 8
  %call33 = call %struct.A* @bar()
  %s = getelementptr inbounds %struct.A* %call33, i32 0, i32 3
  %14 = load i64* %s, align 8
  %15 = load i32* %b, align 4
  %inc34 = add nsw i32 %15, 1
  store i32 %inc34, i32* %b, align 4
  %idxprom35 = sext i32 %15 to i64
  %arrayidx36 = getelementptr inbounds [40 x i64]* %a, i32 0, i64 %idxprom35
  store i64 %14, i64* %arrayidx36, align 8
  %arraydecay = getelementptr inbounds [40 x i64]* %a, i32 0, i32 0
  %16 = load i32* %b, align 4
  call void @foo(i64* %arraydecay, i32 %16)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %17 = load i32* %retval
  ret i32 %17
}

define internal %struct.A* @bar() nounwind uwtable inlinehint {
entry:
  %r = alloca %struct.A*, align 8
  store %struct.A* @x, %struct.A** %r, align 8
  %0 = load %struct.A** %r, align 8
  ret %struct.A* %0
}

declare void @exit(i32) noreturn
