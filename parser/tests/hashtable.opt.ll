; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/hashtable.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashnode_s = type { i8*, i8*, %struct.hashnode_s* }
%struct.hashtbl = type { i64, %struct.hashnode_s**, i64 (i8*)* }

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
@.str22 = private unnamed_addr constant [11 x i8] c"Italy: %s\0A\00", align 1
@.str23 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str24 = private unnamed_addr constant [11 x i8] c"Spain: %s\0A\00", align 1
@str = internal constant [31 x i8] c"ERROR: hashtbl_create() failed\00"
@str1 = internal constant [14 x i8] c"After insert:\00"
@str2 = internal constant [14 x i8] c"After remove:\00"
@str3 = internal constant [14 x i8] c"After resize:\00"

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

define %struct.hashtbl* @hashtbl_create(i64 %size, i64 (i8*)* %hashfunc) nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call to %struct.hashtbl*
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %return, label %if.end

if.end:                                           ; preds = %entry
  %call1 = tail call noalias i8* @calloc(i64 %size, i64 8) nounwind
  %1 = bitcast i8* %call1 to %struct.hashnode_s**
  %nodes = getelementptr inbounds i8* %call, i64 8
  %2 = bitcast i8* %nodes to %struct.hashnode_s***
  store %struct.hashnode_s** %1, %struct.hashnode_s*** %2, align 8
  %tobool3 = icmp eq i8* %call1, null
  br i1 %tobool3, label %if.then4, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp1 = icmp eq i64 %size, 0
  br i1 %cmp1, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %tmp = shl i64 %size, 3
  call void @llvm.memset.p0i8.i64(i8* %call1, i8 0, i64 %tmp, i32 8, i1 false)
  br label %for.end

if.then4:                                         ; preds = %if.end
  tail call void @free(i8* %call) nounwind
  br label %return

for.end:                                          ; preds = %for.cond.preheader, %for.body.lr.ph
  %size18 = bitcast i8* %call to i64*
  store i64 %size, i64* %size18, align 8
  %tobool20 = icmp eq i64 (i8*)* %hashfunc, null
  %hashfunc26 = getelementptr inbounds i8* %call, i64 16
  %3 = bitcast i8* %hashfunc26 to i64 (i8*)**
  br i1 %tobool20, label %if.else, label %if.then21

if.then21:                                        ; preds = %for.end
  store i64 (i8*)* %hashfunc, i64 (i8*)** %3, align 8
  br label %return

if.else:                                          ; preds = %for.end
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %3, align 8
  br label %return

return:                                           ; preds = %if.then21, %if.else, %entry, %if.then4
  %4 = phi %struct.hashtbl* [ null, %if.then4 ], [ null, %entry ], [ %0, %if.else ], [ %0, %if.then21 ]
  ret %struct.hashtbl* %4
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

declare void @free(i8* nocapture) nounwind

define internal i64 @def_hashfunc(i8* %key) nounwind uwtable readonly {
entry:
  %tmp12 = load i8* %key, align 1
  %tobool3 = icmp eq i8 %tmp12, 0
  br i1 %tobool3, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %indvar = phi i64 [ %tmp, %while.body ], [ 0, %entry ]
  %tmp16 = phi i8 [ %tmp1, %while.body ], [ %tmp12, %entry ]
  %storemerge5 = phi i64 [ %add, %while.body ], [ 0, %entry ]
  %tmp = add i64 %indvar, 1
  %incdec.ptr = getelementptr i8* %key, i64 %tmp
  %conv = zext i8 %tmp16 to i64
  %add = add i64 %conv, %storemerge5
  %tmp1 = load i8* %incdec.ptr, align 1
  %tobool = icmp eq i8 %tmp1, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %storemerge.lcssa = phi i64 [ 0, %entry ], [ %add, %while.body ]
  ret i64 %storemerge.lcssa
}

define void @hashtbl_destroy(%struct.hashtbl* %hashtbl) nounwind uwtable {
entry:
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %tmp24 = load i64* %size, align 8
  %cmp5 = icmp eq i64 %tmp24, 0
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %tmp56 = load %struct.hashnode_s*** %nodes, align 8
  br i1 %cmp5, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %tmp210 = phi i64 [ %tmp2, %for.inc ], [ %tmp24, %entry ]
  %tmp58 = phi %struct.hashnode_s** [ %tmp5, %for.inc ], [ %tmp56, %entry ]
  %storemerge7 = phi i64 [ %inc, %for.inc ], [ 0, %entry ]
  %inc = add i64 %storemerge7, 1
  %arrayidx = getelementptr %struct.hashnode_s** %tmp58, i64 %storemerge7
  %tmp6 = load %struct.hashnode_s** %arrayidx, align 8
  %tobool2 = icmp eq %struct.hashnode_s* %tmp6, null
  br i1 %tobool2, label %for.inc, label %while.body

while.body:                                       ; preds = %for.body, %while.body
  %tmp1213 = phi %struct.hashnode_s* [ %tmp12, %while.body ], [ %tmp6, %for.body ]
  %key = getelementptr inbounds %struct.hashnode_s* %tmp1213, i64 0, i32 0
  %tmp9 = load i8** %key, align 8
  tail call void @free(i8* %tmp9) nounwind
  %next = getelementptr inbounds %struct.hashnode_s* %tmp1213, i64 0, i32 2
  %tmp12 = load %struct.hashnode_s** %next, align 8
  %0 = bitcast %struct.hashnode_s* %tmp1213 to i8*
  tail call void @free(i8* %0) nounwind
  %tobool = icmp eq %struct.hashnode_s* %tmp12, null
  br i1 %tobool, label %while.cond.for.inc_crit_edge, label %while.body

while.cond.for.inc_crit_edge:                     ; preds = %while.body
  %tmp2.pre = load i64* %size, align 8
  %tmp5.pre = load %struct.hashnode_s*** %nodes, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.cond.for.inc_crit_edge, %for.body
  %tmp5 = phi %struct.hashnode_s** [ %tmp5.pre, %while.cond.for.inc_crit_edge ], [ %tmp58, %for.body ]
  %tmp2 = phi i64 [ %tmp2.pre, %while.cond.for.inc_crit_edge ], [ %tmp210, %for.body ]
  %cmp = icmp ult i64 %inc, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  %tmp5.lcssa = phi %struct.hashnode_s** [ %tmp56, %entry ], [ %tmp5, %for.inc ]
  %1 = bitcast %struct.hashnode_s** %tmp5.lcssa to i8*
  tail call void @free(i8* %1) nounwind
  %2 = bitcast %struct.hashtbl* %hashtbl to i8*
  tail call void @free(i8* %2) nounwind
  ret void
}

define i32 @hashtbl_insert(%struct.hashtbl* %hashtbl, i8* %key, i8* %data) nounwind uwtable {
entry:
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %tmp1 = load i64 (i8*)** %hashfunc, align 8
  %call = tail call i64 %tmp1(i8* %key) nounwind
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %tmp4 = load i64* %size, align 8
  %rem = urem i64 %call, %tmp4
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %tmp7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp7, i64 %rem
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %storemerge.in = phi %struct.hashnode_s** [ %arrayidx, %entry ], [ %next, %if.end ]
  %storemerge = load %struct.hashnode_s** %storemerge.in, align 8
  %tobool = icmp eq %struct.hashnode_s* %storemerge, null
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %key11 = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 0
  %tmp12 = load i8** %key11, align 8
  %call14 = tail call i32 @strcmp(i8* %tmp12, i8* %key) nounwind readonly
  %tobool15 = icmp eq i32 %call14, 0
  br i1 %tobool15, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %data18 = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 1
  store i8* %data, i8** %data18, align 8
  br label %return

if.end:                                           ; preds = %while.body
  %next = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 2
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call21 = tail call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call21 to %struct.hashnode_s*
  %tobool22 = icmp eq i8* %call21, null
  br i1 %tobool22, label %return, label %if.end24

if.end24:                                         ; preds = %while.end
  %call.i = tail call i64 @strlen(i8* %key) nounwind readonly
  %add.i = add i64 %call.i, 1
  %call1.i = tail call noalias i8* @malloc(i64 %add.i) nounwind
  %tobool.i = icmp eq i8* %call1.i, null
  br i1 %tobool.i, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end24
  tail call void @free(i8* %call21) nounwind
  br label %return

if.end32:                                         ; preds = %if.end24
  %call4.i = tail call i8* @strcpy(i8* %call1.i, i8* %key) nounwind
  %key28 = bitcast i8* %call21 to i8**
  store i8* %call1.i, i8** %key28, align 8
  %data35 = getelementptr inbounds i8* %call21, i64 8
  %1 = bitcast i8* %data35 to i8**
  store i8* %data, i8** %1, align 8
  %tmp39 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx40 = getelementptr inbounds %struct.hashnode_s** %tmp39, i64 %rem
  %tmp41 = load %struct.hashnode_s** %arrayidx40, align 8
  %next43 = getelementptr inbounds i8* %call21, i64 16
  %2 = bitcast i8* %next43 to %struct.hashnode_s**
  store %struct.hashnode_s* %tmp41, %struct.hashnode_s** %2, align 8
  store %struct.hashnode_s* %0, %struct.hashnode_s** %arrayidx40, align 8
  br label %return

return:                                           ; preds = %while.end, %if.end32, %if.then30, %if.then
  %3 = phi i32 [ 0, %if.end32 ], [ -1, %if.then30 ], [ 0, %if.then ], [ -1, %while.end ]
  ret i32 %3
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define i32 @hashtbl_remove(%struct.hashtbl* %hashtbl, i8* %key) nounwind uwtable {
entry:
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %tmp1 = load i64 (i8*)** %hashfunc, align 8
  %call = tail call i64 %tmp1(i8* %key) nounwind
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %tmp4 = load i64* %size, align 8
  %rem = urem i64 %call, %tmp4
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %tmp7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp7, i64 %rem
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %entry
  %storemerge2 = phi %struct.hashnode_s* [ null, %entry ], [ %storemerge, %if.end35 ]
  %storemerge.in = phi %struct.hashnode_s** [ %arrayidx, %entry ], [ %next38, %if.end35 ]
  %storemerge = load %struct.hashnode_s** %storemerge.in, align 8
  %tobool = icmp eq %struct.hashnode_s* %storemerge, null
  br i1 %tobool, label %return, label %while.body

while.body:                                       ; preds = %while.cond
  %key11 = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 0
  %tmp12 = load i8** %key11, align 8
  %call14 = tail call i32 @strcmp(i8* %tmp12, i8* %key) nounwind readonly
  %tobool15 = icmp eq i32 %call14, 0
  br i1 %tobool15, label %if.then, label %if.end35

if.then:                                          ; preds = %while.body
  tail call void @free(i8* %tmp12) nounwind
  %tobool20 = icmp eq %struct.hashnode_s* %storemerge2, null
  %next27 = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 2
  %tmp28 = load %struct.hashnode_s** %next27, align 8
  br i1 %tobool20, label %if.else, label %if.then21

if.then21:                                        ; preds = %if.then
  %next25 = getelementptr inbounds %struct.hashnode_s* %storemerge2, i64 0, i32 2
  store %struct.hashnode_s* %tmp28, %struct.hashnode_s** %next25, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %tmp32 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx33 = getelementptr inbounds %struct.hashnode_s** %tmp32, i64 %rem
  store %struct.hashnode_s* %tmp28, %struct.hashnode_s** %arrayidx33, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then21
  %0 = bitcast %struct.hashnode_s* %storemerge to i8*
  tail call void @free(i8* %0) nounwind
  br label %return

if.end35:                                         ; preds = %while.body
  %next38 = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 2
  br label %while.cond

return:                                           ; preds = %while.cond, %if.end
  %storemerge1 = phi i32 [ 0, %if.end ], [ -1, %while.cond ]
  ret i32 %storemerge1
}

define i8* @hashtbl_get(%struct.hashtbl* %hashtbl, i8* %key) nounwind uwtable {
entry:
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %tmp1 = load i64 (i8*)** %hashfunc, align 8
  %call = tail call i64 %tmp1(i8* %key) nounwind
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %tmp4 = load i64* %size, align 8
  %rem = urem i64 %call, %tmp4
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %tmp7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %tmp7, i64 %rem
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %storemerge.in = phi %struct.hashnode_s** [ %arrayidx, %entry ], [ %next, %if.end ]
  %storemerge = load %struct.hashnode_s** %storemerge.in, align 8
  %tobool = icmp eq %struct.hashnode_s* %storemerge, null
  br i1 %tobool, label %return, label %while.body

while.body:                                       ; preds = %while.cond
  %key11 = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 0
  %tmp12 = load i8** %key11, align 8
  %call14 = tail call i32 @strcmp(i8* %tmp12, i8* %key) nounwind readonly
  %tobool15 = icmp eq i32 %call14, 0
  br i1 %tobool15, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %data = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 1
  %tmp17 = load i8** %data, align 8
  br label %return

if.end:                                           ; preds = %while.body
  %next = getelementptr inbounds %struct.hashnode_s* %storemerge, i64 0, i32 2
  br label %while.cond

return:                                           ; preds = %while.cond, %if.then
  %storemerge1 = phi i8* [ %tmp17, %if.then ], [ null, %while.cond ]
  ret i8* %storemerge1
}

define i32 @hashtbl_resize(%struct.hashtbl* %hashtbl, i64 %size) nounwind uwtable {
entry:
  %newtbl = alloca %struct.hashtbl, align 8
  %size1 = getelementptr inbounds %struct.hashtbl* %newtbl, i64 0, i32 0
  store i64 %size, i64* %size1, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %tmp3 = load i64 (i8*)** %hashfunc, align 8
  %hashfunc4 = getelementptr inbounds %struct.hashtbl* %newtbl, i64 0, i32 2
  store i64 (i8*)* %tmp3, i64 (i8*)** %hashfunc4, align 8
  %call = call noalias i8* @calloc(i64 %size, i64 8) nounwind
  %0 = bitcast i8* %call to %struct.hashnode_s**
  %nodes = getelementptr inbounds %struct.hashtbl* %newtbl, i64 0, i32 1
  store %struct.hashnode_s** %0, %struct.hashnode_s*** %nodes, align 8
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp13 = icmp eq i64 %size, 0
  br i1 %cmp13, label %for.cond14.preheader, label %for.body

for.cond14.preheader:                             ; preds = %for.body, %for.cond.preheader
  %size17 = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %tmp186 = load i64* %size17, align 8
  %cmp197 = icmp eq i64 %tmp186, 0
  %nodes24 = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %tmp258 = load %struct.hashnode_s*** %nodes24, align 8
  br i1 %cmp197, label %for.end51, label %for.body21

for.body:                                         ; preds = %for.cond.preheader, %for.body.for.body_crit_edge
  %tmp12 = phi %struct.hashnode_s** [ %tmp12.pre, %for.body.for.body_crit_edge ], [ %0, %for.cond.preheader ]
  %indvar = phi i64 [ %indvar.next, %for.body.for.body_crit_edge ], [ 0, %for.cond.preheader ]
  %arrayidx = getelementptr %struct.hashnode_s** %tmp12, i64 %indvar
  store %struct.hashnode_s* null, %struct.hashnode_s** %arrayidx, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %size
  br i1 %exitcond, label %for.cond14.preheader, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %tmp12.pre = load %struct.hashnode_s*** %nodes, align 8
  br label %for.body

for.body21:                                       ; preds = %for.cond14.preheader, %for.inc48
  %tmp1817 = phi i64 [ %tmp18, %for.inc48 ], [ %tmp186, %for.cond14.preheader ]
  %tmp2510 = phi %struct.hashnode_s** [ %tmp25, %for.inc48 ], [ %tmp258, %for.cond14.preheader ]
  %storemerge19 = phi i64 [ %inc50, %for.inc48 ], [ 0, %for.cond14.preheader ]
  %inc50 = add i64 %storemerge19, 1
  %arrayidx26 = getelementptr %struct.hashnode_s** %tmp2510, i64 %storemerge19
  %tmp27 = load %struct.hashnode_s** %arrayidx26, align 8
  %tobool304 = icmp eq %struct.hashnode_s* %tmp27, null
  br i1 %tobool304, label %for.inc48, label %for.body31

for.body31:                                       ; preds = %for.body21, %for.body31
  %storemerge35 = phi %struct.hashnode_s* [ %tmp34, %for.body31 ], [ %tmp27, %for.body21 ]
  %next33 = getelementptr inbounds %struct.hashnode_s* %storemerge35, i64 0, i32 2
  %tmp34 = load %struct.hashnode_s** %next33, align 8
  %key = getelementptr inbounds %struct.hashnode_s* %storemerge35, i64 0, i32 0
  %tmp36 = load i8** %key, align 8
  %data = getelementptr inbounds %struct.hashnode_s* %storemerge35, i64 0, i32 1
  %tmp38 = load i8** %data, align 8
  %call39 = call i32 @hashtbl_insert(%struct.hashtbl* %newtbl, i8* %tmp36, i8* %tmp38)
  %tmp43 = load i8** %key, align 8
  %call44 = call i32 @hashtbl_remove(%struct.hashtbl* %hashtbl, i8* %tmp43)
  %tobool30 = icmp eq %struct.hashnode_s* %tmp34, null
  br i1 %tobool30, label %for.cond28.for.inc48_crit_edge, label %for.body31

for.cond28.for.inc48_crit_edge:                   ; preds = %for.body31
  %tmp18.pre = load i64* %size17, align 8
  %tmp25.pre = load %struct.hashnode_s*** %nodes24, align 8
  br label %for.inc48

for.inc48:                                        ; preds = %for.cond28.for.inc48_crit_edge, %for.body21
  %tmp25 = phi %struct.hashnode_s** [ %tmp25.pre, %for.cond28.for.inc48_crit_edge ], [ %tmp2510, %for.body21 ]
  %tmp18 = phi i64 [ %tmp18.pre, %for.cond28.for.inc48_crit_edge ], [ %tmp1817, %for.body21 ]
  %cmp19 = icmp ult i64 %inc50, %tmp18
  br i1 %cmp19, label %for.body21, label %for.end51

for.end51:                                        ; preds = %for.inc48, %for.cond14.preheader
  %tmp25.lcssa = phi %struct.hashnode_s** [ %tmp258, %for.cond14.preheader ], [ %tmp25, %for.inc48 ]
  %1 = bitcast %struct.hashnode_s** %tmp25.lcssa to i8*
  call void @free(i8* %1) nounwind
  %tmp56 = load i64* %size1, align 8
  store i64 %tmp56, i64* %size17, align 8
  %tmp60 = load %struct.hashnode_s*** %nodes, align 8
  store %struct.hashnode_s** %tmp60, %struct.hashnode_s*** %nodes24, align 8
  br label %return

return:                                           ; preds = %entry, %for.end51
  %storemerge2 = phi i32 [ 0, %for.end51 ], [ -1, %entry ]
  ret i32 %storemerge2
}

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call.i to %struct.hashtbl*
  %tobool.i = icmp eq i8* %call.i, null
  br i1 %tobool.i, label %if.then, label %if.end.i

if.end.i:                                         ; preds = %entry
  %call1.i = tail call noalias i8* @calloc(i64 16, i64 8) nounwind
  %1 = bitcast i8* %call1.i to %struct.hashnode_s**
  %nodes.i = getelementptr inbounds i8* %call.i, i64 8
  %2 = bitcast i8* %nodes.i to %struct.hashnode_s***
  store %struct.hashnode_s** %1, %struct.hashnode_s*** %2, align 8
  %tobool3.i = icmp eq i8* %call1.i, null
  br i1 %tobool3.i, label %if.then4.i, label %if.end

if.then4.i:                                       ; preds = %if.end.i
  tail call void @free(i8* %call.i) nounwind
  br label %if.then

if.then:                                          ; preds = %entry, %if.then4.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str, i64 0, i64 0))
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.end.i
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 0, i64 128, i32 8, i1 false) nounwind
  %size18.i = bitcast i8* %call.i to i64*
  store i64 16, i64* %size18.i, align 8
  %hashfunc26.i = getelementptr inbounds i8* %call.i, i64 16
  %3 = bitcast i8* %hashfunc26.i to i64 (i8*)**
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %3, align 8
  %call2 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0))
  %call4 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str4, i64 0, i64 0))
  %call6 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0))
  %call8 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str8, i64 0, i64 0))
  %call10 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str9, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str10, i64 0, i64 0))
  %call12 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str12, i64 0, i64 0))
  %call14 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str14, i64 0, i64 0))
  %call16 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str16, i64 0, i64 0))
  %call18 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([12 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str18, i64 0, i64 0))
  %call20 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str20, i64 0, i64 0))
  %puts80 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str1, i64 0, i64 0))
  %tmp1.i = load i64 (i8*)** %3, align 8
  %call.i1 = tail call i64 %tmp1.i(i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind
  %tmp4.i = load i64* %size18.i, align 8
  %rem.i = urem i64 %call.i1, %tmp4.i
  %tmp7.i = load %struct.hashnode_s*** %2, align 8
  %arrayidx.i = getelementptr inbounds %struct.hashnode_s** %tmp7.i, i64 %rem.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.end.i4, %if.end
  %storemerge.in.i = phi %struct.hashnode_s** [ %arrayidx.i, %if.end ], [ %next.i, %if.end.i4 ]
  %storemerge.i = load %struct.hashnode_s** %storemerge.in.i, align 8
  %tobool.i3 = icmp eq %struct.hashnode_s* %storemerge.i, null
  br i1 %tobool.i3, label %hashtbl_get.exit, label %while.body.i

while.body.i:                                     ; preds = %while.cond.i
  %key11.i = getelementptr inbounds %struct.hashnode_s* %storemerge.i, i64 0, i32 0
  %tmp12.i = load i8** %key11.i, align 8
  %call14.i = tail call i32 @strcmp(i8* %tmp12.i, i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind readonly
  %tobool15.i = icmp eq i32 %call14.i, 0
  br i1 %tobool15.i, label %if.then.i, label %if.end.i4

if.then.i:                                        ; preds = %while.body.i
  %data.i = getelementptr inbounds %struct.hashnode_s* %storemerge.i, i64 0, i32 1
  %tmp17.i = load i8** %data.i, align 8
  br label %hashtbl_get.exit

if.end.i4:                                        ; preds = %while.body.i
  %next.i = getelementptr inbounds %struct.hashnode_s* %storemerge.i, i64 0, i32 2
  br label %while.cond.i

hashtbl_get.exit:                                 ; preds = %while.cond.i, %if.then.i
  %storemerge1.i = phi i8* [ %tmp17.i, %if.then.i ], [ null, %while.cond.i ]
  %tobool25 = icmp eq i8* %storemerge1.i, null
  %cond = select i1 %tobool25, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0), i8* %storemerge1.i
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i64 0, i64 0), i8* %cond) nounwind
  %tmp1.i6 = load i64 (i8*)** %3, align 8
  %call.i7 = tail call i64 %tmp1.i6(i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %tmp4.i9 = load i64* %size18.i, align 8
  %rem.i10 = urem i64 %call.i7, %tmp4.i9
  %tmp7.i12 = load %struct.hashnode_s*** %2, align 8
  %arrayidx.i13 = getelementptr inbounds %struct.hashnode_s** %tmp7.i12, i64 %rem.i10
  br label %while.cond.i17

while.cond.i17:                                   ; preds = %if.end.i27, %hashtbl_get.exit
  %storemerge.in.i14 = phi %struct.hashnode_s** [ %arrayidx.i13, %hashtbl_get.exit ], [ %next.i26, %if.end.i27 ]
  %storemerge.i15 = load %struct.hashnode_s** %storemerge.in.i14, align 8
  %tobool.i16 = icmp eq %struct.hashnode_s* %storemerge.i15, null
  br i1 %tobool.i16, label %hashtbl_get.exit29, label %while.body.i22

while.body.i22:                                   ; preds = %while.cond.i17
  %key11.i18 = getelementptr inbounds %struct.hashnode_s* %storemerge.i15, i64 0, i32 0
  %tmp12.i19 = load i8** %key11.i18, align 8
  %call14.i20 = tail call i32 @strcmp(i8* %tmp12.i19, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind readonly
  %tobool15.i21 = icmp eq i32 %call14.i20, 0
  br i1 %tobool15.i21, label %if.then.i25, label %if.end.i27

if.then.i25:                                      ; preds = %while.body.i22
  %data.i23 = getelementptr inbounds %struct.hashnode_s* %storemerge.i15, i64 0, i32 1
  %tmp17.i24 = load i8** %data.i23, align 8
  br label %hashtbl_get.exit29

if.end.i27:                                       ; preds = %while.body.i22
  %next.i26 = getelementptr inbounds %struct.hashnode_s* %storemerge.i15, i64 0, i32 2
  br label %while.cond.i17

hashtbl_get.exit29:                               ; preds = %while.cond.i17, %if.then.i25
  %storemerge1.i28 = phi i8* [ %tmp17.i24, %if.then.i25 ], [ null, %while.cond.i17 ]
  %tobool31 = icmp eq i8* %storemerge1.i28, null
  %cond36 = select i1 %tobool31, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0), i8* %storemerge1.i28
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i64 0, i64 0), i8* %cond36) nounwind
  %call39 = tail call i32 @hashtbl_remove(%struct.hashtbl* %0, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0))
  %puts81 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str2, i64 0, i64 0))
  %tmp1.i31 = load i64 (i8*)** %3, align 8
  %call.i32 = tail call i64 %tmp1.i31(i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %tmp4.i34 = load i64* %size18.i, align 8
  %rem.i35 = urem i64 %call.i32, %tmp4.i34
  %tmp7.i37 = load %struct.hashnode_s*** %2, align 8
  %arrayidx.i38 = getelementptr inbounds %struct.hashnode_s** %tmp7.i37, i64 %rem.i35
  br label %while.cond.i42

while.cond.i42:                                   ; preds = %if.end.i52, %hashtbl_get.exit29
  %storemerge.in.i39 = phi %struct.hashnode_s** [ %arrayidx.i38, %hashtbl_get.exit29 ], [ %next.i51, %if.end.i52 ]
  %storemerge.i40 = load %struct.hashnode_s** %storemerge.in.i39, align 8
  %tobool.i41 = icmp eq %struct.hashnode_s* %storemerge.i40, null
  br i1 %tobool.i41, label %hashtbl_get.exit54, label %while.body.i47

while.body.i47:                                   ; preds = %while.cond.i42
  %key11.i43 = getelementptr inbounds %struct.hashnode_s* %storemerge.i40, i64 0, i32 0
  %tmp12.i44 = load i8** %key11.i43, align 8
  %call14.i45 = tail call i32 @strcmp(i8* %tmp12.i44, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind readonly
  %tobool15.i46 = icmp eq i32 %call14.i45, 0
  br i1 %tobool15.i46, label %if.then.i50, label %if.end.i52

if.then.i50:                                      ; preds = %while.body.i47
  %data.i48 = getelementptr inbounds %struct.hashnode_s* %storemerge.i40, i64 0, i32 1
  %tmp17.i49 = load i8** %data.i48, align 8
  br label %hashtbl_get.exit54

if.end.i52:                                       ; preds = %while.body.i47
  %next.i51 = getelementptr inbounds %struct.hashnode_s* %storemerge.i40, i64 0, i32 2
  br label %while.cond.i42

hashtbl_get.exit54:                               ; preds = %while.cond.i42, %if.then.i50
  %storemerge1.i53 = phi i8* [ %tmp17.i49, %if.then.i50 ], [ null, %while.cond.i42 ]
  %tobool44 = icmp eq i8* %storemerge1.i53, null
  %cond49 = select i1 %tobool44, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0), i8* %storemerge1.i53
  %call50 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i64 0, i64 0), i8* %cond49) nounwind
  %call52 = tail call i32 @hashtbl_resize(%struct.hashtbl* %0, i64 8)
  %puts82 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str3, i64 0, i64 0))
  %tmp1.i56 = load i64 (i8*)** %3, align 8
  %call.i57 = tail call i64 %tmp1.i56(i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind
  %tmp4.i59 = load i64* %size18.i, align 8
  %rem.i60 = urem i64 %call.i57, %tmp4.i59
  %tmp7.i62 = load %struct.hashnode_s*** %2, align 8
  %arrayidx.i63 = getelementptr inbounds %struct.hashnode_s** %tmp7.i62, i64 %rem.i60
  br label %while.cond.i67

while.cond.i67:                                   ; preds = %if.end.i77, %hashtbl_get.exit54
  %storemerge.in.i64 = phi %struct.hashnode_s** [ %arrayidx.i63, %hashtbl_get.exit54 ], [ %next.i76, %if.end.i77 ]
  %storemerge.i65 = load %struct.hashnode_s** %storemerge.in.i64, align 8
  %tobool.i66 = icmp eq %struct.hashnode_s* %storemerge.i65, null
  br i1 %tobool.i66, label %hashtbl_get.exit79, label %while.body.i72

while.body.i72:                                   ; preds = %while.cond.i67
  %key11.i68 = getelementptr inbounds %struct.hashnode_s* %storemerge.i65, i64 0, i32 0
  %tmp12.i69 = load i8** %key11.i68, align 8
  %call14.i70 = tail call i32 @strcmp(i8* %tmp12.i69, i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind readonly
  %tobool15.i71 = icmp eq i32 %call14.i70, 0
  br i1 %tobool15.i71, label %if.then.i75, label %if.end.i77

if.then.i75:                                      ; preds = %while.body.i72
  %data.i73 = getelementptr inbounds %struct.hashnode_s* %storemerge.i65, i64 0, i32 1
  %tmp17.i74 = load i8** %data.i73, align 8
  br label %hashtbl_get.exit79

if.end.i77:                                       ; preds = %while.body.i72
  %next.i76 = getelementptr inbounds %struct.hashnode_s* %storemerge.i65, i64 0, i32 2
  br label %while.cond.i67

hashtbl_get.exit79:                               ; preds = %while.cond.i67, %if.then.i75
  %storemerge1.i78 = phi i8* [ %tmp17.i74, %if.then.i75 ], [ null, %while.cond.i67 ]
  %tobool57 = icmp eq i8* %storemerge1.i78, null
  %cond62 = select i1 %tobool57, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0), i8* %storemerge1.i78
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i64 0, i64 0), i8* %cond62) nounwind
  tail call void @hashtbl_destroy(%struct.hashtbl* %0)
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @exit(i32) noreturn nounwind

declare i64 @strlen(i8* nocapture) nounwind readonly

declare i8* @strcpy(i8*, i8* nocapture) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @puts(i8* nocapture) nounwind
