; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030928-1.ll'
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

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @get_addrs(i8** %x, i32* %y) nounwind uwtable {
entry:
  %tmp1 = load i32* %y, align 4
  %sub = shl i32 %tmp1, 1
  %mul = add i32 %sub, -131072
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds [6 x i8]* @.str, i64 0, i64 %idx.ext
  store i8* %add.ptr, i8** %x, align 8
  %arrayidx5 = getelementptr inbounds i32* %y, i64 1
  %tmp6 = load i32* %arrayidx5, align 4
  %sub7 = shl i32 %tmp6, 1
  %mul8 = add i32 %sub7, -262144
  %idx.ext9 = sext i32 %mul8 to i64
  %add.ptr10 = getelementptr inbounds [6 x i8]* @.str1, i64 0, i64 %idx.ext9
  %arrayidx12 = getelementptr inbounds i8** %x, i64 1
  store i8* %add.ptr10, i8** %arrayidx12, align 8
  %arrayidx14 = getelementptr inbounds i32* %y, i64 2
  %tmp15 = load i32* %arrayidx14, align 4
  %sub16 = shl i32 %tmp15, 1
  %mul17 = add i32 %sub16, -393216
  %idx.ext18 = sext i32 %mul17 to i64
  %add.ptr19 = getelementptr inbounds [6 x i8]* @.str2, i64 0, i64 %idx.ext18
  %arrayidx21 = getelementptr inbounds i8** %x, i64 2
  store i8* %add.ptr19, i8** %arrayidx21, align 8
  %arrayidx23 = getelementptr inbounds i32* %y, i64 3
  %tmp24 = load i32* %arrayidx23, align 4
  %sub25 = shl i32 %tmp24, 1
  %mul26 = add i32 %sub25, -524288
  %idx.ext27 = sext i32 %mul26 to i64
  %add.ptr28 = getelementptr inbounds [6 x i8]* @.str3, i64 0, i64 %idx.ext27
  %arrayidx30 = getelementptr inbounds i8** %x, i64 3
  store i8* %add.ptr28, i8** %arrayidx30, align 8
  %arrayidx32 = getelementptr inbounds i32* %y, i64 4
  %tmp33 = load i32* %arrayidx32, align 4
  %sub34 = shl i32 %tmp33, 1
  %mul35 = add i32 %sub34, -655360
  %idx.ext36 = sext i32 %mul35 to i64
  %add.ptr37 = getelementptr inbounds [6 x i8]* @.str4, i64 0, i64 %idx.ext36
  %arrayidx39 = getelementptr inbounds i8** %x, i64 4
  store i8* %add.ptr37, i8** %arrayidx39, align 8
  %arrayidx41 = getelementptr inbounds i32* %y, i64 5
  %tmp42 = load i32* %arrayidx41, align 4
  %sub43 = shl i32 %tmp42, 1
  %mul44 = add i32 %sub43, -786432
  %idx.ext45 = sext i32 %mul44 to i64
  %add.ptr46 = getelementptr inbounds [6 x i8]* @.str5, i64 0, i64 %idx.ext45
  %arrayidx48 = getelementptr inbounds i8** %x, i64 5
  store i8* %add.ptr46, i8** %arrayidx48, align 8
  %arrayidx50 = getelementptr inbounds i32* %y, i64 6
  %tmp51 = load i32* %arrayidx50, align 4
  %sub52 = shl i32 %tmp51, 1
  %mul53 = add i32 %sub52, -917504
  %idx.ext54 = sext i32 %mul53 to i64
  %add.ptr55 = getelementptr inbounds [6 x i8]* @.str6, i64 0, i64 %idx.ext54
  %arrayidx57 = getelementptr inbounds i8** %x, i64 6
  store i8* %add.ptr55, i8** %arrayidx57, align 8
  %arrayidx59 = getelementptr inbounds i32* %y, i64 7
  %tmp60 = load i32* %arrayidx59, align 4
  %sub61 = shl i32 %tmp60, 1
  %mul62 = add i32 %sub61, -1048576
  %idx.ext63 = sext i32 %mul62 to i64
  %add.ptr64 = getelementptr inbounds [6 x i8]* @.str7, i64 0, i64 %idx.ext63
  %arrayidx66 = getelementptr inbounds i8** %x, i64 7
  store i8* %add.ptr64, i8** %arrayidx66, align 8
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca [8 x i8*], align 16
  %y = alloca [8 x i32], align 16
  %arrayidx = getelementptr [8 x i32]* %y, i64 0, i64 0
  store i32 65536, i32* %arrayidx, align 16
  %arrayidx.1 = getelementptr [8 x i32]* %y, i64 0, i64 1
  store i32 131072, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [8 x i32]* %y, i64 0, i64 2
  store i32 196608, i32* %arrayidx.2, align 8
  %arrayidx.3 = getelementptr [8 x i32]* %y, i64 0, i64 3
  store i32 262144, i32* %arrayidx.3, align 4
  %arrayidx.4 = getelementptr [8 x i32]* %y, i64 0, i64 4
  store i32 327680, i32* %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [8 x i32]* %y, i64 0, i64 5
  store i32 393216, i32* %arrayidx.5, align 4
  %arrayidx.6 = getelementptr [8 x i32]* %y, i64 0, i64 6
  store i32 458752, i32* %arrayidx.6, align 8
  %arrayidx.7 = getelementptr [8 x i32]* %y, i64 0, i64 7
  store i32 524288, i32* %arrayidx.7, align 4
  %arraydecay = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 0
  store i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i8** %arraydecay, align 16
  %arrayidx12.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 1
  store i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8** %arrayidx12.i, align 8
  %arrayidx21.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 2
  store i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), i8** %arrayidx21.i, align 16
  %arrayidx30.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 3
  store i8* getelementptr inbounds ([6 x i8]* @.str3, i64 0, i64 0), i8** %arrayidx30.i, align 8
  %arrayidx39.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 4
  store i8* getelementptr inbounds ([6 x i8]* @.str4, i64 0, i64 0), i8** %arrayidx39.i, align 16
  %arrayidx48.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 5
  store i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i8** %arrayidx48.i, align 8
  %arrayidx57.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 6
  store i8* getelementptr inbounds ([6 x i8]* @.str6, i64 0, i64 0), i8** %arrayidx57.i, align 16
  %arrayidx66.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 7
  store i8* getelementptr inbounds ([6 x i8]* @.str7, i64 0, i64 0), i8** %arrayidx66.i, align 8
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc16, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc16 ], [ 0, %entry ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp7 = icmp slt i32 %storemerge1, 8
  br i1 %cmp7, label %for.body8, label %for.end19

for.body8:                                        ; preds = %for.cond5
  %arrayidx11 = getelementptr [8 x i8*]* %x, i64 0, i64 %indvar
  %tmp12 = load i8** %arrayidx11, align 8
  %tmp13 = load i8* %tmp12, align 1
  %cmp14 = icmp eq i8 %tmp13, 97
  br i1 %cmp14, label %for.inc16, label %if.then

if.then:                                          ; preds = %for.body8
  call void @abort() noreturn nounwind
  unreachable

for.inc16:                                        ; preds = %for.body8
  %indvar.next = add i64 %indvar, 1
  br label %for.cond5

for.end19:                                        ; preds = %for.cond5
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
