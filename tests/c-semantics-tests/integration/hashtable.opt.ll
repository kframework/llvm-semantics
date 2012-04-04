; ModuleID = '/home/david/src/c-semantics/tests/integration/hashtable.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashtbl = type { i64, %struct.hashnode_s**, i64 (i8*)* }
%struct.hashnode_s = type { i8*, i8*, %struct.hashnode_s* }

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
@str = private unnamed_addr constant [31 x i8] c"ERROR: hashtbl_create() failed\00"
@str27 = private unnamed_addr constant [14 x i8] c"After insert:\00"
@str28 = private unnamed_addr constant [14 x i8] c"After remove:\00"
@str29 = private unnamed_addr constant [14 x i8] c"After resize:\00"

define noalias %struct.hashtbl* @hashtbl_create(i64 %size, i64 (i8*)* %hashfunc) nounwind uwtable {
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
  store %struct.hashnode_s** %1, %struct.hashnode_s*** %2, align 8, !tbaa !0
  %tobool2 = icmp eq i8* %call1, null
  br i1 %tobool2, label %if.then3, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp13 = icmp eq i64 %size, 0
  br i1 %cmp13, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %3 = shl i64 %size, 3
  call void @llvm.memset.p0i8.i64(i8* %call1, i8 0, i64 %3, i32 8, i1 false)
  br label %for.end

if.then3:                                         ; preds = %if.end
  tail call void @free(i8* %call) nounwind
  br label %return

for.end:                                          ; preds = %for.cond.preheader, %for.body.lr.ph
  %size7 = bitcast i8* %call to i64*
  store i64 %size, i64* %size7, align 8, !tbaa !3
  %tobool8 = icmp eq i64 (i8*)* %hashfunc, null
  %hashfunc11 = getelementptr inbounds i8* %call, i64 16
  %4 = bitcast i8* %hashfunc11 to i64 (i8*)**
  br i1 %tobool8, label %if.else, label %if.then9

if.then9:                                         ; preds = %for.end
  store i64 (i8*)* %hashfunc, i64 (i8*)** %4, align 8, !tbaa !0
  br label %return

if.else:                                          ; preds = %for.end
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %4, align 8, !tbaa !0
  br label %return

return:                                           ; preds = %if.then9, %if.else, %entry, %if.then3
  %retval.0 = phi %struct.hashtbl* [ null, %if.then3 ], [ null, %entry ], [ %0, %if.else ], [ %0, %if.then9 ]
  ret %struct.hashtbl* %retval.0
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

declare void @free(i8* nocapture) nounwind

define internal i64 @def_hashfunc(i8* nocapture %key) nounwind uwtable readonly {
entry:
  %0 = load i8* %key, align 1, !tbaa !1
  %tobool1 = icmp eq i8 %0, 0
  br i1 %tobool1, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %1 = phi i8 [ %2, %while.body ], [ %0, %entry ]
  %key.addr.03 = phi i8* [ %incdec.ptr, %while.body ], [ %key, %entry ]
  %hash.02 = phi i64 [ %add, %while.body ], [ 0, %entry ]
  %incdec.ptr = getelementptr inbounds i8* %key.addr.03, i64 1
  %conv = zext i8 %1 to i64
  %add = add i64 %conv, %hash.02
  %2 = load i8* %incdec.ptr, align 1, !tbaa !1
  %tobool = icmp eq i8 %2, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %hash.0.lcssa = phi i64 [ 0, %entry ], [ %add, %while.body ]
  ret i64 %hash.0.lcssa
}

define void @hashtbl_destroy(%struct.hashtbl* nocapture %hashtbl) nounwind uwtable {
entry:
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %0 = load i64* %size, align 8, !tbaa !3
  %cmp4 = icmp eq i64 %0, 0
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %1 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  br i1 %cmp4, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %2 = phi i64 [ %9, %for.inc ], [ %0, %entry ]
  %3 = phi %struct.hashnode_s** [ %8, %for.inc ], [ %1, %entry ]
  %n.05 = phi i64 [ %inc, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %3, i64 %n.05
  %4 = load %struct.hashnode_s** %arrayidx, align 8, !tbaa !0
  %tobool2 = icmp eq %struct.hashnode_s* %4, null
  br i1 %tobool2, label %for.inc, label %while.body

while.body:                                       ; preds = %for.body, %while.body
  %node.03 = phi %struct.hashnode_s* [ %6, %while.body ], [ %4, %for.body ]
  %key = getelementptr inbounds %struct.hashnode_s* %node.03, i64 0, i32 0
  %5 = load i8** %key, align 8, !tbaa !0
  tail call void @free(i8* %5) nounwind
  %next = getelementptr inbounds %struct.hashnode_s* %node.03, i64 0, i32 2
  %6 = load %struct.hashnode_s** %next, align 8, !tbaa !0
  %7 = bitcast %struct.hashnode_s* %node.03 to i8*
  tail call void @free(i8* %7) nounwind
  %tobool = icmp eq %struct.hashnode_s* %6, null
  br i1 %tobool, label %while.cond.for.inc_crit_edge, label %while.body

while.cond.for.inc_crit_edge:                     ; preds = %while.body
  %.pre = load i64* %size, align 8, !tbaa !3
  %.pre7 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  br label %for.inc

for.inc:                                          ; preds = %while.cond.for.inc_crit_edge, %for.body
  %8 = phi %struct.hashnode_s** [ %.pre7, %while.cond.for.inc_crit_edge ], [ %3, %for.body ]
  %9 = phi i64 [ %.pre, %while.cond.for.inc_crit_edge ], [ %2, %for.body ]
  %inc = add i64 %n.05, 1
  %cmp = icmp ult i64 %inc, %9
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  %.lcssa = phi %struct.hashnode_s** [ %1, %entry ], [ %8, %for.inc ]
  %10 = bitcast %struct.hashnode_s** %.lcssa to i8*
  tail call void @free(i8* %10) nounwind
  %11 = bitcast %struct.hashtbl* %hashtbl to i8*
  tail call void @free(i8* %11) nounwind
  ret void
}

define i32 @hashtbl_insert(%struct.hashtbl* nocapture %hashtbl, i8* %key, i8* %data) nounwind uwtable {
entry:
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %0 = load i64 (i8*)** %hashfunc, align 8, !tbaa !0
  %call = tail call i64 %0(i8* %key) nounwind
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %1 = load i64* %size, align 8, !tbaa !3
  %rem = urem i64 %call, %1
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %2 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %2, i64 %rem
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %node.0.in = phi %struct.hashnode_s** [ %arrayidx, %entry ], [ %next, %while.body ]
  %node.0 = load %struct.hashnode_s** %node.0.in, align 8
  %tobool = icmp eq %struct.hashnode_s* %node.0, null
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %key1 = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 0
  %3 = load i8** %key1, align 8, !tbaa !0
  %call2 = tail call i32 @strcmp(i8* %3, i8* %key) nounwind
  %tobool3 = icmp eq i32 %call2, 0
  %next = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 2
  br i1 %tobool3, label %if.then, label %while.cond

if.then:                                          ; preds = %while.body
  %data4 = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 1
  store i8* %data, i8** %data4, align 8, !tbaa !0
  br label %return

while.end:                                        ; preds = %while.cond
  %call5 = tail call noalias i8* @malloc(i64 24) nounwind
  %4 = bitcast i8* %call5 to %struct.hashnode_s*
  %tobool6 = icmp eq i8* %call5, null
  br i1 %tobool6, label %return, label %if.end8

if.end8:                                          ; preds = %while.end
  %call.i = tail call i64 @strlen(i8* %key) nounwind readonly
  %add.i = add i64 %call.i, 1
  %call1.i = tail call noalias i8* @malloc(i64 %add.i) nounwind
  %tobool.i = icmp eq i8* %call1.i, null
  br i1 %tobool.i, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end8
  tail call void @free(i8* %call5) nounwind
  br label %return

if.end13:                                         ; preds = %if.end8
  %call2.i = tail call i8* @strcpy(i8* %call1.i, i8* %key) nounwind
  %key10 = bitcast i8* %call5 to i8**
  store i8* %call1.i, i8** %key10, align 8, !tbaa !0
  %data14 = getelementptr inbounds i8* %call5, i64 8
  %5 = bitcast i8* %data14 to i8**
  store i8* %data, i8** %5, align 8, !tbaa !0
  %6 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  %arrayidx16 = getelementptr inbounds %struct.hashnode_s** %6, i64 %rem
  %7 = load %struct.hashnode_s** %arrayidx16, align 8, !tbaa !0
  %next17 = getelementptr inbounds i8* %call5, i64 16
  %8 = bitcast i8* %next17 to %struct.hashnode_s**
  store %struct.hashnode_s* %7, %struct.hashnode_s** %8, align 8, !tbaa !0
  store %struct.hashnode_s* %4, %struct.hashnode_s** %arrayidx16, align 8, !tbaa !0
  br label %return

return:                                           ; preds = %while.end, %if.end13, %if.then12, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 0, %if.end13 ], [ -1, %if.then12 ], [ -1, %while.end ]
  ret i32 %retval.0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define i32 @hashtbl_remove(%struct.hashtbl* nocapture %hashtbl, i8* %key) nounwind uwtable {
entry:
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %0 = load i64 (i8*)** %hashfunc, align 8, !tbaa !0
  %call = tail call i64 %0(i8* %key) nounwind
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %1 = load i64* %size, align 8, !tbaa !3
  %rem = urem i64 %call, %1
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %2 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %2, i64 %rem
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %node.0.in = phi %struct.hashnode_s** [ %arrayidx, %entry ], [ %next12, %while.body ]
  %prevnode.0 = phi %struct.hashnode_s* [ null, %entry ], [ %node.0, %while.body ]
  %node.0 = load %struct.hashnode_s** %node.0.in, align 8
  %tobool = icmp eq %struct.hashnode_s* %node.0, null
  br i1 %tobool, label %return, label %while.body

while.body:                                       ; preds = %while.cond
  %key1 = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 0
  %3 = load i8** %key1, align 8, !tbaa !0
  %call2 = tail call i32 @strcmp(i8* %3, i8* %key) nounwind
  %tobool3 = icmp eq i32 %call2, 0
  %next12 = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 2
  br i1 %tobool3, label %if.then, label %while.cond

if.then:                                          ; preds = %while.body
  tail call void @free(i8* %3) nounwind
  %tobool5 = icmp eq %struct.hashnode_s* %prevnode.0, null
  %4 = load %struct.hashnode_s** %next12, align 8, !tbaa !0
  br i1 %tobool5, label %if.else, label %if.then6

if.then6:                                         ; preds = %if.then
  %next7 = getelementptr inbounds %struct.hashnode_s* %prevnode.0, i64 0, i32 2
  store %struct.hashnode_s* %4, %struct.hashnode_s** %next7, align 8, !tbaa !0
  br label %if.end

if.else:                                          ; preds = %if.then
  %5 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  %arrayidx10 = getelementptr inbounds %struct.hashnode_s** %5, i64 %rem
  store %struct.hashnode_s* %4, %struct.hashnode_s** %arrayidx10, align 8, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  %6 = bitcast %struct.hashnode_s* %node.0 to i8*
  tail call void @free(i8* %6) nounwind
  br label %return

return:                                           ; preds = %while.cond, %if.end
  %retval.0 = phi i32 [ 0, %if.end ], [ -1, %while.cond ]
  ret i32 %retval.0
}

define i8* @hashtbl_get(%struct.hashtbl* nocapture %hashtbl, i8* %key) nounwind uwtable {
entry:
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %0 = load i64 (i8*)** %hashfunc, align 8, !tbaa !0
  %call = tail call i64 %0(i8* %key) nounwind
  %size = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %1 = load i64* %size, align 8, !tbaa !3
  %rem = urem i64 %call, %1
  %nodes = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %2 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %2, i64 %rem
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %node.0.in = phi %struct.hashnode_s** [ %arrayidx, %entry ], [ %next, %while.body ]
  %node.0 = load %struct.hashnode_s** %node.0.in, align 8
  %tobool = icmp eq %struct.hashnode_s* %node.0, null
  br i1 %tobool, label %return, label %while.body

while.body:                                       ; preds = %while.cond
  %key1 = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 0
  %3 = load i8** %key1, align 8, !tbaa !0
  %call2 = tail call i32 @strcmp(i8* %3, i8* %key) nounwind
  %tobool3 = icmp eq i32 %call2, 0
  %next = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 2
  br i1 %tobool3, label %if.then, label %while.cond

if.then:                                          ; preds = %while.body
  %data = getelementptr inbounds %struct.hashnode_s* %node.0, i64 0, i32 1
  %4 = load i8** %data, align 8, !tbaa !0
  br label %return

return:                                           ; preds = %while.cond, %if.then
  %retval.0 = phi i8* [ %4, %if.then ], [ null, %while.cond ]
  ret i8* %retval.0
}

define i32 @hashtbl_resize(%struct.hashtbl* nocapture %hashtbl, i64 %size) nounwind uwtable {
entry:
  %newtbl = alloca %struct.hashtbl, align 8
  %size1 = getelementptr inbounds %struct.hashtbl* %newtbl, i64 0, i32 0
  store i64 %size, i64* %size1, align 8, !tbaa !3
  %hashfunc = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 2
  %0 = load i64 (i8*)** %hashfunc, align 8, !tbaa !0
  %hashfunc2 = getelementptr inbounds %struct.hashtbl* %newtbl, i64 0, i32 2
  store i64 (i8*)* %0, i64 (i8*)** %hashfunc2, align 8, !tbaa !0
  %call = call noalias i8* @calloc(i64 %size, i64 8) nounwind
  %1 = bitcast i8* %call to %struct.hashnode_s**
  %nodes = getelementptr inbounds %struct.hashtbl* %newtbl, i64 0, i32 1
  store %struct.hashnode_s** %1, %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp38 = icmp eq i64 %size, 0
  br i1 %cmp38, label %for.cond5.preheader, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %2 = shl i64 %size, 3
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 %2, i32 8, i1 false)
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond.preheader, %for.body.lr.ph
  %size6 = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 0
  %3 = load i64* %size6, align 8, !tbaa !3
  %cmp734 = icmp eq i64 %3, 0
  %nodes10 = getelementptr inbounds %struct.hashtbl* %hashtbl, i64 0, i32 1
  %4 = load %struct.hashnode_s*** %nodes10, align 8, !tbaa !0
  br i1 %cmp734, label %for.end23, label %for.body9

for.body9:                                        ; preds = %for.cond5.preheader, %for.inc21
  %5 = phi i64 [ %20, %for.inc21 ], [ %3, %for.cond5.preheader ]
  %6 = phi %struct.hashnode_s** [ %19, %for.inc21 ], [ %4, %for.cond5.preheader ]
  %n.035 = phi i64 [ %inc22, %for.inc21 ], [ 0, %for.cond5.preheader ]
  %arrayidx11 = getelementptr inbounds %struct.hashnode_s** %6, i64 %n.035
  %7 = load %struct.hashnode_s** %arrayidx11, align 8, !tbaa !0
  %tobool1331 = icmp eq %struct.hashnode_s* %7, null
  br i1 %tobool1331, label %for.inc21, label %for.body14

for.body14:                                       ; preds = %for.body9, %for.cond12.backedge
  %node.032 = phi %struct.hashnode_s* [ %8, %for.cond12.backedge ], [ %7, %for.body9 ]
  %next15 = getelementptr inbounds %struct.hashnode_s* %node.032, i64 0, i32 2
  %8 = load %struct.hashnode_s** %next15, align 8, !tbaa !0
  %key = getelementptr inbounds %struct.hashnode_s* %node.032, i64 0, i32 0
  %9 = load i8** %key, align 8, !tbaa !0
  %data = getelementptr inbounds %struct.hashnode_s* %node.032, i64 0, i32 1
  %10 = load i8** %data, align 8, !tbaa !0
  %call16 = call i32 @hashtbl_insert(%struct.hashtbl* %newtbl, i8* %9, i8* %10)
  %11 = load i8** %key, align 8, !tbaa !0
  %12 = load i64 (i8*)** %hashfunc, align 8, !tbaa !0
  %call.i = call i64 %12(i8* %11) nounwind
  %13 = load i64* %size6, align 8, !tbaa !3
  %rem.i = urem i64 %call.i, %13
  %14 = load %struct.hashnode_s*** %nodes10, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds %struct.hashnode_s** %14, i64 %rem.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %for.body14
  %node.0.in.i = phi %struct.hashnode_s** [ %arrayidx.i, %for.body14 ], [ %next12.i, %while.body.i ]
  %prevnode.0.i = phi %struct.hashnode_s* [ null, %for.body14 ], [ %node.0.i, %while.body.i ]
  %node.0.i = load %struct.hashnode_s** %node.0.in.i, align 8
  %tobool.i = icmp eq %struct.hashnode_s* %node.0.i, null
  br i1 %tobool.i, label %for.cond12.backedge, label %while.body.i

while.body.i:                                     ; preds = %while.cond.i
  %key1.i = getelementptr inbounds %struct.hashnode_s* %node.0.i, i64 0, i32 0
  %15 = load i8** %key1.i, align 8, !tbaa !0
  %call2.i = call i32 @strcmp(i8* %15, i8* %11) nounwind
  %tobool3.i = icmp eq i32 %call2.i, 0
  %next12.i = getelementptr inbounds %struct.hashnode_s* %node.0.i, i64 0, i32 2
  br i1 %tobool3.i, label %if.then.i, label %while.cond.i

if.then.i:                                        ; preds = %while.body.i
  call void @free(i8* %15) nounwind
  %tobool5.i = icmp eq %struct.hashnode_s* %prevnode.0.i, null
  %16 = load %struct.hashnode_s** %next12.i, align 8, !tbaa !0
  br i1 %tobool5.i, label %if.else.i, label %if.then6.i

if.then6.i:                                       ; preds = %if.then.i
  %next7.i = getelementptr inbounds %struct.hashnode_s* %prevnode.0.i, i64 0, i32 2
  store %struct.hashnode_s* %16, %struct.hashnode_s** %next7.i, align 8, !tbaa !0
  br label %if.end.i

if.else.i:                                        ; preds = %if.then.i
  %17 = load %struct.hashnode_s*** %nodes10, align 8, !tbaa !0
  %arrayidx10.i = getelementptr inbounds %struct.hashnode_s** %17, i64 %rem.i
  store %struct.hashnode_s* %16, %struct.hashnode_s** %arrayidx10.i, align 8, !tbaa !0
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then6.i
  %18 = bitcast %struct.hashnode_s* %node.0.i to i8*
  call void @free(i8* %18) nounwind
  br label %for.cond12.backedge

for.cond12.backedge:                              ; preds = %while.cond.i, %if.end.i
  %tobool13 = icmp eq %struct.hashnode_s* %8, null
  br i1 %tobool13, label %for.cond12.for.inc21_crit_edge, label %for.body14

for.cond12.for.inc21_crit_edge:                   ; preds = %for.cond12.backedge
  %.pre = load i64* %size6, align 8, !tbaa !3
  %.pre44 = load %struct.hashnode_s*** %nodes10, align 8, !tbaa !0
  br label %for.inc21

for.inc21:                                        ; preds = %for.cond12.for.inc21_crit_edge, %for.body9
  %19 = phi %struct.hashnode_s** [ %.pre44, %for.cond12.for.inc21_crit_edge ], [ %6, %for.body9 ]
  %20 = phi i64 [ %.pre, %for.cond12.for.inc21_crit_edge ], [ %5, %for.body9 ]
  %inc22 = add i64 %n.035, 1
  %cmp7 = icmp ult i64 %inc22, %20
  br i1 %cmp7, label %for.body9, label %for.end23

for.end23:                                        ; preds = %for.inc21, %for.cond5.preheader
  %.lcssa33 = phi %struct.hashnode_s** [ %4, %for.cond5.preheader ], [ %19, %for.inc21 ]
  %21 = bitcast %struct.hashnode_s** %.lcssa33 to i8*
  call void @free(i8* %21) nounwind
  %22 = load i64* %size1, align 8, !tbaa !3
  store i64 %22, i64* %size6, align 8, !tbaa !3
  %23 = load %struct.hashnode_s*** %nodes, align 8, !tbaa !0
  store %struct.hashnode_s** %23, %struct.hashnode_s*** %nodes10, align 8, !tbaa !0
  br label %return

return:                                           ; preds = %entry, %for.end23
  %retval.0 = phi i32 [ 0, %for.end23 ], [ -1, %entry ]
  ret i32 %retval.0
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
  store %struct.hashnode_s** %1, %struct.hashnode_s*** %2, align 8, !tbaa !0
  %tobool2.i = icmp eq i8* %call1.i, null
  br i1 %tobool2.i, label %if.then3.i, label %if.end

if.then3.i:                                       ; preds = %if.end.i
  tail call void @free(i8* %call.i) nounwind
  br label %if.then

if.then:                                          ; preds = %entry, %if.then3.i
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str, i64 0, i64 0))
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.end.i
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 0, i64 128, i32 8, i1 false) nounwind
  %size7.i = bitcast i8* %call.i to i64*
  store i64 16, i64* %size7.i, align 8, !tbaa !3
  %hashfunc11.i = getelementptr inbounds i8* %call.i, i64 16
  %3 = bitcast i8* %hashfunc11.i to i64 (i8*)**
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %3, align 8, !tbaa !0
  %call2 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0))
  %call3 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str4, i64 0, i64 0))
  %call4 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0))
  %call5 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str8, i64 0, i64 0))
  %call6 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str9, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str10, i64 0, i64 0))
  %call7 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str12, i64 0, i64 0))
  %call8 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str14, i64 0, i64 0))
  %call9 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str16, i64 0, i64 0))
  %call10 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([12 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str18, i64 0, i64 0))
  %call11 = tail call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([8 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str20, i64 0, i64 0))
  %puts126 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str27, i64 0, i64 0))
  %4 = load i64 (i8*)** %3, align 8, !tbaa !0
  %call.i41 = tail call i64 %4(i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind
  %5 = load i64* %size7.i, align 8, !tbaa !3
  %rem.i = urem i64 %call.i41, %5
  %6 = load %struct.hashnode_s*** %2, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds %struct.hashnode_s** %6, i64 %rem.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %if.end
  %node.0.in.i = phi %struct.hashnode_s** [ %arrayidx.i, %if.end ], [ %next.i, %while.body.i ]
  %node.0.i = load %struct.hashnode_s** %node.0.in.i, align 8
  %tobool.i43 = icmp eq %struct.hashnode_s* %node.0.i, null
  br i1 %tobool.i43, label %hashtbl_get.exit, label %while.body.i

while.body.i:                                     ; preds = %while.cond.i
  %key1.i = getelementptr inbounds %struct.hashnode_s* %node.0.i, i64 0, i32 0
  %7 = load i8** %key1.i, align 8, !tbaa !0
  %call2.i = tail call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind
  %tobool3.i = icmp eq i32 %call2.i, 0
  %next.i = getelementptr inbounds %struct.hashnode_s* %node.0.i, i64 0, i32 2
  br i1 %tobool3.i, label %if.then.i, label %while.cond.i

if.then.i:                                        ; preds = %while.body.i
  %data.i = getelementptr inbounds %struct.hashnode_s* %node.0.i, i64 0, i32 1
  %8 = load i8** %data.i, align 8, !tbaa !0
  br label %hashtbl_get.exit

hashtbl_get.exit:                                 ; preds = %while.cond.i, %if.then.i
  %retval.0.i44 = phi i8* [ %8, %if.then.i ], [ null, %while.cond.i ]
  %tobool14 = icmp ne i8* %retval.0.i44, null
  %cond = select i1 %tobool14, i8* %retval.0.i44, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i64 0, i64 0), i8* %cond) nounwind
  %call.i46 = tail call i64 %4(i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %rem.i48 = urem i64 %call.i46, %5
  %arrayidx.i50 = getelementptr inbounds %struct.hashnode_s** %6, i64 %rem.i48
  br label %while.cond.i54

while.cond.i54:                                   ; preds = %while.body.i59, %hashtbl_get.exit
  %node.0.in.i51 = phi %struct.hashnode_s** [ %arrayidx.i50, %hashtbl_get.exit ], [ %next.i58, %while.body.i59 ]
  %node.0.i52 = load %struct.hashnode_s** %node.0.in.i51, align 8
  %tobool.i53 = icmp eq %struct.hashnode_s* %node.0.i52, null
  br i1 %tobool.i53, label %hashtbl_get.exit63, label %while.body.i59

while.body.i59:                                   ; preds = %while.cond.i54
  %key1.i55 = getelementptr inbounds %struct.hashnode_s* %node.0.i52, i64 0, i32 0
  %9 = load i8** %key1.i55, align 8, !tbaa !0
  %call2.i56 = tail call i32 @strcmp(i8* %9, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %tobool3.i57 = icmp eq i32 %call2.i56, 0
  %next.i58 = getelementptr inbounds %struct.hashnode_s* %node.0.i52, i64 0, i32 2
  br i1 %tobool3.i57, label %if.then.i61, label %while.cond.i54

if.then.i61:                                      ; preds = %while.body.i59
  %data.i60 = getelementptr inbounds %struct.hashnode_s* %node.0.i52, i64 0, i32 1
  %10 = load i8** %data.i60, align 8, !tbaa !0
  br label %hashtbl_get.exit63

hashtbl_get.exit63:                               ; preds = %while.cond.i54, %if.then.i61
  %retval.0.i62 = phi i8* [ %10, %if.then.i61 ], [ null, %while.cond.i54 ]
  %tobool17 = icmp ne i8* %retval.0.i62, null
  %cond21 = select i1 %tobool17, i8* %retval.0.i62, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i64 0, i64 0), i8* %cond21) nounwind
  %call.i65 = tail call i64 %4(i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %rem.i67 = urem i64 %call.i65, %5
  %arrayidx.i69 = getelementptr inbounds %struct.hashnode_s** %6, i64 %rem.i67
  br label %while.cond.i73

while.cond.i73:                                   ; preds = %while.body.i77, %hashtbl_get.exit63
  %node.0.in.i70 = phi %struct.hashnode_s** [ %arrayidx.i69, %hashtbl_get.exit63 ], [ %next12.i, %while.body.i77 ]
  %prevnode.0.i = phi %struct.hashnode_s* [ null, %hashtbl_get.exit63 ], [ %node.0.i71, %while.body.i77 ]
  %node.0.i71 = load %struct.hashnode_s** %node.0.in.i70, align 8
  %tobool.i72 = icmp eq %struct.hashnode_s* %node.0.i71, null
  br i1 %tobool.i72, label %hashtbl_remove.exit, label %while.body.i77

while.body.i77:                                   ; preds = %while.cond.i73
  %key1.i74 = getelementptr inbounds %struct.hashnode_s* %node.0.i71, i64 0, i32 0
  %11 = load i8** %key1.i74, align 8, !tbaa !0
  %call2.i75 = tail call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %tobool3.i76 = icmp eq i32 %call2.i75, 0
  %next12.i = getelementptr inbounds %struct.hashnode_s* %node.0.i71, i64 0, i32 2
  br i1 %tobool3.i76, label %if.then.i78, label %while.cond.i73

if.then.i78:                                      ; preds = %while.body.i77
  tail call void @free(i8* %11) nounwind
  %tobool5.i = icmp eq %struct.hashnode_s* %prevnode.0.i, null
  %12 = load %struct.hashnode_s** %next12.i, align 8, !tbaa !0
  br i1 %tobool5.i, label %if.else.i, label %if.then6.i

if.then6.i:                                       ; preds = %if.then.i78
  %next7.i = getelementptr inbounds %struct.hashnode_s* %prevnode.0.i, i64 0, i32 2
  store %struct.hashnode_s* %12, %struct.hashnode_s** %next7.i, align 8, !tbaa !0
  br label %if.end.i79

if.else.i:                                        ; preds = %if.then.i78
  store %struct.hashnode_s* %12, %struct.hashnode_s** %arrayidx.i69, align 8, !tbaa !0
  br label %if.end.i79

if.end.i79:                                       ; preds = %if.else.i, %if.then6.i
  %13 = bitcast %struct.hashnode_s* %node.0.i71 to i8*
  tail call void @free(i8* %13) nounwind
  br label %hashtbl_remove.exit

hashtbl_remove.exit:                              ; preds = %while.cond.i73, %if.end.i79
  %puts127 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str28, i64 0, i64 0))
  %call.i82 = tail call i64 %4(i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %rem.i84 = urem i64 %call.i82, %5
  %arrayidx.i86 = getelementptr inbounds %struct.hashnode_s** %6, i64 %rem.i84
  br label %while.cond.i90

while.cond.i90:                                   ; preds = %while.body.i95, %hashtbl_remove.exit
  %node.0.in.i87 = phi %struct.hashnode_s** [ %arrayidx.i86, %hashtbl_remove.exit ], [ %next.i94, %while.body.i95 ]
  %node.0.i88 = load %struct.hashnode_s** %node.0.in.i87, align 8
  %tobool.i89 = icmp eq %struct.hashnode_s* %node.0.i88, null
  br i1 %tobool.i89, label %hashtbl_get.exit99, label %while.body.i95

while.body.i95:                                   ; preds = %while.cond.i90
  %key1.i91 = getelementptr inbounds %struct.hashnode_s* %node.0.i88, i64 0, i32 0
  %14 = load i8** %key1.i91, align 8, !tbaa !0
  %call2.i92 = tail call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([6 x i8]* @.str13, i64 0, i64 0)) nounwind
  %tobool3.i93 = icmp eq i32 %call2.i92, 0
  %next.i94 = getelementptr inbounds %struct.hashnode_s* %node.0.i88, i64 0, i32 2
  br i1 %tobool3.i93, label %if.then.i97, label %while.cond.i90

if.then.i97:                                      ; preds = %while.body.i95
  %data.i96 = getelementptr inbounds %struct.hashnode_s* %node.0.i88, i64 0, i32 1
  %15 = load i8** %data.i96, align 8, !tbaa !0
  br label %hashtbl_get.exit99

hashtbl_get.exit99:                               ; preds = %while.cond.i90, %if.then.i97
  %retval.0.i98 = phi i8* [ %15, %if.then.i97 ], [ null, %while.cond.i90 ]
  %tobool26 = icmp ne i8* %retval.0.i98, null
  %cond30 = select i1 %tobool26, i8* %retval.0.i98, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i64 0, i64 0), i8* %cond30) nounwind
  %call32 = tail call i32 @hashtbl_resize(%struct.hashtbl* %0, i64 8)
  %puts128 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str29, i64 0, i64 0))
  %16 = load i64 (i8*)** %3, align 8, !tbaa !0
  %call.i101 = tail call i64 %16(i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind
  %17 = load i64* %size7.i, align 8, !tbaa !3
  %rem.i103 = urem i64 %call.i101, %17
  %18 = load %struct.hashnode_s*** %2, align 8, !tbaa !0
  %arrayidx.i105 = getelementptr inbounds %struct.hashnode_s** %18, i64 %rem.i103
  br label %while.cond.i109

while.cond.i109:                                  ; preds = %while.body.i114, %hashtbl_get.exit99
  %node.0.in.i106 = phi %struct.hashnode_s** [ %arrayidx.i105, %hashtbl_get.exit99 ], [ %next.i113, %while.body.i114 ]
  %node.0.i107 = load %struct.hashnode_s** %node.0.in.i106, align 8
  %tobool.i108 = icmp eq %struct.hashnode_s* %node.0.i107, null
  br i1 %tobool.i108, label %hashtbl_get.exit118, label %while.body.i114

while.body.i114:                                  ; preds = %while.cond.i109
  %key1.i110 = getelementptr inbounds %struct.hashnode_s* %node.0.i107, i64 0, i32 0
  %19 = load i8** %key1.i110, align 8, !tbaa !0
  %call2.i111 = tail call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([6 x i8]* @.str11, i64 0, i64 0)) nounwind
  %tobool3.i112 = icmp eq i32 %call2.i111, 0
  %next.i113 = getelementptr inbounds %struct.hashnode_s* %node.0.i107, i64 0, i32 2
  br i1 %tobool3.i112, label %if.then.i116, label %while.cond.i109

if.then.i116:                                     ; preds = %while.body.i114
  %data.i115 = getelementptr inbounds %struct.hashnode_s* %node.0.i107, i64 0, i32 1
  %20 = load i8** %data.i115, align 8, !tbaa !0
  br label %hashtbl_get.exit118

hashtbl_get.exit118:                              ; preds = %while.cond.i109, %if.then.i116
  %retval.0.i117 = phi i8* [ %20, %if.then.i116 ], [ null, %while.cond.i109 ]
  %tobool35 = icmp ne i8* %retval.0.i117, null
  %cond39 = select i1 %tobool35, i8* %retval.0.i117, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i64 0, i64 0), i8* %cond39) nounwind
  %cmp4.i = icmp eq i64 %17, 0
  br i1 %cmp4.i, label %hashtbl_destroy.exit, label %for.body.i

for.body.i:                                       ; preds = %hashtbl_get.exit118, %for.inc.i
  %n.05.i = phi i64 [ %inc.i, %for.inc.i ], [ 0, %hashtbl_get.exit118 ]
  %arrayidx.i121 = getelementptr inbounds %struct.hashnode_s** %18, i64 %n.05.i
  %21 = load %struct.hashnode_s** %arrayidx.i121, align 8, !tbaa !0
  %tobool2.i122 = icmp eq %struct.hashnode_s* %21, null
  br i1 %tobool2.i122, label %for.inc.i, label %while.body.i125

while.body.i125:                                  ; preds = %for.body.i, %while.body.i125
  %node.03.i = phi %struct.hashnode_s* [ %23, %while.body.i125 ], [ %21, %for.body.i ]
  %key.i = getelementptr inbounds %struct.hashnode_s* %node.03.i, i64 0, i32 0
  %22 = load i8** %key.i, align 8, !tbaa !0
  tail call void @free(i8* %22) nounwind
  %next.i123 = getelementptr inbounds %struct.hashnode_s* %node.03.i, i64 0, i32 2
  %23 = load %struct.hashnode_s** %next.i123, align 8, !tbaa !0
  %24 = bitcast %struct.hashnode_s* %node.03.i to i8*
  tail call void @free(i8* %24) nounwind
  %tobool.i124 = icmp eq %struct.hashnode_s* %23, null
  br i1 %tobool.i124, label %for.inc.i, label %while.body.i125

for.inc.i:                                        ; preds = %while.body.i125, %for.body.i
  %inc.i = add i64 %n.05.i, 1
  %cmp.i = icmp ult i64 %inc.i, %17
  br i1 %cmp.i, label %for.body.i, label %hashtbl_destroy.exit

hashtbl_destroy.exit:                             ; preds = %for.inc.i, %hashtbl_get.exit118
  %25 = bitcast %struct.hashnode_s** %18 to i8*
  tail call void @free(i8* %25) nounwind
  tail call void @free(i8* %call.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @exit(i32) noreturn nounwind

declare i64 @strlen(i8* nocapture) nounwind readonly

declare i8* @strcpy(i8*, i8* nocapture) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long", metadata !1}
