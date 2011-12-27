; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20070517-1.c'
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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @example(i32 10)
  ret i32 0
}

define internal void @example(i32 %arg) nounwind uwtable {
entry:
  %arg.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  %kind = alloca i32, align 4
  store i32 %arg, i32* %arg.addr, align 4
  %tmp2 = load i32* %arg.addr, align 4
  %call = call i32 @get_kind(i32 %tmp2)
  store i32 %call, i32* %kind, align 4
  %tmp3 = load i32* %kind, align 4
  %cmp = icmp eq i32 %tmp3, 9
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp4 = load i32* %kind, align 4
  %cmp5 = icmp eq i32 %tmp4, 10
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %tmp7 = load i32* %kind, align 4
  %cmp8 = icmp eq i32 %tmp7, 5
  br i1 %cmp8, label %if.then, label %if.end20

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false, %entry
  %call9 = call i32 @some_call()
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end19

if.then11:                                        ; preds = %if.then
  %tmp12 = load i32* %kind, align 4
  %cmp13 = icmp eq i32 %tmp12, 9
  br i1 %cmp13, label %if.then17, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %if.then11
  %tmp15 = load i32* %kind, align 4
  %cmp16 = icmp eq i32 %tmp15, 10
  br i1 %cmp16, label %if.then17, label %if.else

if.then17:                                        ; preds = %lor.lhs.false14, %if.then11
  %tmp18 = load i32* %arg.addr, align 4
  store i32 %tmp18, i32* %tmp, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false14
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then17
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %lor.lhs.false6
  ret void
}

define internal i32 @get_kind(i32 %v) nounwind uwtable noinline {
entry:
  %v.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %tmp = load i32* %v.addr, align 4
  volatile store i32 %tmp, i32* %k, align 4
  %tmp1 = volatile load i32* %k, align 4
  ret i32 %tmp1
}

define internal i32 @some_call() nounwind uwtable noinline {
entry:
  ret i32 0
}

declare void @abort() noreturn nounwind
