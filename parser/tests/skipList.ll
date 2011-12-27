; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/skipList.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.SkipSet = type { %struct.sn*, i32 }
%struct.sn = type { i32, %struct.sn** }

@random_level.first = internal global i32 1, align 4
@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@.str4 = private unnamed_addr constant [18 x i8] c"7 is in the list\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"7 has been deleted\0A\00", align 1

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

define float @frand() nounwind uwtable {
entry:
  %call = call i32 @rand() nounwind
  %conv = sitofp i32 %call to float
  %div = fdiv float %conv, 0x41E0000000000000
  ret float %div
}

declare i32 @rand() nounwind

define i32 @random_level() nounwind uwtable {
entry:
  %lvl = alloca i32, align 4
  store i32 0, i32* %lvl, align 4
  %tmp = load i32* @random_level.first, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @random_level.first, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %call = call float @frand()
  %conv = fpext float %call to double
  %cmp = fcmp olt double %conv, 5.000000e-01
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp2 = load i32* %lvl, align 4
  %cmp3 = icmp slt i32 %tmp2, 6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp3, %land.rhs ]
  br i1 %0, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %tmp5 = load i32* %lvl, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %lvl, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %tmp6 = load i32* %lvl, align 4
  ret i32 %tmp6
}

define %struct.sn* @make_node(i32 %level, i32 %value) nounwind uwtable {
entry:
  %level.addr = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %sn = alloca %struct.sn*, align 8
  %i = alloca i32, align 4
  store i32 %level, i32* %level.addr, align 4
  store i32 %value, i32* %value.addr, align 4
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.sn*
  store %struct.sn* %0, %struct.sn** %sn, align 8
  %tmp = load i32* %level.addr, align 4
  %add = add nsw i32 %tmp, 1
  %conv = sext i32 %add to i64
  %mul = mul i64 %conv, 8
  %call1 = call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call1 to %struct.sn**
  %tmp2 = load %struct.sn** %sn, align 8
  %forward = getelementptr inbounds %struct.sn* %tmp2, i32 0, i32 1
  store %struct.sn** %1, %struct.sn*** %forward, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %tmp5 = load i32* %level.addr, align 4
  %add6 = add nsw i32 %tmp5, 1
  %cmp = icmp slt i32 %tmp4, %add6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp8 = load i32* %i, align 4
  %idxprom = sext i32 %tmp8 to i64
  %tmp9 = load %struct.sn** %sn, align 8
  %forward10 = getelementptr inbounds %struct.sn* %tmp9, i32 0, i32 1
  %tmp11 = load %struct.sn*** %forward10, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %tmp11, i64 %idxprom
  store %struct.sn* null, %struct.sn** %arrayidx
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp12 = load i32* %i, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp13 = load i32* %value.addr, align 4
  %tmp14 = load %struct.sn** %sn, align 8
  %value15 = getelementptr inbounds %struct.sn* %tmp14, i32 0, i32 0
  store i32 %tmp13, i32* %value15, align 4
  %tmp16 = load %struct.sn** %sn, align 8
  ret %struct.sn* %tmp16
}

declare noalias i8* @malloc(i64) nounwind

define %struct.SkipSet* @make_skipset() nounwind uwtable {
entry:
  %ss = alloca %struct.SkipSet*, align 8
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.SkipSet*
  store %struct.SkipSet* %0, %struct.SkipSet** %ss, align 8
  %call1 = call %struct.sn* @make_node(i32 6, i32 0)
  %tmp = load %struct.SkipSet** %ss, align 8
  %header = getelementptr inbounds %struct.SkipSet* %tmp, i32 0, i32 0
  store %struct.sn* %call1, %struct.sn** %header, align 8
  %tmp2 = load %struct.SkipSet** %ss, align 8
  %level = getelementptr inbounds %struct.SkipSet* %tmp2, i32 0, i32 1
  store i32 0, i32* %level, align 4
  %tmp3 = load %struct.SkipSet** %ss, align 8
  ret %struct.SkipSet* %tmp3
}

define void @print_skipset(%struct.SkipSet* %ss) nounwind uwtable {
entry:
  %ss.addr = alloca %struct.SkipSet*, align 8
  %x = alloca %struct.sn*, align 8
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  %tmp = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %tmp, i32 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  %forward = getelementptr inbounds %struct.sn* %tmp1, i32 0, i32 1
  %tmp2 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %tmp2, i64 0
  %tmp3 = load %struct.sn** %arrayidx
  store %struct.sn* %tmp3, %struct.sn** %x, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp4 = load %struct.sn** %x, align 8
  %cmp = icmp ne %struct.sn* %tmp4, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp5 = load %struct.sn** %x, align 8
  %value = getelementptr inbounds %struct.sn* %tmp5, i32 0, i32 0
  %tmp6 = load i32* %value, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load %struct.sn** %x, align 8
  %forward9 = getelementptr inbounds %struct.sn* %tmp8, i32 0, i32 1
  %tmp10 = load %struct.sn*** %forward9, align 8
  %arrayidx11 = getelementptr inbounds %struct.sn** %tmp10, i64 0
  %tmp12 = load %struct.sn** %arrayidx11
  store %struct.sn* %tmp12, %struct.sn** %x, align 8
  %tmp13 = load %struct.sn** %x, align 8
  %cmp14 = icmp ne %struct.sn* %tmp13, null
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @contains(%struct.SkipSet* %ss, i32 %search_value) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ss.addr = alloca %struct.SkipSet*, align 8
  %search_value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  store i32 %search_value, i32* %search_value.addr, align 4
  %tmp = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %tmp, i32 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  store %struct.sn* %tmp1, %struct.sn** %x, align 8
  %tmp2 = load %struct.SkipSet** %ss.addr, align 8
  %level = getelementptr inbounds %struct.SkipSet* %tmp2, i32 0, i32 1
  %tmp3 = load i32* %level, align 4
  store i32 %tmp3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp sge i32 %tmp4, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %tmp5 = load i32* %i, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load %struct.sn** %x, align 8
  %forward = getelementptr inbounds %struct.sn* %tmp6, i32 0, i32 1
  %tmp7 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %tmp7, i64 %idxprom
  %tmp8 = load %struct.sn** %arrayidx
  %cmp9 = icmp ne %struct.sn* %tmp8, null
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp10 = load i32* %i, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load %struct.sn** %x, align 8
  %forward13 = getelementptr inbounds %struct.sn* %tmp12, i32 0, i32 1
  %tmp14 = load %struct.sn*** %forward13, align 8
  %arrayidx15 = getelementptr inbounds %struct.sn** %tmp14, i64 %idxprom11
  %tmp16 = load %struct.sn** %arrayidx15
  %value = getelementptr inbounds %struct.sn* %tmp16, i32 0, i32 0
  %tmp17 = load i32* %value, align 4
  %tmp18 = load i32* %search_value.addr, align 4
  %cmp19 = icmp slt i32 %tmp17, %tmp18
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp19, %land.rhs ]
  br i1 %0, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %tmp20 = load i32* %i, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %tmp22 = load %struct.sn** %x, align 8
  %forward23 = getelementptr inbounds %struct.sn* %tmp22, i32 0, i32 1
  %tmp24 = load %struct.sn*** %forward23, align 8
  %arrayidx25 = getelementptr inbounds %struct.sn** %tmp24, i64 %idxprom21
  %tmp26 = load %struct.sn** %arrayidx25
  store %struct.sn* %tmp26, %struct.sn** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %tmp27 = load i32* %i, align 4
  %dec = add nsw i32 %tmp27, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp28 = load %struct.sn** %x, align 8
  %forward29 = getelementptr inbounds %struct.sn* %tmp28, i32 0, i32 1
  %tmp30 = load %struct.sn*** %forward29, align 8
  %arrayidx31 = getelementptr inbounds %struct.sn** %tmp30, i64 0
  %tmp32 = load %struct.sn** %arrayidx31
  store %struct.sn* %tmp32, %struct.sn** %x, align 8
  %tmp33 = load %struct.sn** %x, align 8
  %cmp34 = icmp ne %struct.sn* %tmp33, null
  br i1 %cmp34, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.end
  %tmp35 = load %struct.sn** %x, align 8
  %value36 = getelementptr inbounds %struct.sn* %tmp35, i32 0, i32 0
  %tmp37 = load i32* %value36, align 4
  %tmp38 = load i32* %search_value.addr, align 4
  %cmp39 = icmp eq i32 %tmp37, %tmp38
  br i1 %cmp39, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define void @insert(%struct.SkipSet* %ss, i32 %value) nounwind uwtable {
entry:
  %ss.addr = alloca %struct.SkipSet*, align 8
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  %update = alloca [7 x %struct.sn*], align 16
  %guard = alloca i32, align 4
  %lvl = alloca i32, align 4
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  store i32 %value, i32* %value.addr, align 4
  %tmp = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %tmp, i32 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  store %struct.sn* %tmp1, %struct.sn** %x, align 8
  %arraydecay = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i32 0
  %0 = bitcast %struct.sn** %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 7, i32 1, i1 false)
  %tmp3 = load %struct.SkipSet** %ss.addr, align 8
  %level = getelementptr inbounds %struct.SkipSet* %tmp3, i32 0, i32 1
  %tmp4 = load i32* %level, align 4
  store i32 %tmp4, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp5 = load i32* %i, align 4
  %cmp = icmp sge i32 %tmp5, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %tmp7 = load %struct.sn** %x, align 8
  %forward = getelementptr inbounds %struct.sn* %tmp7, i32 0, i32 1
  %tmp8 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %tmp8, i64 %idxprom
  %tmp9 = load %struct.sn** %arrayidx
  %cmp10 = icmp ne %struct.sn* %tmp9, null
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp11 = load i32* %i, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %tmp13 = load %struct.sn** %x, align 8
  %forward14 = getelementptr inbounds %struct.sn* %tmp13, i32 0, i32 1
  %tmp15 = load %struct.sn*** %forward14, align 8
  %arrayidx16 = getelementptr inbounds %struct.sn** %tmp15, i64 %idxprom12
  %tmp17 = load %struct.sn** %arrayidx16
  %value18 = getelementptr inbounds %struct.sn* %tmp17, i32 0, i32 0
  %tmp19 = load i32* %value18, align 4
  %tmp20 = load i32* %value.addr, align 4
  %cmp21 = icmp slt i32 %tmp19, %tmp20
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %1 = phi i1 [ false, %while.cond ], [ %cmp21, %land.rhs ]
  br i1 %1, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %tmp22 = load i32* %i, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %tmp24 = load %struct.sn** %x, align 8
  %forward25 = getelementptr inbounds %struct.sn* %tmp24, i32 0, i32 1
  %tmp26 = load %struct.sn*** %forward25, align 8
  %arrayidx27 = getelementptr inbounds %struct.sn** %tmp26, i64 %idxprom23
  %tmp28 = load %struct.sn** %arrayidx27
  store %struct.sn* %tmp28, %struct.sn** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %tmp29 = load %struct.sn** %x, align 8
  %tmp30 = load i32* %i, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %arrayidx32 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom31
  store %struct.sn* %tmp29, %struct.sn** %arrayidx32, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %tmp33 = load i32* %i, align 4
  %dec = add nsw i32 %tmp33, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp34 = load %struct.sn** %x, align 8
  %forward35 = getelementptr inbounds %struct.sn* %tmp34, i32 0, i32 1
  %tmp36 = load %struct.sn*** %forward35, align 8
  %arrayidx37 = getelementptr inbounds %struct.sn** %tmp36, i64 0
  %tmp38 = load %struct.sn** %arrayidx37
  store %struct.sn* %tmp38, %struct.sn** %x, align 8
  %tmp40 = load %struct.sn** %x, align 8
  %cmp41 = icmp eq %struct.sn* %tmp40, null
  br i1 %cmp41, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %tmp42 = load %struct.sn** %x, align 8
  %value43 = getelementptr inbounds %struct.sn* %tmp42, i32 0, i32 0
  %tmp44 = load i32* %value43, align 4
  %tmp45 = load i32* %value.addr, align 4
  %cmp46 = icmp ne i32 %tmp44, %tmp45
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %2 = phi i1 [ true, %for.end ], [ %cmp46, %lor.rhs ]
  %lor.ext = zext i1 %2 to i32
  store i32 %lor.ext, i32* %guard, align 4
  %tmp47 = load i32* %guard, align 4
  %tobool = icmp ne i32 %tmp47, 0
  br i1 %tobool, label %if.then, label %if.end113

if.then:                                          ; preds = %lor.end
  %call = call i32 @random_level()
  store i32 %call, i32* %lvl, align 4
  %tmp49 = load i32* %lvl, align 4
  %tmp50 = load %struct.SkipSet** %ss.addr, align 8
  %level51 = getelementptr inbounds %struct.SkipSet* %tmp50, i32 0, i32 1
  %tmp52 = load i32* %level51, align 4
  %cmp53 = icmp sgt i32 %tmp49, %tmp52
  br i1 %cmp53, label %if.then54, label %if.end

if.then54:                                        ; preds = %if.then
  %tmp55 = load %struct.SkipSet** %ss.addr, align 8
  %level56 = getelementptr inbounds %struct.SkipSet* %tmp55, i32 0, i32 1
  %tmp57 = load i32* %level56, align 4
  %add = add nsw i32 %tmp57, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc69, %if.then54
  %tmp59 = load i32* %i, align 4
  %tmp60 = load i32* %lvl, align 4
  %cmp61 = icmp sle i32 %tmp59, %tmp60
  br i1 %cmp61, label %for.body62, label %for.end71

for.body62:                                       ; preds = %for.cond58
  %tmp63 = load %struct.SkipSet** %ss.addr, align 8
  %header64 = getelementptr inbounds %struct.SkipSet* %tmp63, i32 0, i32 0
  %tmp65 = load %struct.sn** %header64, align 8
  %tmp66 = load i32* %i, align 4
  %idxprom67 = sext i32 %tmp66 to i64
  %arrayidx68 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom67
  store %struct.sn* %tmp65, %struct.sn** %arrayidx68, align 8
  br label %for.inc69

for.inc69:                                        ; preds = %for.body62
  %tmp70 = load i32* %i, align 4
  %inc = add nsw i32 %tmp70, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond58

for.end71:                                        ; preds = %for.cond58
  %tmp72 = load i32* %lvl, align 4
  %tmp73 = load %struct.SkipSet** %ss.addr, align 8
  %level74 = getelementptr inbounds %struct.SkipSet* %tmp73, i32 0, i32 1
  store i32 %tmp72, i32* %level74, align 4
  br label %if.end

if.end:                                           ; preds = %for.end71, %if.then
  %tmp75 = load i32* %lvl, align 4
  %tmp76 = load i32* %value.addr, align 4
  %call77 = call %struct.sn* @make_node(i32 %tmp75, i32 %tmp76)
  store %struct.sn* %call77, %struct.sn** %x, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc109, %if.end
  %tmp79 = load i32* %i, align 4
  %tmp80 = load i32* %lvl, align 4
  %cmp81 = icmp sle i32 %tmp79, %tmp80
  br i1 %cmp81, label %for.body82, label %for.end112

for.body82:                                       ; preds = %for.cond78
  %tmp83 = load i32* %i, align 4
  %idxprom84 = sext i32 %tmp83 to i64
  %tmp85 = load i32* %i, align 4
  %idxprom86 = sext i32 %tmp85 to i64
  %arrayidx87 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom86
  %tmp88 = load %struct.sn** %arrayidx87, align 8
  %forward89 = getelementptr inbounds %struct.sn* %tmp88, i32 0, i32 1
  %tmp90 = load %struct.sn*** %forward89, align 8
  %arrayidx91 = getelementptr inbounds %struct.sn** %tmp90, i64 %idxprom84
  %tmp92 = load %struct.sn** %arrayidx91
  %tmp93 = load i32* %i, align 4
  %idxprom94 = sext i32 %tmp93 to i64
  %tmp95 = load %struct.sn** %x, align 8
  %forward96 = getelementptr inbounds %struct.sn* %tmp95, i32 0, i32 1
  %tmp97 = load %struct.sn*** %forward96, align 8
  %arrayidx98 = getelementptr inbounds %struct.sn** %tmp97, i64 %idxprom94
  store %struct.sn* %tmp92, %struct.sn** %arrayidx98
  %tmp99 = load %struct.sn** %x, align 8
  %tmp100 = load i32* %i, align 4
  %idxprom101 = sext i32 %tmp100 to i64
  %tmp102 = load i32* %i, align 4
  %idxprom103 = sext i32 %tmp102 to i64
  %arrayidx104 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom103
  %tmp105 = load %struct.sn** %arrayidx104, align 8
  %forward106 = getelementptr inbounds %struct.sn* %tmp105, i32 0, i32 1
  %tmp107 = load %struct.sn*** %forward106, align 8
  %arrayidx108 = getelementptr inbounds %struct.sn** %tmp107, i64 %idxprom101
  store %struct.sn* %tmp99, %struct.sn** %arrayidx108
  br label %for.inc109

for.inc109:                                       ; preds = %for.body82
  %tmp110 = load i32* %i, align 4
  %inc111 = add nsw i32 %tmp110, 1
  store i32 %inc111, i32* %i, align 4
  br label %for.cond78

for.end112:                                       ; preds = %for.cond78
  br label %if.end113

if.end113:                                        ; preds = %for.end112, %lor.end
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @delete(%struct.SkipSet* %ss, i32 %value) nounwind uwtable {
entry:
  %ss.addr = alloca %struct.SkipSet*, align 8
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  %update = alloca [7 x %struct.sn*], align 16
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  store i32 %value, i32* %value.addr, align 4
  %tmp = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %tmp, i32 0, i32 0
  %tmp1 = load %struct.sn** %header, align 8
  store %struct.sn* %tmp1, %struct.sn** %x, align 8
  %arraydecay = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i32 0
  %0 = bitcast %struct.sn** %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 7, i32 1, i1 false)
  %tmp3 = load %struct.SkipSet** %ss.addr, align 8
  %level = getelementptr inbounds %struct.SkipSet* %tmp3, i32 0, i32 1
  %tmp4 = load i32* %level, align 4
  store i32 %tmp4, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp5 = load i32* %i, align 4
  %cmp = icmp sge i32 %tmp5, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %tmp7 = load %struct.sn** %x, align 8
  %forward = getelementptr inbounds %struct.sn* %tmp7, i32 0, i32 1
  %tmp8 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %tmp8, i64 %idxprom
  %tmp9 = load %struct.sn** %arrayidx
  %cmp10 = icmp ne %struct.sn* %tmp9, null
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp11 = load i32* %i, align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %tmp13 = load %struct.sn** %x, align 8
  %forward14 = getelementptr inbounds %struct.sn* %tmp13, i32 0, i32 1
  %tmp15 = load %struct.sn*** %forward14, align 8
  %arrayidx16 = getelementptr inbounds %struct.sn** %tmp15, i64 %idxprom12
  %tmp17 = load %struct.sn** %arrayidx16
  %value18 = getelementptr inbounds %struct.sn* %tmp17, i32 0, i32 0
  %tmp19 = load i32* %value18, align 4
  %tmp20 = load i32* %value.addr, align 4
  %cmp21 = icmp slt i32 %tmp19, %tmp20
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %1 = phi i1 [ false, %while.cond ], [ %cmp21, %land.rhs ]
  br i1 %1, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %tmp22 = load i32* %i, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %tmp24 = load %struct.sn** %x, align 8
  %forward25 = getelementptr inbounds %struct.sn* %tmp24, i32 0, i32 1
  %tmp26 = load %struct.sn*** %forward25, align 8
  %arrayidx27 = getelementptr inbounds %struct.sn** %tmp26, i64 %idxprom23
  %tmp28 = load %struct.sn** %arrayidx27
  store %struct.sn* %tmp28, %struct.sn** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %tmp29 = load %struct.sn** %x, align 8
  %tmp30 = load i32* %i, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %arrayidx32 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom31
  store %struct.sn* %tmp29, %struct.sn** %arrayidx32, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %tmp33 = load i32* %i, align 4
  %dec = add nsw i32 %tmp33, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp34 = load %struct.sn** %x, align 8
  %forward35 = getelementptr inbounds %struct.sn* %tmp34, i32 0, i32 1
  %tmp36 = load %struct.sn*** %forward35, align 8
  %arrayidx37 = getelementptr inbounds %struct.sn** %tmp36, i64 0
  %tmp38 = load %struct.sn** %arrayidx37
  store %struct.sn* %tmp38, %struct.sn** %x, align 8
  %tmp39 = load %struct.sn** %x, align 8
  %value40 = getelementptr inbounds %struct.sn* %tmp39, i32 0, i32 0
  %tmp41 = load i32* %value40, align 4
  %tmp42 = load i32* %value.addr, align 4
  %cmp43 = icmp eq i32 %tmp41, %tmp42
  br i1 %cmp43, label %if.then, label %if.end109

if.then:                                          ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc80, %if.then
  %tmp45 = load i32* %i, align 4
  %tmp46 = load %struct.SkipSet** %ss.addr, align 8
  %level47 = getelementptr inbounds %struct.SkipSet* %tmp46, i32 0, i32 1
  %tmp48 = load i32* %level47, align 4
  %cmp49 = icmp sle i32 %tmp45, %tmp48
  br i1 %cmp49, label %for.body50, label %for.end82

for.body50:                                       ; preds = %for.cond44
  %tmp51 = load i32* %i, align 4
  %idxprom52 = sext i32 %tmp51 to i64
  %tmp53 = load i32* %i, align 4
  %idxprom54 = sext i32 %tmp53 to i64
  %arrayidx55 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom54
  %tmp56 = load %struct.sn** %arrayidx55, align 8
  %forward57 = getelementptr inbounds %struct.sn* %tmp56, i32 0, i32 1
  %tmp58 = load %struct.sn*** %forward57, align 8
  %arrayidx59 = getelementptr inbounds %struct.sn** %tmp58, i64 %idxprom52
  %tmp60 = load %struct.sn** %arrayidx59
  %tmp61 = load %struct.sn** %x, align 8
  %cmp62 = icmp ne %struct.sn* %tmp60, %tmp61
  br i1 %cmp62, label %if.then63, label %if.end

if.then63:                                        ; preds = %for.body50
  br label %for.end82

if.end:                                           ; preds = %for.body50
  %tmp64 = load i32* %i, align 4
  %idxprom65 = sext i32 %tmp64 to i64
  %tmp66 = load %struct.sn** %x, align 8
  %forward67 = getelementptr inbounds %struct.sn* %tmp66, i32 0, i32 1
  %tmp68 = load %struct.sn*** %forward67, align 8
  %arrayidx69 = getelementptr inbounds %struct.sn** %tmp68, i64 %idxprom65
  %tmp70 = load %struct.sn** %arrayidx69
  %tmp71 = load i32* %i, align 4
  %idxprom72 = sext i32 %tmp71 to i64
  %tmp73 = load i32* %i, align 4
  %idxprom74 = sext i32 %tmp73 to i64
  %arrayidx75 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom74
  %tmp76 = load %struct.sn** %arrayidx75, align 8
  %forward77 = getelementptr inbounds %struct.sn* %tmp76, i32 0, i32 1
  %tmp78 = load %struct.sn*** %forward77, align 8
  %arrayidx79 = getelementptr inbounds %struct.sn** %tmp78, i64 %idxprom72
  store %struct.sn* %tmp70, %struct.sn** %arrayidx79
  br label %for.inc80

for.inc80:                                        ; preds = %if.end
  %tmp81 = load i32* %i, align 4
  %inc = add nsw i32 %tmp81, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond44

for.end82:                                        ; preds = %if.then63, %for.cond44
  %tmp83 = load %struct.sn** %x, align 8
  %2 = bitcast %struct.sn* %tmp83 to i8*
  call void @free(i8* %2) nounwind
  br label %while.cond84

while.cond84:                                     ; preds = %while.body103, %for.end82
  %tmp85 = load %struct.SkipSet** %ss.addr, align 8
  %level86 = getelementptr inbounds %struct.SkipSet* %tmp85, i32 0, i32 1
  %tmp87 = load i32* %level86, align 4
  %cmp88 = icmp sgt i32 %tmp87, 0
  br i1 %cmp88, label %land.rhs89, label %land.end102

land.rhs89:                                       ; preds = %while.cond84
  %tmp90 = load %struct.SkipSet** %ss.addr, align 8
  %level91 = getelementptr inbounds %struct.SkipSet* %tmp90, i32 0, i32 1
  %tmp92 = load i32* %level91, align 4
  %idxprom93 = sext i32 %tmp92 to i64
  %tmp94 = load %struct.SkipSet** %ss.addr, align 8
  %header95 = getelementptr inbounds %struct.SkipSet* %tmp94, i32 0, i32 0
  %tmp96 = load %struct.sn** %header95, align 8
  %forward97 = getelementptr inbounds %struct.sn* %tmp96, i32 0, i32 1
  %tmp98 = load %struct.sn*** %forward97, align 8
  %arrayidx99 = getelementptr inbounds %struct.sn** %tmp98, i64 %idxprom93
  %tmp100 = load %struct.sn** %arrayidx99
  %cmp101 = icmp eq %struct.sn* %tmp100, null
  br label %land.end102

land.end102:                                      ; preds = %land.rhs89, %while.cond84
  %3 = phi i1 [ false, %while.cond84 ], [ %cmp101, %land.rhs89 ]
  br i1 %3, label %while.body103, label %while.end108

while.body103:                                    ; preds = %land.end102
  %tmp104 = load %struct.SkipSet** %ss.addr, align 8
  %level105 = getelementptr inbounds %struct.SkipSet* %tmp104, i32 0, i32 1
  %tmp106 = load i32* %level105, align 4
  %dec107 = add nsw i32 %tmp106, -1
  store i32 %dec107, i32* %level105, align 4
  br label %while.cond84

while.end108:                                     ; preds = %land.end102
  br label %if.end109

if.end109:                                        ; preds = %while.end108, %for.end
  ret void
}

declare void @free(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ss = alloca %struct.SkipSet*, align 8
  store i32 0, i32* %retval
  %call = call %struct.SkipSet* @make_skipset()
  store %struct.SkipSet* %call, %struct.SkipSet** %ss, align 8
  %tmp = load %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %tmp)
  %tmp1 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %tmp1, i32 5)
  %tmp2 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %tmp2, i32 10)
  %tmp3 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %tmp3, i32 7)
  %tmp4 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %tmp4, i32 7)
  %tmp5 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %tmp5, i32 6)
  %tmp6 = load %struct.SkipSet** %ss, align 8
  %call7 = call i32 @contains(%struct.SkipSet* %tmp6, i32 7)
  %tobool = icmp ne i32 %call7, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp9 = load %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %tmp9)
  %tmp10 = load %struct.SkipSet** %ss, align 8
  call void @delete(%struct.SkipSet* %tmp10, i32 7)
  %tmp11 = load %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %tmp11)
  %tmp12 = load %struct.SkipSet** %ss, align 8
  %call13 = call i32 @contains(%struct.SkipSet* %tmp12, i32 7)
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.end17, label %if.then15

if.then15:                                        ; preds = %if.end
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0))
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end
  ret i32 0
}
