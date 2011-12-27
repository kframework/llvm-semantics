; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060412-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i64 }
%struct.T = type { i64, [82 x %struct.S] }

@t = common global %struct.T zeroinitializer, align 8

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.S*, align 8
  %q = alloca %struct.S*, align 8
  store i32 0, i32* %retval
  store %struct.S* bitcast (%struct.T* @t to %struct.S*), %struct.S** %p, align 8
  %tmp = load %struct.S** %p, align 8
  %0 = bitcast %struct.S* %tmp to %struct.T*
  %m = getelementptr inbounds %struct.T* %0, i32 0, i32 1
  %arrayidx = getelementptr inbounds [82 x %struct.S]* %m, i32 0, i64 0
  store %struct.S* %arrayidx, %struct.S** %p, align 8
  %tmp1 = load %struct.S** %p, align 8
  %add.ptr = getelementptr inbounds %struct.S* %tmp1, i64 82
  store %struct.S* %add.ptr, %struct.S** %q, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp2 = load %struct.S** %q, align 8
  %incdec.ptr = getelementptr inbounds %struct.S* %tmp2, i32 -1
  store %struct.S* %incdec.ptr, %struct.S** %q, align 8
  %tmp3 = load %struct.S** %p, align 8
  %cmp = icmp ugt %struct.S* %incdec.ptr, %tmp3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp4 = load %struct.S** %q, align 8
  %o = getelementptr inbounds %struct.S* %tmp4, i32 0, i32 0
  store i64 -1, i64* %o, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp5 = load %struct.S** %q, align 8
  %o6 = getelementptr inbounds %struct.S* %tmp5, i32 0, i32 0
  store i64 0, i64* %o6, align 8
  %tmp7 = load %struct.S** %q, align 8
  %tmp8 = load %struct.S** %p, align 8
  %cmp9 = icmp ugt %struct.S* %tmp7, %tmp8
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  %tmp10 = load %struct.S** %q, align 8
  %tmp11 = load %struct.S** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.S* %tmp10 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.S* %tmp11 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  %cmp12 = icmp sgt i64 %sub.ptr.div, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
