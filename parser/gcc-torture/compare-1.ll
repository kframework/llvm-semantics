; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/compare-1.c'
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

define i32 @ieq(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp sle i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp sge i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp5 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp7 = load i32* %ok.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  %tmp12 = load i32* %x.addr, align 4
  %tmp13 = load i32* %y.addr, align 4
  %cmp14 = icmp sle i32 %tmp12, %tmp13
  br i1 %cmp14, label %land.lhs.true15, label %if.else24

land.lhs.true15:                                  ; preds = %if.end11
  %tmp16 = load i32* %x.addr, align 4
  %tmp17 = load i32* %y.addr, align 4
  %cmp18 = icmp eq i32 %tmp16, %tmp17
  br i1 %cmp18, label %if.then19, label %if.else24

if.then19:                                        ; preds = %land.lhs.true15
  %tmp20 = load i32* %ok.addr, align 4
  %tobool21 = icmp ne i32 %tmp20, 0
  br i1 %tobool21, label %if.end23, label %if.then22

if.then22:                                        ; preds = %if.then19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.then19
  br label %if.end29

if.else24:                                        ; preds = %land.lhs.true15, %if.end11
  %tmp25 = load i32* %ok.addr, align 4
  %tobool26 = icmp ne i32 %tmp25, 0
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.else24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.else24
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.end23
  %tmp30 = load i32* %x.addr, align 4
  %tmp31 = load i32* %y.addr, align 4
  %cmp32 = icmp sle i32 %tmp30, %tmp31
  br i1 %cmp32, label %land.lhs.true33, label %if.else42

land.lhs.true33:                                  ; preds = %if.end29
  %tmp34 = load i32* %y.addr, align 4
  %tmp35 = load i32* %x.addr, align 4
  %cmp36 = icmp sle i32 %tmp34, %tmp35
  br i1 %cmp36, label %if.then37, label %if.else42

if.then37:                                        ; preds = %land.lhs.true33
  %tmp38 = load i32* %ok.addr, align 4
  %tobool39 = icmp ne i32 %tmp38, 0
  br i1 %tobool39, label %if.end41, label %if.then40

if.then40:                                        ; preds = %if.then37
  call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.then37
  br label %if.end47

if.else42:                                        ; preds = %land.lhs.true33, %if.end29
  %tmp43 = load i32* %ok.addr, align 4
  %tobool44 = icmp ne i32 %tmp43, 0
  br i1 %tobool44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.else42
  call void @abort() noreturn nounwind
  unreachable

if.end46:                                         ; preds = %if.else42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.end41
  %tmp48 = load i32* %y.addr, align 4
  %tmp49 = load i32* %x.addr, align 4
  %cmp50 = icmp eq i32 %tmp48, %tmp49
  br i1 %cmp50, label %land.lhs.true51, label %if.else60

land.lhs.true51:                                  ; preds = %if.end47
  %tmp52 = load i32* %x.addr, align 4
  %tmp53 = load i32* %y.addr, align 4
  %cmp54 = icmp sle i32 %tmp52, %tmp53
  br i1 %cmp54, label %if.then55, label %if.else60

if.then55:                                        ; preds = %land.lhs.true51
  %tmp56 = load i32* %ok.addr, align 4
  %tobool57 = icmp ne i32 %tmp56, 0
  br i1 %tobool57, label %if.end59, label %if.then58

if.then58:                                        ; preds = %if.then55
  call void @abort() noreturn nounwind
  unreachable

if.end59:                                         ; preds = %if.then55
  br label %if.end65

if.else60:                                        ; preds = %land.lhs.true51, %if.end47
  %tmp61 = load i32* %ok.addr, align 4
  %tobool62 = icmp ne i32 %tmp61, 0
  br i1 %tobool62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.else60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.else60
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.end59
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @ine(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp sgt i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %tmp5 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %lor.lhs.false
  %tmp7 = load i32* %ok.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  ret void
}

define i32 @ilt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp ne i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp5 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp7 = load i32* %ok.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  ret i32 0
}

define i32 @ile(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp eq i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %tmp5 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %lor.lhs.false
  %tmp7 = load i32* %ok.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  ret i32 0
}

define i32 @igt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp sgt i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp ne i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp5 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %land.lhs.true, %entry
  %tmp7 = load i32* %ok.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  ret i32 0
}

define i32 @ige(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp sgt i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp eq i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %tmp5 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.end, label %if.then6

if.then6:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end11

if.else:                                          ; preds = %lor.lhs.false
  %tmp7 = load i32* %ok.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @ieq(i32 1, i32 4, i32 0)
  %call1 = call i32 @ieq(i32 3, i32 3, i32 1)
  %call2 = call i32 @ieq(i32 5, i32 2, i32 0)
  call void @ine(i32 1, i32 4, i32 1)
  call void @ine(i32 3, i32 3, i32 0)
  call void @ine(i32 5, i32 2, i32 1)
  %call3 = call i32 @ilt(i32 1, i32 4, i32 1)
  %call4 = call i32 @ilt(i32 3, i32 3, i32 0)
  %call5 = call i32 @ilt(i32 5, i32 2, i32 0)
  %call6 = call i32 @ile(i32 1, i32 4, i32 1)
  %call7 = call i32 @ile(i32 3, i32 3, i32 1)
  %call8 = call i32 @ile(i32 5, i32 2, i32 0)
  %call9 = call i32 @igt(i32 1, i32 4, i32 0)
  %call10 = call i32 @igt(i32 3, i32 3, i32 0)
  %call11 = call i32 @igt(i32 5, i32 2, i32 1)
  %call12 = call i32 @ige(i32 1, i32 4, i32 0)
  %call13 = call i32 @ige(i32 3, i32 3, i32 1)
  %call14 = call i32 @ige(i32 5, i32 2, i32 1)
  ret i32 0
}
