; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/hashtable.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashnode_s = type { i8*, i8*, %struct.hashnode_s* }
%struct.hashtbl = type { i64, %struct.hashnode_s**, i64 (i8*)* }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: hashtbl_create() failed\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"France\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"Paris\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"England\00", align 1
@.str4 = private unnamed_addr constant [7 x i8] c"London\00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"Sweden\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"Stockholm\00", align 1
@.str7 = private unnamed_addr constant [8 x i8] c"Germany\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"Berlin\00", align 1
@.str9 = private unnamed_addr constant [7 x i8] c"Norway\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"Oslo\00", align 1
@.str11 = private unnamed_addr constant [6 x i8] c"Italy\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"Rome\00", align 1
@.str13 = private unnamed_addr constant [6 x i8] c"Spain\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"Madrid\00", align 1
@.str15 = private unnamed_addr constant [8 x i8] c"Estonia\00", align 1
@.str16 = private unnamed_addr constant [8 x i8] c"Tallinn\00", align 1
@.str17 = private unnamed_addr constant [12 x i8] c"Netherlands\00", align 1
@.str18 = private unnamed_addr constant [10 x i8] c"Amsterdam\00", align 1
@.str19 = private unnamed_addr constant [8 x i8] c"Ireland\00", align 1
@.str20 = private unnamed_addr constant [7 x i8] c"Dublin\00", align 1
@.str21 = private unnamed_addr constant [15 x i8] c"After insert:\0A\00", align 1
@.str22 = private unnamed_addr constant [11 x i8] c"Italy: %s\0A\00", align 1
@.str23 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str24 = private unnamed_addr constant [11 x i8] c"Spain: %s\0A\00", align 1
@.str25 = private unnamed_addr constant [15 x i8] c"After remove:\0A\00", align 1
@.str26 = private unnamed_addr constant [15 x i8] c"After resize:\0A\00", align 1

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

define %struct.hashtbl* @hashtbl_create(i64 %size, i64 (i8*)* %hashfunc) nounwind uwtable {
entry:
  %retval = alloca %struct.hashtbl*, align 8
  %size.addr = alloca i64, align 8
  %hashfunc.addr = alloca i64 (i8*)*, align 8
  %hashtbl = alloca %struct.hashtbl*, align 8
  %i = alloca i32, align 4
  store i64 %size, i64* %size.addr, align 8
  store i64 (i8*)* %hashfunc, i64 (i8*)** %hashfunc.addr, align 8
  %call = call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call to %struct.hashtbl*
  store %struct.hashtbl* %0, %struct.hashtbl** %hashtbl, align 8
  %tobool = icmp ne %struct.hashtbl* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.hashtbl* null, %struct.hashtbl** %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp = load i64* %size.addr, align 8
  %call1 = call noalias i8* @calloc(i64 %tmp, i64 8) nounwind
  %1 = bitcast i8* %call1 to %struct.hashnode_s**
  %tmp2 = load %struct.hashtbl** %hashtbl, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %tmp2, i32 0, i32 1
  store %struct.hashnode_s** %1, %struct.hashnode_s*** %nodes, align 8
  %tobool3 = icmp ne %struct.hashnode_s** %1, null
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.end
  %tmp5 = load %struct.hashtbl** %hashtbl, align 8
  %2 = bitcast %struct.hashtbl* %tmp5 to i8*
  call void @free(i8* %2) nounwind
  store %struct.hashtbl* null, %struct.hashtbl** %retval
  br label %return

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %tmp8 = load i32* %i, align 4
  %conv = sext i32 %tmp8 to i64
  %tmp9 = load i64* %size.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp11 = load i32* %i, align 4
  %idxprom = sext i32 %tmp11 to i64
  %tmp12 = load %struct.hashtbl** %hashtbl, align 8
  %nodes13 = getelementptr inbounds %struct.hashtbl* %tmp12, i32 0, i32 1
  %tmp14 = load %struct.hashnode_s*** %nodes13, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp14, i64 %idxprom
  store %struct.hashnode_s* null, %struct.hashnode_s** %arrayidx
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp15 = load i32* %i, align 4
  %inc = add nsw i32 %tmp15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp16 = load i64* %size.addr, align 8
  %tmp17 = load %struct.hashtbl** %hashtbl, align 8
  %size18 = getelementptr inbounds %struct.hashtbl* %tmp17, i32 0, i32 0
  store i64 %tmp16, i64* %size18, align 8
  %tmp19 = load i64 (i8*)** %hashfunc.addr, align 8
  %tobool20 = icmp ne i64 (i8*)* %tmp19, null
  br i1 %tobool20, label %if.then21, label %if.else

if.then21:                                        ; preds = %for.end
  %tmp22 = load i64 (i8*)** %hashfunc.addr, align 8
  %tmp23 = load %struct.hashtbl** %hashtbl, align 8
  %hashfunc24 = getelementptr inbounds %struct.hashtbl* %tmp23, i32 0, i32 2
  store i64 (i8*)* %tmp22, i64 (i8*)** %hashfunc24, align 8
  br label %if.end27

if.else:                                          ; preds = %for.end
  %tmp25 = load %struct.hashtbl** %hashtbl, align 8
  %hashfunc26 = getelementptr inbounds %struct.hashtbl* %tmp25, i32 0, i32 2
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %hashfunc26, align 8
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then21
  %tmp28 = load %struct.hashtbl** %hashtbl, align 8
  store %struct.hashtbl* %tmp28, %struct.hashtbl** %retval
  br label %return

return:                                           ; preds = %if.end27, %if.then4, %if.then
  %3 = load %struct.hashtbl** %retval
  ret %struct.hashtbl* %3
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

declare void @free(i8*) nounwind

define internal i64 @def_hashfunc(i8* %key) nounwind uwtable {
entry:
  %key.addr = alloca i8*, align 8
  %hash = alloca i64, align 8
  store i8* %key, i8** %key.addr, align 8
  store i64 0, i64* %hash, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i8** %key.addr, align 8
  %tmp1 = load i8* %tmp
  %tobool = icmp ne i8 %tmp1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp2 = load i8** %key.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp2, i32 1
  store i8* %incdec.ptr, i8** %key.addr, align 8
  %tmp3 = load i8* %tmp2
  %conv = zext i8 %tmp3 to i64
  %tmp4 = load i64* %hash, align 8
  %add = add i64 %tmp4, %conv
  store i64 %add, i64* %hash, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp5 = load i64* %hash, align 8
  ret i64 %tmp5
}

define void @hashtbl_destroy(%struct.hashtbl* %hashtbl) nounwind uwtable {
entry:
  %hashtbl.addr = alloca %struct.hashtbl*, align 8
  %n = alloca i64, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %oldnode = alloca %struct.hashnode_s*, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %hashtbl.addr, align 8
  store i64 0, i64* %n, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i64* %n, align 8
  %tmp1 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %tmp1, i32 0, i32 0
  %tmp2 = load i64* %size, align 8
  %cmp = icmp ult i64 %tmp, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i64* %n, align 8
  %tmp4 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %tmp4, i32 0, i32 1
  %tmp5 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp5, i64 %tmp3
  %tmp6 = load %struct.hashnode_s** %arrayidx
  store %struct.hashnode_s* %tmp6, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %tmp7 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %tmp7, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp8 = load %struct.hashnode_s** %node, align 8
  %key = getelementptr inbounds %struct.hashnode_s* %tmp8, i32 0, i32 0
  %tmp9 = load i8** %key, align 8
  call void @free(i8* %tmp9) nounwind
  %tmp10 = load %struct.hashnode_s** %node, align 8
  store %struct.hashnode_s* %tmp10, %struct.hashnode_s** %oldnode, align 8
  %tmp11 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %tmp11, i32 0, i32 2
  %tmp12 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %tmp12, %struct.hashnode_s** %node, align 8
  %tmp13 = load %struct.hashnode_s** %oldnode, align 8
  %0 = bitcast %struct.hashnode_s* %tmp13 to i8*
  call void @free(i8* %0) nounwind
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %tmp14 = load i64* %n, align 8
  %inc = add i64 %tmp14, 1
  store i64 %inc, i64* %n, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp15 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes16 = getelementptr inbounds %struct.hashtbl* %tmp15, i32 0, i32 1
  %tmp17 = load %struct.hashnode_s*** %nodes16, align 8
  %1 = bitcast %struct.hashnode_s** %tmp17 to i8*
  call void @free(i8* %1) nounwind
  %tmp18 = load %struct.hashtbl** %hashtbl.addr, align 8
  %2 = bitcast %struct.hashtbl* %tmp18 to i8*
  call void @free(i8* %2) nounwind
  ret void
}

define i32 @hashtbl_insert(%struct.hashtbl* %hashtbl, i8* %key, i8* %data) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %hashtbl.addr = alloca %struct.hashtbl*, align 8
  %key.addr = alloca i8*, align 8
  %data.addr = alloca i8*, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %hash = alloca i64, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %hashtbl.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  store i8* %data, i8** %data.addr, align 8
  %tmp = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %tmp, i32 0, i32 2
  %tmp1 = load i64 (i8*)** %hashfunc, align 8
  %tmp2 = load i8** %key.addr, align 8
  %call = call i64 %tmp1(i8* %tmp2)
  %tmp3 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %tmp3, i32 0, i32 0
  %tmp4 = load i64* %size, align 8
  %rem = urem i64 %call, %tmp4
  store i64 %rem, i64* %hash, align 8
  %tmp5 = load i64* %hash, align 8
  %tmp6 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %tmp6, i32 0, i32 1
  %tmp7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp7, i64 %tmp5
  %tmp8 = load %struct.hashnode_s** %arrayidx
  store %struct.hashnode_s* %tmp8, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp9 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %tmp9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp10 = load %struct.hashnode_s** %node, align 8
  %key11 = getelementptr inbounds %struct.hashnode_s* %tmp10, i32 0, i32 0
  %tmp12 = load i8** %key11, align 8
  %tmp13 = load i8** %key.addr, align 8
  %call14 = call i32 @strcmp(i8* %tmp12, i8* %tmp13) nounwind readonly
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %tmp16 = load i8** %data.addr, align 8
  %tmp17 = load %struct.hashnode_s** %node, align 8
  %data18 = getelementptr inbounds %struct.hashnode_s* %tmp17, i32 0, i32 1
  store i8* %tmp16, i8** %data18, align 8
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %while.body
  %tmp19 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %tmp19, i32 0, i32 2
  %tmp20 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %tmp20, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call21 = call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call21 to %struct.hashnode_s*
  store %struct.hashnode_s* %0, %struct.hashnode_s** %node, align 8
  %tobool22 = icmp ne %struct.hashnode_s* %0, null
  br i1 %tobool22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %while.end
  store i32 -1, i32* %retval
  br label %return

if.end24:                                         ; preds = %while.end
  %tmp25 = load i8** %key.addr, align 8
  %call26 = call i8* @mystrdup(i8* %tmp25)
  %tmp27 = load %struct.hashnode_s** %node, align 8
  %key28 = getelementptr inbounds %struct.hashnode_s* %tmp27, i32 0, i32 0
  store i8* %call26, i8** %key28, align 8
  %tobool29 = icmp ne i8* %call26, null
  br i1 %tobool29, label %if.end32, label %if.then30

if.then30:                                        ; preds = %if.end24
  %tmp31 = load %struct.hashnode_s** %node, align 8
  %1 = bitcast %struct.hashnode_s* %tmp31 to i8*
  call void @free(i8* %1) nounwind
  store i32 -1, i32* %retval
  br label %return

if.end32:                                         ; preds = %if.end24
  %tmp33 = load i8** %data.addr, align 8
  %tmp34 = load %struct.hashnode_s** %node, align 8
  %data35 = getelementptr inbounds %struct.hashnode_s* %tmp34, i32 0, i32 1
  store i8* %tmp33, i8** %data35, align 8
  %tmp36 = load i64* %hash, align 8
  %tmp37 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes38 = getelementptr inbounds %struct.hashtbl* %tmp37, i32 0, i32 1
  %tmp39 = load %struct.hashnode_s*** %nodes38, align 8
  %arrayidx40 = getelementptr inbounds %struct.hashnode_s** %tmp39, i64 %tmp36
  %tmp41 = load %struct.hashnode_s** %arrayidx40
  %tmp42 = load %struct.hashnode_s** %node, align 8
  %next43 = getelementptr inbounds %struct.hashnode_s* %tmp42, i32 0, i32 2
  store %struct.hashnode_s* %tmp41, %struct.hashnode_s** %next43, align 8
  %tmp44 = load %struct.hashnode_s** %node, align 8
  %tmp45 = load i64* %hash, align 8
  %tmp46 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes47 = getelementptr inbounds %struct.hashtbl* %tmp46, i32 0, i32 1
  %tmp48 = load %struct.hashnode_s*** %nodes47, align 8
  %arrayidx49 = getelementptr inbounds %struct.hashnode_s** %tmp48, i64 %tmp45
  store %struct.hashnode_s* %tmp44, %struct.hashnode_s** %arrayidx49
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end32, %if.then30, %if.then23, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

define internal i8* @mystrdup(i8* %s) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %tmp = load i8** %s.addr, align 8
  %call = call i64 @strlen(i8* %tmp) nounwind readonly
  %add = add i64 %call, 1
  %call1 = call noalias i8* @malloc(i64 %add) nounwind
  store i8* %call1, i8** %b, align 8
  %tobool = icmp ne i8* %call1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp2 = load i8** %b, align 8
  %tmp3 = load i8** %s.addr, align 8
  %call4 = call i8* @strcpy(i8* %tmp2, i8* %tmp3) nounwind
  %tmp5 = load i8** %b, align 8
  store i8* %tmp5, i8** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i8** %retval
  ret i8* %0
}

define i32 @hashtbl_remove(%struct.hashtbl* %hashtbl, i8* %key) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %hashtbl.addr = alloca %struct.hashtbl*, align 8
  %key.addr = alloca i8*, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %prevnode = alloca %struct.hashnode_s*, align 8
  %hash = alloca i64, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %hashtbl.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  store %struct.hashnode_s* null, %struct.hashnode_s** %prevnode, align 8
  %tmp = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %tmp, i32 0, i32 2
  %tmp1 = load i64 (i8*)** %hashfunc, align 8
  %tmp2 = load i8** %key.addr, align 8
  %call = call i64 %tmp1(i8* %tmp2)
  %tmp3 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %tmp3, i32 0, i32 0
  %tmp4 = load i64* %size, align 8
  %rem = urem i64 %call, %tmp4
  store i64 %rem, i64* %hash, align 8
  %tmp5 = load i64* %hash, align 8
  %tmp6 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %tmp6, i32 0, i32 1
  %tmp7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp7, i64 %tmp5
  %tmp8 = load %struct.hashnode_s** %arrayidx
  store %struct.hashnode_s* %tmp8, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %entry
  %tmp9 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %tmp9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp10 = load %struct.hashnode_s** %node, align 8
  %key11 = getelementptr inbounds %struct.hashnode_s* %tmp10, i32 0, i32 0
  %tmp12 = load i8** %key11, align 8
  %tmp13 = load i8** %key.addr, align 8
  %call14 = call i32 @strcmp(i8* %tmp12, i8* %tmp13) nounwind readonly
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.end35, label %if.then

if.then:                                          ; preds = %while.body
  %tmp16 = load %struct.hashnode_s** %node, align 8
  %key17 = getelementptr inbounds %struct.hashnode_s* %tmp16, i32 0, i32 0
  %tmp18 = load i8** %key17, align 8
  call void @free(i8* %tmp18) nounwind
  %tmp19 = load %struct.hashnode_s** %prevnode, align 8
  %tobool20 = icmp ne %struct.hashnode_s* %tmp19, null
  br i1 %tobool20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.then
  %tmp22 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %tmp22, i32 0, i32 2
  %tmp23 = load %struct.hashnode_s** %next, align 8
  %tmp24 = load %struct.hashnode_s** %prevnode, align 8
  %next25 = getelementptr inbounds %struct.hashnode_s* %tmp24, i32 0, i32 2
  store %struct.hashnode_s* %tmp23, %struct.hashnode_s** %next25, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %tmp26 = load %struct.hashnode_s** %node, align 8
  %next27 = getelementptr inbounds %struct.hashnode_s* %tmp26, i32 0, i32 2
  %tmp28 = load %struct.hashnode_s** %next27, align 8
  %tmp29 = load i64* %hash, align 8
  %tmp30 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes31 = getelementptr inbounds %struct.hashtbl* %tmp30, i32 0, i32 1
  %tmp32 = load %struct.hashnode_s*** %nodes31, align 8
  %arrayidx33 = getelementptr inbounds %struct.hashnode_s** %tmp32, i64 %tmp29
  store %struct.hashnode_s* %tmp28, %struct.hashnode_s** %arrayidx33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then21
  %tmp34 = load %struct.hashnode_s** %node, align 8
  %0 = bitcast %struct.hashnode_s* %tmp34 to i8*
  call void @free(i8* %0) nounwind
  store i32 0, i32* %retval
  br label %return

if.end35:                                         ; preds = %while.body
  %tmp36 = load %struct.hashnode_s** %node, align 8
  store %struct.hashnode_s* %tmp36, %struct.hashnode_s** %prevnode, align 8
  %tmp37 = load %struct.hashnode_s** %node, align 8
  %next38 = getelementptr inbounds %struct.hashnode_s* %tmp37, i32 0, i32 2
  %tmp39 = load %struct.hashnode_s** %next38, align 8
  store %struct.hashnode_s* %tmp39, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.end
  %1 = load i32* %retval
  ret i32 %1
}

define i8* @hashtbl_get(%struct.hashtbl* %hashtbl, i8* %key) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %hashtbl.addr = alloca %struct.hashtbl*, align 8
  %key.addr = alloca i8*, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %hash = alloca i64, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %hashtbl.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  %tmp = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %tmp, i32 0, i32 2
  %tmp1 = load i64 (i8*)** %hashfunc, align 8
  %tmp2 = load i8** %key.addr, align 8
  %call = call i64 %tmp1(i8* %tmp2)
  %tmp3 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %tmp3, i32 0, i32 0
  %tmp4 = load i64* %size, align 8
  %rem = urem i64 %call, %tmp4
  store i64 %rem, i64* %hash, align 8
  %tmp5 = load i64* %hash, align 8
  %tmp6 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %tmp6, i32 0, i32 1
  %tmp7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp7, i64 %tmp5
  %tmp8 = load %struct.hashnode_s** %arrayidx
  store %struct.hashnode_s* %tmp8, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp9 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %tmp9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp10 = load %struct.hashnode_s** %node, align 8
  %key11 = getelementptr inbounds %struct.hashnode_s* %tmp10, i32 0, i32 0
  %tmp12 = load i8** %key11, align 8
  %tmp13 = load i8** %key.addr, align 8
  %call14 = call i32 @strcmp(i8* %tmp12, i8* %tmp13) nounwind readonly
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %tmp16 = load %struct.hashnode_s** %node, align 8
  %data = getelementptr inbounds %struct.hashnode_s* %tmp16, i32 0, i32 1
  %tmp17 = load i8** %data, align 8
  store i8* %tmp17, i8** %retval
  br label %return

if.end:                                           ; preds = %while.body
  %tmp18 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %tmp18, i32 0, i32 2
  %tmp19 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %tmp19, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i8* null, i8** %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %0 = load i8** %retval
  ret i8* %0
}

define i32 @hashtbl_resize(%struct.hashtbl* %hashtbl, i64 %size) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %hashtbl.addr = alloca %struct.hashtbl*, align 8
  %size.addr = alloca i64, align 8
  %newtbl = alloca %struct.hashtbl, align 8
  %n = alloca i64, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %next = alloca %struct.hashnode_s*, align 8
  %i = alloca i32, align 4
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %hashtbl.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  %tmp = load i64* %size.addr, align 8
  %size1 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 0
  store i64 %tmp, i64* %size1, align 8
  %tmp2 = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %tmp2, i32 0, i32 2
  %tmp3 = load i64 (i8*)** %hashfunc, align 8
  %hashfunc4 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 2
  store i64 (i8*)* %tmp3, i64 (i8*)** %hashfunc4, align 8
  %tmp5 = load i64* %size.addr, align 8
  %call = call noalias i8* @calloc(i64 %tmp5, i64 8) nounwind
  %0 = bitcast i8* %call to %struct.hashnode_s**
  %nodes = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  store %struct.hashnode_s** %0, %struct.hashnode_s*** %nodes, align 8
  %tobool = icmp ne %struct.hashnode_s** %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp7 = load i32* %i, align 4
  %conv = sext i32 %tmp7 to i64
  %tmp8 = load i64* %size.addr, align 8
  %cmp = icmp ult i64 %conv, %tmp8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp10 = load i32* %i, align 4
  %idxprom = sext i32 %tmp10 to i64
  %nodes11 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  %tmp12 = load %struct.hashnode_s*** %nodes11, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp12, i64 %idxprom
  store %struct.hashnode_s* null, %struct.hashnode_s** %arrayidx
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i64 0, i64* %n, align 8
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc48, %for.end
  %tmp15 = load i64* %n, align 8
  %tmp16 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size17 = getelementptr inbounds %struct.hashtbl* %tmp16, i32 0, i32 0
  %tmp18 = load i64* %size17, align 8
  %cmp19 = icmp ult i64 %tmp15, %tmp18
  br i1 %cmp19, label %for.body21, label %for.end51

for.body21:                                       ; preds = %for.cond14
  %tmp22 = load i64* %n, align 8
  %tmp23 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes24 = getelementptr inbounds %struct.hashtbl* %tmp23, i32 0, i32 1
  %tmp25 = load %struct.hashnode_s*** %nodes24, align 8
  %arrayidx26 = getelementptr inbounds %struct.hashnode_s** %tmp25, i64 %tmp22
  %tmp27 = load %struct.hashnode_s** %arrayidx26
  store %struct.hashnode_s* %tmp27, %struct.hashnode_s** %node, align 8
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc45, %for.body21
  %tmp29 = load %struct.hashnode_s** %node, align 8
  %tobool30 = icmp ne %struct.hashnode_s* %tmp29, null
  br i1 %tobool30, label %for.body31, label %for.end47

for.body31:                                       ; preds = %for.cond28
  %tmp32 = load %struct.hashnode_s** %node, align 8
  %next33 = getelementptr inbounds %struct.hashnode_s* %tmp32, i32 0, i32 2
  %tmp34 = load %struct.hashnode_s** %next33, align 8
  store %struct.hashnode_s* %tmp34, %struct.hashnode_s** %next, align 8
  %tmp35 = load %struct.hashnode_s** %node, align 8
  %key = getelementptr inbounds %struct.hashnode_s* %tmp35, i32 0, i32 0
  %tmp36 = load i8** %key, align 8
  %tmp37 = load %struct.hashnode_s** %node, align 8
  %data = getelementptr inbounds %struct.hashnode_s* %tmp37, i32 0, i32 1
  %tmp38 = load i8** %data, align 8
  %call39 = call i32 @hashtbl_insert(%struct.hashtbl* %newtbl, i8* %tmp36, i8* %tmp38)
  %tmp40 = load %struct.hashtbl** %hashtbl.addr, align 8
  %tmp41 = load %struct.hashnode_s** %node, align 8
  %key42 = getelementptr inbounds %struct.hashnode_s* %tmp41, i32 0, i32 0
  %tmp43 = load i8** %key42, align 8
  %call44 = call i32 @hashtbl_remove(%struct.hashtbl* %tmp40, i8* %tmp43)
  br label %for.inc45

for.inc45:                                        ; preds = %for.body31
  %tmp46 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %tmp46, %struct.hashnode_s** %node, align 8
  br label %for.cond28

for.end47:                                        ; preds = %for.cond28
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47
  %tmp49 = load i64* %n, align 8
  %inc50 = add i64 %tmp49, 1
  store i64 %inc50, i64* %n, align 8
  br label %for.cond14

for.end51:                                        ; preds = %for.cond14
  %tmp52 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes53 = getelementptr inbounds %struct.hashtbl* %tmp52, i32 0, i32 1
  %tmp54 = load %struct.hashnode_s*** %nodes53, align 8
  %1 = bitcast %struct.hashnode_s** %tmp54 to i8*
  call void @free(i8* %1) nounwind
  %size55 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 0
  %tmp56 = load i64* %size55, align 8
  %tmp57 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size58 = getelementptr inbounds %struct.hashtbl* %tmp57, i32 0, i32 0
  store i64 %tmp56, i64* %size58, align 8
  %nodes59 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  %tmp60 = load %struct.hashnode_s*** %nodes59, align 8
  %tmp61 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes62 = getelementptr inbounds %struct.hashtbl* %tmp61, i32 0, i32 1
  store %struct.hashnode_s** %tmp60, %struct.hashnode_s*** %nodes62, align 8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end51, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %hashtbl = alloca %struct.hashtbl*, align 8
  %spain = alloca i8*, align 8
  %italy = alloca i8*, align 8
  store i32 0, i32* %retval
  %call = call %struct.hashtbl* @hashtbl_create(i64 16, i64 (i8*)* null)
  store %struct.hashtbl* %call, %struct.hashtbl** %hashtbl, align 8
  %tobool = icmp ne %struct.hashtbl* %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp = load %struct.hashtbl** %hashtbl, align 8
  %call2 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp, i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  %tmp3 = load %struct.hashtbl** %hashtbl, align 8
  %call4 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp3, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str4, i32 0, i32 0))
  %tmp5 = load %struct.hashtbl** %hashtbl, align 8
  %call6 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp5, i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0))
  %tmp7 = load %struct.hashtbl** %hashtbl, align 8
  %call8 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp7, i8* getelementptr inbounds ([8 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str8, i32 0, i32 0))
  %tmp9 = load %struct.hashtbl** %hashtbl, align 8
  %call10 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp9, i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0))
  %tmp11 = load %struct.hashtbl** %hashtbl, align 8
  %call12 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp11, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0))
  %tmp13 = load %struct.hashtbl** %hashtbl, align 8
  %call14 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp13, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  %tmp15 = load %struct.hashtbl** %hashtbl, align 8
  %call16 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp15, i8* getelementptr inbounds ([8 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str16, i32 0, i32 0))
  %tmp17 = load %struct.hashtbl** %hashtbl, align 8
  %call18 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp17, i8* getelementptr inbounds ([12 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str18, i32 0, i32 0))
  %tmp19 = load %struct.hashtbl** %hashtbl, align 8
  %call20 = call i32 @hashtbl_insert(%struct.hashtbl* %tmp19, i8* getelementptr inbounds ([8 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str20, i32 0, i32 0))
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str21, i32 0, i32 0))
  %tmp22 = load %struct.hashtbl** %hashtbl, align 8
  %call23 = call i8* @hashtbl_get(%struct.hashtbl* %tmp22, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0))
  store i8* %call23, i8** %italy, align 8
  %tmp24 = load i8** %italy, align 8
  %tobool25 = icmp ne i8* %tmp24, null
  br i1 %tobool25, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %tmp26 = load i8** %italy, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %tmp26, %cond.true ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false ]
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i32 0, i32 0), i8* %cond)
  %tmp28 = load %struct.hashtbl** %hashtbl, align 8
  %call29 = call i8* @hashtbl_get(%struct.hashtbl* %tmp28, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  store i8* %call29, i8** %spain, align 8
  %tmp30 = load i8** %spain, align 8
  %tobool31 = icmp ne i8* %tmp30, null
  br i1 %tobool31, label %cond.true32, label %cond.false34

cond.true32:                                      ; preds = %cond.end
  %tmp33 = load i8** %spain, align 8
  br label %cond.end35

cond.false34:                                     ; preds = %cond.end
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true32
  %cond36 = phi i8* [ %tmp33, %cond.true32 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false34 ]
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* %cond36)
  %tmp38 = load %struct.hashtbl** %hashtbl, align 8
  %call39 = call i32 @hashtbl_remove(%struct.hashtbl* %tmp38, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str25, i32 0, i32 0))
  %tmp41 = load %struct.hashtbl** %hashtbl, align 8
  %call42 = call i8* @hashtbl_get(%struct.hashtbl* %tmp41, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  store i8* %call42, i8** %spain, align 8
  %tmp43 = load i8** %spain, align 8
  %tobool44 = icmp ne i8* %tmp43, null
  br i1 %tobool44, label %cond.true45, label %cond.false47

cond.true45:                                      ; preds = %cond.end35
  %tmp46 = load i8** %spain, align 8
  br label %cond.end48

cond.false47:                                     ; preds = %cond.end35
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false47, %cond.true45
  %cond49 = phi i8* [ %tmp46, %cond.true45 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false47 ]
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* %cond49)
  %tmp51 = load %struct.hashtbl** %hashtbl, align 8
  %call52 = call i32 @hashtbl_resize(%struct.hashtbl* %tmp51, i64 8)
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str26, i32 0, i32 0))
  %tmp54 = load %struct.hashtbl** %hashtbl, align 8
  %call55 = call i8* @hashtbl_get(%struct.hashtbl* %tmp54, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0))
  store i8* %call55, i8** %italy, align 8
  %tmp56 = load i8** %italy, align 8
  %tobool57 = icmp ne i8* %tmp56, null
  br i1 %tobool57, label %cond.true58, label %cond.false60

cond.true58:                                      ; preds = %cond.end48
  %tmp59 = load i8** %italy, align 8
  br label %cond.end61

cond.false60:                                     ; preds = %cond.end48
  br label %cond.end61

cond.end61:                                       ; preds = %cond.false60, %cond.true58
  %cond62 = phi i8* [ %tmp59, %cond.true58 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false60 ]
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i32 0, i32 0), i8* %cond62)
  %tmp64 = load %struct.hashtbl** %hashtbl, align 8
  call void @hashtbl_destroy(%struct.hashtbl* %tmp64)
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn nounwind

declare i64 @strlen(i8*) nounwind readonly

declare i8* @strcpy(i8*, i8*) nounwind
