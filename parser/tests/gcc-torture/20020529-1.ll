; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020529-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.xx = type { i32, %struct.xx*, i16 }

@f1.beenhere = internal global i32 0, align 4

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

define i32 @foo(%struct.xx* %p, i32 %b, i32 %c, i32 %d) nounwind uwtable {
entry:
  %p.addr = alloca %struct.xx*, align 8
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %a = alloca i32, align 4
  store %struct.xx* %p, %struct.xx** %p.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %sw.epilog, %if.then4, %entry
  %tmp = load %struct.xx** %p.addr, align 8
  %call = call i32 @f1(%struct.xx* %tmp)
  store i32 %call, i32* %a, align 4
  %tmp1 = load i32* %a, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  ret i32 0

if.end:                                           ; preds = %for.cond
  %tmp2 = load i32* %b.addr, align 4
  %tobool3 = icmp ne i32 %tmp2, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  br label %for.cond

if.end5:                                          ; preds = %if.end
  %tmp6 = load i32* %d.addr, align 4
  %conv = trunc i32 %tmp6 to i16
  %tmp7 = load %struct.xx** %p.addr, align 8
  %c8 = getelementptr inbounds %struct.xx* %tmp7, i32 0, i32 2
  store i16 %conv, i16* %c8, align 2
  %tmp9 = load %struct.xx** %p.addr, align 8
  %a10 = getelementptr inbounds %struct.xx* %tmp9, i32 0, i32 0
  %tmp11 = load i32* %a10, align 4
  %tobool12 = icmp ne i32 %tmp11, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end5
  call void @f2()
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end5
  %tmp15 = load i32* %c.addr, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end14
  call void @f2()
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end14
  %tmp19 = load %struct.xx** %p.addr, align 8
  %c20 = getelementptr inbounds %struct.xx* %tmp19, i32 0, i32 2
  %tmp21 = load i16* %c20, align 2
  %conv22 = sext i16 %tmp21 to i32
  store i32 %conv22, i32* %d.addr, align 4
  %tmp23 = load i32* %a, align 4
  switch i32 %tmp23, label %sw.default [
    i32 1, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.end18
  %tmp24 = load %struct.xx** %p.addr, align 8
  %b25 = getelementptr inbounds %struct.xx* %tmp24, i32 0, i32 1
  %tmp26 = load %struct.xx** %b25, align 8
  %tobool27 = icmp ne %struct.xx* %tmp26, null
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %sw.bb
  call void @f2()
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %sw.bb
  %tmp30 = load i32* %c.addr, align 4
  %tobool31 = icmp ne i32 %tmp30, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end29
  call void @f2()
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end29
  br label %sw.default

sw.default:                                       ; preds = %if.end18, %if.end33
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %for.cond
}

define i32 @f1(%struct.xx* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.xx*, align 8
  store %struct.xx* %p, %struct.xx** %p.addr, align 8
  %tmp = load i32* @f1.beenhere, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @f1.beenhere, align 4
  %cmp = icmp sgt i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i32* @f1.beenhere, align 4
  %cmp2 = icmp sgt i32 %tmp1, 1
  %conv = zext i1 %cmp2 to i32
  ret i32 %conv
}

define void @f2() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.xx, align 8
  store i32 0, i32* %retval
  %a = getelementptr inbounds %struct.xx* %s, i32 0, i32 0
  store i32 0, i32* %a, align 4
  %b = getelementptr inbounds %struct.xx* %s, i32 0, i32 1
  store %struct.xx* %s, %struct.xx** %b, align 8
  %c = getelementptr inbounds %struct.xx* %s, i32 0, i32 2
  store i16 23, i16* %c, align 2
  %call = call i32 @foo(%struct.xx* %s, i32 0, i32 0, i32 0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %a1 = getelementptr inbounds %struct.xx* %s, i32 0, i32 0
  %tmp = load i32* %a1, align 4
  %cmp2 = icmp ne i32 %tmp, 0
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %b4 = getelementptr inbounds %struct.xx* %s, i32 0, i32 1
  %tmp5 = load %struct.xx** %b4, align 8
  %cmp6 = icmp ne %struct.xx* %tmp5, %s
  br i1 %cmp6, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false3
  %c8 = getelementptr inbounds %struct.xx* %s, i32 0, i32 2
  %tmp9 = load i16* %c8, align 2
  %conv = sext i16 %tmp9 to i32
  %cmp10 = icmp ne i32 %conv, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false7
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
