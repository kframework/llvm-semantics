; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060929-1.c'
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

define void @foo(i32** %p, i32* %q) nounwind uwtable {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %tmp = load i32** %q.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp, i32 1
  store i32* %incdec.ptr, i32** %q.addr, align 8
  %tmp1 = load i32* %tmp
  %tmp2 = load i32*** %p.addr, align 8
  %incdec.ptr3 = getelementptr inbounds i32** %tmp2, i32 1
  store i32** %incdec.ptr3, i32*** %p.addr, align 8
  %tmp4 = load i32** %tmp2
  %incdec.ptr5 = getelementptr inbounds i32* %tmp4, i32 1
  store i32* %incdec.ptr5, i32** %tmp2
  store i32 %tmp1, i32* %tmp4
  ret void
}

define void @bar(i32** %p, i32* %q) nounwind uwtable {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %tmp = load i32** %q.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp, i32 1
  store i32* %incdec.ptr, i32** %q.addr, align 8
  %tmp1 = load i32* %tmp
  %tmp2 = load i32*** %p.addr, align 8
  %tmp3 = load i32** %tmp2
  store i32 %tmp1, i32* %tmp3
  %tmp4 = load i32*** %p.addr, align 8
  %incdec.ptr5 = getelementptr inbounds i32** %tmp4, i32 1
  store i32** %incdec.ptr5, i32*** %p.addr, align 8
  %tmp6 = load i32** %tmp4
  %incdec.ptr7 = getelementptr inbounds i32* %tmp6, i32 1
  store i32* %incdec.ptr7, i32** %tmp4
  %tmp8 = load i32* %tmp6
  ret void
}

define void @baz(i32** %p, i32* %q) nounwind uwtable {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %tmp = load i32** %q.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp, i32 1
  store i32* %incdec.ptr, i32** %q.addr, align 8
  %tmp1 = load i32* %tmp
  %tmp2 = load i32*** %p.addr, align 8
  %tmp3 = load i32** %tmp2
  store i32 %tmp1, i32* %tmp3
  %tmp4 = load i32*** %p.addr, align 8
  %incdec.ptr5 = getelementptr inbounds i32** %tmp4, i32 1
  store i32** %incdec.ptr5, i32*** %p.addr, align 8
  %tmp6 = load i32** %tmp4
  %incdec.ptr7 = getelementptr inbounds i32* %tmp6, i32 1
  store i32* %incdec.ptr7, i32** %tmp4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 42, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32* %i, i32** %p, align 8
  call void @foo(i32** %p, i32* %j)
  %tmp = load i32** %p, align 8
  %sub.ptr = getelementptr inbounds i32* %tmp, i64 -1
  %cmp = icmp ne i32* %sub.ptr, %i
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %j, align 4
  %cmp2 = icmp ne i32 %tmp1, 0
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp ne i32 %tmp4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  store i32 43, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  call void @bar(i32** %p, i32* %j)
  %tmp6 = load i32** %p, align 8
  %sub.ptr7 = getelementptr inbounds i32* %tmp6, i64 -1
  %cmp8 = icmp ne i32* %sub.ptr7, %i
  br i1 %cmp8, label %if.then15, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %if.end
  %tmp10 = load i32* %j, align 4
  %cmp11 = icmp ne i32 %tmp10, 0
  br i1 %cmp11, label %if.then15, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %tmp13 = load i32* %i, align 4
  %cmp14 = icmp ne i32 %tmp13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %lor.lhs.false12, %lor.lhs.false9, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %lor.lhs.false12
  store i32 44, i32* %i, align 4
  store i32* %i, i32** %p, align 8
  call void @baz(i32** %p, i32* %j)
  %tmp17 = load i32** %p, align 8
  %sub.ptr18 = getelementptr inbounds i32* %tmp17, i64 -1
  %cmp19 = icmp ne i32* %sub.ptr18, %i
  br i1 %cmp19, label %if.then26, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %if.end16
  %tmp21 = load i32* %j, align 4
  %cmp22 = icmp ne i32 %tmp21, 0
  br i1 %cmp22, label %if.then26, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %tmp24 = load i32* %i, align 4
  %cmp25 = icmp ne i32 %tmp24, 0
  br i1 %cmp25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %lor.lhs.false23, %lor.lhs.false20, %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %lor.lhs.false23
  ret i32 0
}

declare void @abort() noreturn nounwind
