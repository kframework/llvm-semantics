; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/switch-1.c'
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

define i32 @foo(i32 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  switch i32 %tmp, label %sw.epilog [
    i32 4, label %sw.bb
    i32 6, label %sw.bb
    i32 9, label %sw.bb
    i32 11, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry
  store i32 30, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 31, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 66
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %call = call i32 @foo(i32 %tmp1)
  store i32 %call, i32* %r, align 4
  %tmp2 = load i32* %i, align 4
  %cmp3 = icmp eq i32 %tmp2, 4
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %tmp4 = load i32* %r, align 4
  %cmp5 = icmp ne i32 %tmp4, 30
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end38

if.else:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %cmp8 = icmp eq i32 %tmp7, 6
  br i1 %cmp8, label %if.then9, label %if.else14

if.then9:                                         ; preds = %if.else
  %tmp10 = load i32* %r, align 4
  %cmp11 = icmp ne i32 %tmp10, 30
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.then9
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.then9
  br label %if.end37

if.else14:                                        ; preds = %if.else
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp eq i32 %tmp15, 9
  br i1 %cmp16, label %if.then17, label %if.else22

if.then17:                                        ; preds = %if.else14
  %tmp18 = load i32* %r, align 4
  %cmp19 = icmp ne i32 %tmp18, 30
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.then17
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.then17
  br label %if.end36

if.else22:                                        ; preds = %if.else14
  %tmp23 = load i32* %i, align 4
  %cmp24 = icmp eq i32 %tmp23, 11
  br i1 %cmp24, label %if.then25, label %if.else30

if.then25:                                        ; preds = %if.else22
  %tmp26 = load i32* %r, align 4
  %cmp27 = icmp ne i32 %tmp26, 30
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.then25
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.then25
  br label %if.end35

if.else30:                                        ; preds = %if.else22
  %tmp31 = load i32* %r, align 4
  %cmp32 = icmp ne i32 %tmp31, 31
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.else30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.else30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end29
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end21
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.end13
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end38
  %tmp39 = load i32* %i, align 4
  %inc = add nsw i32 %tmp39, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
