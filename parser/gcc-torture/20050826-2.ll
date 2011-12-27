; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050826-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtattr = type { i16, i16 }

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

define i32 @inet_check_attr(i8* %r, %struct.rtattr** %rta) nounwind uwtable noinline {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca i8*, align 8
  %rta.addr = alloca %struct.rtattr**, align 8
  %i = alloca i32, align 4
  %attr = alloca %struct.rtattr*, align 8
  store i8* %r, i8** %r.addr, align 8
  store %struct.rtattr** %rta, %struct.rtattr*** %rta.addr, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp sle i32 %tmp, 14
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp2, 1
  %idxprom = sext i32 %sub to i64
  %tmp3 = load %struct.rtattr*** %rta.addr, align 8
  %arrayidx = getelementptr inbounds %struct.rtattr** %tmp3, i64 %idxprom
  %tmp4 = load %struct.rtattr** %arrayidx
  store %struct.rtattr* %tmp4, %struct.rtattr** %attr, align 8
  %tmp5 = load %struct.rtattr** %attr, align 8
  %tobool = icmp ne %struct.rtattr* %tmp5, null
  br i1 %tobool, label %if.then, label %if.end26

if.then:                                          ; preds = %for.body
  %tmp6 = load %struct.rtattr** %attr, align 8
  %rta_len = getelementptr inbounds %struct.rtattr* %tmp6, i32 0, i32 0
  %tmp7 = load i16* %rta_len, align 2
  %conv = zext i16 %tmp7 to i64
  %sub8 = sub i64 %conv, 4
  %cmp9 = icmp ult i64 %sub8, 4
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.then
  store i32 -22, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %tmp12 = load i32* %i, align 4
  %cmp13 = icmp ne i32 %tmp12, 9
  br i1 %cmp13, label %land.lhs.true, label %if.end25

land.lhs.true:                                    ; preds = %if.end
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp ne i32 %tmp15, 8
  br i1 %cmp16, label %if.then18, label %if.end25

if.then18:                                        ; preds = %land.lhs.true
  %tmp19 = load %struct.rtattr** %attr, align 8
  %add.ptr = getelementptr inbounds %struct.rtattr* %tmp19, i64 1
  %tmp20 = load i32* %i, align 4
  %sub21 = sub nsw i32 %tmp20, 1
  %idxprom22 = sext i32 %sub21 to i64
  %tmp23 = load %struct.rtattr*** %rta.addr, align 8
  %arrayidx24 = getelementptr inbounds %struct.rtattr** %tmp23, i64 %idxprom22
  store %struct.rtattr* %add.ptr, %struct.rtattr** %arrayidx24
  br label %if.end25

if.end25:                                         ; preds = %if.then18, %land.lhs.true, %if.end
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end26
  %tmp27 = load i32* %i, align 4
  %inc = add nsw i32 %tmp27, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then11
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %rt = alloca [2 x %struct.rtattr], align 2
  %rta = alloca [14 x %struct.rtattr*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %rta_len = getelementptr inbounds %struct.rtattr* %arrayidx, i32 0, i32 0
  store i16 12, i16* %rta_len, align 2
  %arrayidx1 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %rta_type = getelementptr inbounds %struct.rtattr* %arrayidx1, i32 0, i32 1
  store i16 0, i16* %rta_type, align 2
  %arrayidx2 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %arrayidx3 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %tmp = bitcast %struct.rtattr* %arrayidx2 to i8*
  %tmp4 = bitcast %struct.rtattr* %arrayidx3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp4, i64 4, i32 2, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp5 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp5, 14
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx8 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom
  store %struct.rtattr* %arrayidx6, %struct.rtattr** %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp9 = load i32* %i, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i32 0
  %call = call i32 @inet_check_attr(i8* null, %struct.rtattr** %arraydecay)
  %cmp10 = icmp ne i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc28, %if.end
  %tmp12 = load i32* %i, align 4
  %cmp13 = icmp slt i32 %tmp12, 14
  br i1 %cmp13, label %for.body14, label %for.end31

for.body14:                                       ; preds = %for.cond11
  %tmp15 = load i32* %i, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %arrayidx17 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom16
  %tmp18 = load %struct.rtattr** %arrayidx17, align 8
  %tmp19 = load i32* %i, align 4
  %cmp20 = icmp ne i32 %tmp19, 7
  br i1 %cmp20, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body14
  %tmp21 = load i32* %i, align 4
  %cmp22 = icmp ne i32 %tmp21, 8
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body14
  %0 = phi i1 [ false, %for.body14 ], [ %cmp22, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %idxprom23 = sext i32 %land.ext to i64
  %arrayidx24 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 %idxprom23
  %cmp25 = icmp ne %struct.rtattr* %tmp18, %arrayidx24
  br i1 %cmp25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %land.end
  br label %for.inc28

for.inc28:                                        ; preds = %if.end27
  %tmp29 = load i32* %i, align 4
  %inc30 = add nsw i32 %tmp29, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond11

for.end31:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc40, %for.end31
  %tmp33 = load i32* %i, align 4
  %cmp34 = icmp slt i32 %tmp33, 14
  br i1 %cmp34, label %for.body35, label %for.end43

for.body35:                                       ; preds = %for.cond32
  %arrayidx36 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %tmp37 = load i32* %i, align 4
  %idxprom38 = sext i32 %tmp37 to i64
  %arrayidx39 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom38
  store %struct.rtattr* %arrayidx36, %struct.rtattr** %arrayidx39, align 8
  br label %for.inc40

for.inc40:                                        ; preds = %for.body35
  %tmp41 = load i32* %i, align 4
  %inc42 = add nsw i32 %tmp41, 1
  store i32 %inc42, i32* %i, align 4
  br label %for.cond32

for.end43:                                        ; preds = %for.cond32
  %arrayidx44 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 1
  store %struct.rtattr* null, %struct.rtattr** %arrayidx44, align 8
  %arrayidx45 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %rta_len46 = getelementptr inbounds %struct.rtattr* %arrayidx45, i32 0, i32 0
  %tmp47 = load i16* %rta_len46, align 2
  %conv = zext i16 %tmp47 to i32
  %sub = sub nsw i32 %conv, 8
  %conv48 = trunc i32 %sub to i16
  store i16 %conv48, i16* %rta_len46, align 2
  %arrayidx49 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %arrayidx50 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 5
  store %struct.rtattr* %arrayidx49, %struct.rtattr** %arrayidx50, align 8
  %arraydecay51 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i32 0
  %call52 = call i32 @inet_check_attr(i8* null, %struct.rtattr** %arraydecay51)
  %cmp53 = icmp ne i32 %call52, -22
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %for.end43
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %for.end43
  store i32 0, i32* %i, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc104, %if.end56
  %tmp58 = load i32* %i, align 4
  %cmp59 = icmp slt i32 %tmp58, 14
  br i1 %cmp59, label %for.body61, label %for.end107

for.body61:                                       ; preds = %for.cond57
  %tmp62 = load i32* %i, align 4
  %cmp63 = icmp eq i32 %tmp62, 1
  br i1 %cmp63, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body61
  %tmp65 = load i32* %i, align 4
  %idxprom66 = sext i32 %tmp65 to i64
  %arrayidx67 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom66
  %tmp68 = load %struct.rtattr** %arrayidx67, align 8
  %cmp69 = icmp ne %struct.rtattr* %tmp68, null
  br i1 %cmp69, label %if.then71, label %if.else

if.then71:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %land.lhs.true, %for.body61
  %tmp72 = load i32* %i, align 4
  %cmp73 = icmp ne i32 %tmp72, 1
  br i1 %cmp73, label %land.lhs.true75, label %if.else88

land.lhs.true75:                                  ; preds = %if.else
  %tmp76 = load i32* %i, align 4
  %cmp77 = icmp sle i32 %tmp76, 5
  br i1 %cmp77, label %land.lhs.true79, label %if.else88

land.lhs.true79:                                  ; preds = %land.lhs.true75
  %tmp80 = load i32* %i, align 4
  %idxprom81 = sext i32 %tmp80 to i64
  %arrayidx82 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom81
  %tmp83 = load %struct.rtattr** %arrayidx82, align 8
  %arrayidx84 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %cmp85 = icmp ne %struct.rtattr* %tmp83, %arrayidx84
  br i1 %cmp85, label %if.then87, label %if.else88

if.then87:                                        ; preds = %land.lhs.true79
  call void @abort() noreturn nounwind
  unreachable

if.else88:                                        ; preds = %land.lhs.true79, %land.lhs.true75, %if.else
  %tmp89 = load i32* %i, align 4
  %cmp90 = icmp sgt i32 %tmp89, 5
  br i1 %cmp90, label %land.lhs.true92, label %if.end101

land.lhs.true92:                                  ; preds = %if.else88
  %tmp93 = load i32* %i, align 4
  %idxprom94 = sext i32 %tmp93 to i64
  %arrayidx95 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i32 0, i64 %idxprom94
  %tmp96 = load %struct.rtattr** %arrayidx95, align 8
  %arrayidx97 = getelementptr inbounds [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %cmp98 = icmp ne %struct.rtattr* %tmp96, %arrayidx97
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %land.lhs.true92
  call void @abort() noreturn nounwind
  unreachable

if.end101:                                        ; preds = %land.lhs.true92, %if.else88
  br label %if.end102

if.end102:                                        ; preds = %if.end101
  br label %if.end103

if.end103:                                        ; preds = %if.end102
  br label %for.inc104

for.inc104:                                       ; preds = %if.end103
  %tmp105 = load i32* %i, align 4
  %inc106 = add nsw i32 %tmp105, 1
  store i32 %inc106, i32* %i, align 4
  br label %for.cond57

for.end107:                                       ; preds = %for.cond57
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
