; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.vc = type { %struct.vc_data* }
%struct.vc_data = type { i64, [48 x i8] }

@a_con = common global %struct.vc_data zeroinitializer, align 8
@vc_cons = global [63 x %struct.vc] [%struct.vc { %struct.vc_data* @a_con }, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer], align 16
@default_red = common global [16 x i32] zeroinitializer, align 16
@default_grn = common global [16 x i32] zeroinitializer, align 16
@default_blu = common global [16 x i32] zeroinitializer, align 16

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

define void @reset_palette(i32 %currcons) nounwind uwtable {
entry:
  %currcons.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %currcons, i32* %currcons.addr, align 4
  store i32 0, i32* %k, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %j, align 4
  %cmp = icmp slt i32 %tmp, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %j, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @default_red, i32 0, i64 %idxprom
  %tmp2 = load i32* %arrayidx, align 4
  %conv = trunc i32 %tmp2 to i8
  %tmp3 = load i32* %k, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %k, align 4
  %idxprom4 = sext i32 %tmp3 to i64
  %tmp5 = load i32* %currcons.addr, align 4
  %idxprom6 = sext i32 %tmp5 to i64
  %arrayidx7 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %idxprom6
  %d = getelementptr inbounds %struct.vc* %arrayidx7, i32 0, i32 0
  %tmp8 = load %struct.vc_data** %d, align 8
  %vc_palette = getelementptr inbounds %struct.vc_data* %tmp8, i32 0, i32 1
  %arrayidx9 = getelementptr inbounds [48 x i8]* %vc_palette, i32 0, i64 %idxprom4
  store i8 %conv, i8* %arrayidx9, align 1
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %arrayidx12 = getelementptr inbounds [16 x i32]* @default_grn, i32 0, i64 %idxprom11
  %tmp13 = load i32* %arrayidx12, align 4
  %conv14 = trunc i32 %tmp13 to i8
  %tmp15 = load i32* %k, align 4
  %inc16 = add nsw i32 %tmp15, 1
  store i32 %inc16, i32* %k, align 4
  %idxprom17 = sext i32 %tmp15 to i64
  %tmp18 = load i32* %currcons.addr, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %arrayidx20 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %idxprom19
  %d21 = getelementptr inbounds %struct.vc* %arrayidx20, i32 0, i32 0
  %tmp22 = load %struct.vc_data** %d21, align 8
  %vc_palette23 = getelementptr inbounds %struct.vc_data* %tmp22, i32 0, i32 1
  %arrayidx24 = getelementptr inbounds [48 x i8]* %vc_palette23, i32 0, i64 %idxprom17
  store i8 %conv14, i8* %arrayidx24, align 1
  %tmp25 = load i32* %j, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx27 = getelementptr inbounds [16 x i32]* @default_blu, i32 0, i64 %idxprom26
  %tmp28 = load i32* %arrayidx27, align 4
  %conv29 = trunc i32 %tmp28 to i8
  %tmp30 = load i32* %k, align 4
  %inc31 = add nsw i32 %tmp30, 1
  store i32 %inc31, i32* %k, align 4
  %idxprom32 = sext i32 %tmp30 to i64
  %tmp33 = load i32* %currcons.addr, align 4
  %idxprom34 = sext i32 %tmp33 to i64
  %arrayidx35 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %idxprom34
  %d36 = getelementptr inbounds %struct.vc* %arrayidx35, i32 0, i32 0
  %tmp37 = load %struct.vc_data** %d36, align 8
  %vc_palette38 = getelementptr inbounds %struct.vc_data* %tmp37, i32 0, i32 1
  %arrayidx39 = getelementptr inbounds [48 x i8]* %vc_palette38, i32 0, i64 %idxprom32
  store i8 %conv29, i8* %arrayidx39, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp40 = load i32* %j, align 4
  %inc41 = add nsw i32 %tmp40, 1
  store i32 %inc41, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp42 = load i32* %k, align 4
  call void @bar(i32 %tmp42)
  ret void
}

define void @bar(i32 %k) nounwind uwtable {
entry:
  %k.addr = alloca i32, align 4
  store i32 %k, i32* %k.addr, align 4
  %tmp = load i32* %k.addr, align 4
  %cmp = icmp ne i32 %tmp, 48
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @reset_palette(i32 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
