; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030606-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32* @foo(i32* %x, i32 %b) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  %b.addr = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp, i32 1
  store i32* %incdec.ptr, i32** %x.addr, align 8
  store i32 55, i32* %tmp
  %tmp1 = load i32* %b.addr, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %b.addr, align 4
  %tmp3 = load i32** %x.addr, align 8
  %incdec.ptr4 = getelementptr inbounds i32* %tmp3, i32 1
  store i32* %incdec.ptr4, i32** %x.addr, align 8
  store i32 %tmp2, i32* %tmp3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp5 = load i32** %x.addr, align 8
  ret i32* %tmp5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %0 = bitcast i32* %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 1, i64 20, i32 1, i1 false)
  %arraydecay1 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call = call i32* @foo(i32* %arraydecay1, i32 0)
  %arraydecay2 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %sub.ptr.lhs.cast = ptrtoint i32* %call to i64
  %sub.ptr.rhs.cast = ptrtoint i32* %arraydecay2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 4
  %cmp = icmp ne i64 %sub.ptr.div, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %tmp = load i32* %arrayidx, align 4
  %cmp3 = icmp ne i32 %tmp, 55
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arrayidx5 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 1
  %tmp6 = load i32* %arrayidx5, align 4
  %arrayidx7 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 4
  %tmp8 = load i32* %arrayidx7, align 4
  %cmp9 = icmp ne i32 %tmp6, %tmp8
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  %arraydecay10 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %1 = bitcast i32* %arraydecay10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 1, i64 20, i32 1, i1 false)
  %arraydecay11 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call12 = call i32* @foo(i32* %arraydecay11, i32 2)
  %arraydecay13 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %sub.ptr.lhs.cast14 = ptrtoint i32* %call12 to i64
  %sub.ptr.rhs.cast15 = ptrtoint i32* %arraydecay13 to i64
  %sub.ptr.sub16 = sub i64 %sub.ptr.lhs.cast14, %sub.ptr.rhs.cast15
  %sub.ptr.div17 = sdiv exact i64 %sub.ptr.sub16, 4
  %cmp18 = icmp ne i64 %sub.ptr.div17, 2
  br i1 %cmp18, label %if.then27, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %if.end
  %arrayidx20 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %tmp21 = load i32* %arrayidx20, align 4
  %cmp22 = icmp ne i32 %tmp21, 55
  br i1 %cmp22, label %if.then27, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false19
  %arrayidx24 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 1
  %tmp25 = load i32* %arrayidx24, align 4
  %cmp26 = icmp ne i32 %tmp25, 2
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %lor.lhs.false23, %lor.lhs.false19, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %lor.lhs.false23
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
