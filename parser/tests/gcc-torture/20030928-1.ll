; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030928-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"a1111\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"a1112\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"a1113\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"a1114\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"a1115\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"a1116\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"a1117\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"a1118\00", align 1

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

define void @get_addrs(i8** %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i8**, align 8
  %y.addr = alloca i32*, align 8
  store i8** %x, i8*** %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  %tmp = load i32** %y.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp, i64 0
  %tmp1 = load i32* %arrayidx
  %sub = sub nsw i32 %tmp1, 65536
  %mul = mul nsw i32 %sub, 2
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i64 %idx.ext
  %tmp2 = load i8*** %x.addr, align 8
  %arrayidx3 = getelementptr inbounds i8** %tmp2, i64 0
  store i8* %add.ptr, i8** %arrayidx3
  %tmp4 = load i32** %y.addr, align 8
  %arrayidx5 = getelementptr inbounds i32* %tmp4, i64 1
  %tmp6 = load i32* %arrayidx5
  %sub7 = sub nsw i32 %tmp6, 131072
  %mul8 = mul nsw i32 %sub7, 2
  %idx.ext9 = sext i32 %mul8 to i64
  %add.ptr10 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i64 %idx.ext9
  %tmp11 = load i8*** %x.addr, align 8
  %arrayidx12 = getelementptr inbounds i8** %tmp11, i64 1
  store i8* %add.ptr10, i8** %arrayidx12
  %tmp13 = load i32** %y.addr, align 8
  %arrayidx14 = getelementptr inbounds i32* %tmp13, i64 2
  %tmp15 = load i32* %arrayidx14
  %sub16 = sub nsw i32 %tmp15, 196608
  %mul17 = mul nsw i32 %sub16, 2
  %idx.ext18 = sext i32 %mul17 to i64
  %add.ptr19 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i64 %idx.ext18
  %tmp20 = load i8*** %x.addr, align 8
  %arrayidx21 = getelementptr inbounds i8** %tmp20, i64 2
  store i8* %add.ptr19, i8** %arrayidx21
  %tmp22 = load i32** %y.addr, align 8
  %arrayidx23 = getelementptr inbounds i32* %tmp22, i64 3
  %tmp24 = load i32* %arrayidx23
  %sub25 = sub nsw i32 %tmp24, 262144
  %mul26 = mul nsw i32 %sub25, 2
  %idx.ext27 = sext i32 %mul26 to i64
  %add.ptr28 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i64 %idx.ext27
  %tmp29 = load i8*** %x.addr, align 8
  %arrayidx30 = getelementptr inbounds i8** %tmp29, i64 3
  store i8* %add.ptr28, i8** %arrayidx30
  %tmp31 = load i32** %y.addr, align 8
  %arrayidx32 = getelementptr inbounds i32* %tmp31, i64 4
  %tmp33 = load i32* %arrayidx32
  %sub34 = sub nsw i32 %tmp33, 327680
  %mul35 = mul nsw i32 %sub34, 2
  %idx.ext36 = sext i32 %mul35 to i64
  %add.ptr37 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i64 %idx.ext36
  %tmp38 = load i8*** %x.addr, align 8
  %arrayidx39 = getelementptr inbounds i8** %tmp38, i64 4
  store i8* %add.ptr37, i8** %arrayidx39
  %tmp40 = load i32** %y.addr, align 8
  %arrayidx41 = getelementptr inbounds i32* %tmp40, i64 5
  %tmp42 = load i32* %arrayidx41
  %sub43 = sub nsw i32 %tmp42, 393216
  %mul44 = mul nsw i32 %sub43, 2
  %idx.ext45 = sext i32 %mul44 to i64
  %add.ptr46 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i64 %idx.ext45
  %tmp47 = load i8*** %x.addr, align 8
  %arrayidx48 = getelementptr inbounds i8** %tmp47, i64 5
  store i8* %add.ptr46, i8** %arrayidx48
  %tmp49 = load i32** %y.addr, align 8
  %arrayidx50 = getelementptr inbounds i32* %tmp49, i64 6
  %tmp51 = load i32* %arrayidx50
  %sub52 = sub nsw i32 %tmp51, 458752
  %mul53 = mul nsw i32 %sub52, 2
  %idx.ext54 = sext i32 %mul53 to i64
  %add.ptr55 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0), i64 %idx.ext54
  %tmp56 = load i8*** %x.addr, align 8
  %arrayidx57 = getelementptr inbounds i8** %tmp56, i64 6
  store i8* %add.ptr55, i8** %arrayidx57
  %tmp58 = load i32** %y.addr, align 8
  %arrayidx59 = getelementptr inbounds i32* %tmp58, i64 7
  %tmp60 = load i32* %arrayidx59
  %sub61 = sub nsw i32 %tmp60, 524288
  %mul62 = mul nsw i32 %sub61, 2
  %idx.ext63 = sext i32 %mul62 to i64
  %add.ptr64 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i64 %idx.ext63
  %tmp65 = load i8*** %x.addr, align 8
  %arrayidx66 = getelementptr inbounds i8** %tmp65, i64 7
  store i8* %add.ptr64, i8** %arrayidx66
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [8 x i8*], align 16
  %y = alloca [8 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %add = add nsw i32 %tmp1, 1
  %mul = mul nsw i32 65536, %add
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [8 x i32]* %y, i32 0, i64 %idxprom
  store i32 %mul, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [8 x i8*]* %x, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [8 x i32]* %y, i32 0, i32 0
  call void @get_addrs(i8** %arraydecay, i32* %arraydecay4)
  store i32 0, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc16, %for.end
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %tmp6, 8
  br i1 %cmp7, label %for.body8, label %for.end19

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %i, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %arrayidx11 = getelementptr inbounds [8 x i8*]* %x, i32 0, i64 %idxprom10
  %tmp12 = load i8** %arrayidx11, align 8
  %tmp13 = load i8* %tmp12
  %conv = sext i8 %tmp13 to i32
  %cmp14 = icmp ne i32 %conv, 97
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body8
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body8
  br label %for.inc16

for.inc16:                                        ; preds = %if.end
  %tmp17 = load i32* %i, align 4
  %inc18 = add nsw i32 %tmp17, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond5

for.end19:                                        ; preds = %for.cond5
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
