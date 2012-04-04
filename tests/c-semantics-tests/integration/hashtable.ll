; ModuleID = '/home/david/src/c-semantics/tests/integration/hashtable.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashtbl = type { i64, %struct.hashnode_s**, i64 (i8*)* }
%struct.hashnode_s = type { i8*, i8*, %struct.hashnode_s* }

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
  %1 = load i64* %size.addr, align 8
  %call1 = call noalias i8* @calloc(i64 %1, i64 8) nounwind
  %2 = bitcast i8* %call1 to %struct.hashnode_s**
  %3 = load %struct.hashtbl** %hashtbl, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %3, i32 0, i32 1
  store %struct.hashnode_s** %2, %struct.hashnode_s*** %nodes, align 8
  %tobool2 = icmp ne %struct.hashnode_s** %2, null
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  %4 = load %struct.hashtbl** %hashtbl, align 8
  %5 = bitcast %struct.hashtbl* %4 to i8*
  call void @free(i8* %5) nounwind
  store %struct.hashtbl* null, %struct.hashtbl** %retval
  br label %return

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i32* %i, align 4
  %conv = sext i32 %6 to i64
  %7 = load i64* %size.addr, align 8
  %cmp = icmp ult i64 %conv, %7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %9 = load %struct.hashtbl** %hashtbl, align 8
  %nodes6 = getelementptr inbounds %struct.hashtbl* %9, i32 0, i32 1
  %10 = load %struct.hashnode_s*** %nodes6, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %10, i64 %idxprom
  store %struct.hashnode_s* null, %struct.hashnode_s** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i64* %size.addr, align 8
  %13 = load %struct.hashtbl** %hashtbl, align 8
  %size7 = getelementptr inbounds %struct.hashtbl* %13, i32 0, i32 0
  store i64 %12, i64* %size7, align 8
  %14 = load i64 (i8*)** %hashfunc.addr, align 8
  %tobool8 = icmp ne i64 (i8*)* %14, null
  br i1 %tobool8, label %if.then9, label %if.else

if.then9:                                         ; preds = %for.end
  %15 = load i64 (i8*)** %hashfunc.addr, align 8
  %16 = load %struct.hashtbl** %hashtbl, align 8
  %hashfunc10 = getelementptr inbounds %struct.hashtbl* %16, i32 0, i32 2
  store i64 (i8*)* %15, i64 (i8*)** %hashfunc10, align 8
  br label %if.end12

if.else:                                          ; preds = %for.end
  %17 = load %struct.hashtbl** %hashtbl, align 8
  %hashfunc11 = getelementptr inbounds %struct.hashtbl* %17, i32 0, i32 2
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %hashfunc11, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then9
  %18 = load %struct.hashtbl** %hashtbl, align 8
  store %struct.hashtbl* %18, %struct.hashtbl** %retval
  br label %return

return:                                           ; preds = %if.end12, %if.then3, %if.then
  %19 = load %struct.hashtbl** %retval
  ret %struct.hashtbl* %19
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
  %0 = load i8** %key.addr, align 8
  %1 = load i8* %0, align 1
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i8** %key.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %2, i32 1
  store i8* %incdec.ptr, i8** %key.addr, align 8
  %3 = load i8* %2, align 1
  %conv = zext i8 %3 to i64
  %4 = load i64* %hash, align 8
  %add = add i64 %4, %conv
  store i64 %add, i64* %hash, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i64* %hash, align 8
  ret i64 %5
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
  %0 = load i64* %n, align 8
  %1 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %1, i32 0, i32 0
  %2 = load i64* %size, align 8
  %cmp = icmp ult i64 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i64* %n, align 8
  %4 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %4, i32 0, i32 1
  %5 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %5, i64 %3
  %6 = load %struct.hashnode_s** %arrayidx, align 8
  store %struct.hashnode_s* %6, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %7 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %7, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load %struct.hashnode_s** %node, align 8
  %key = getelementptr inbounds %struct.hashnode_s* %8, i32 0, i32 0
  %9 = load i8** %key, align 8
  call void @free(i8* %9) nounwind
  %10 = load %struct.hashnode_s** %node, align 8
  store %struct.hashnode_s* %10, %struct.hashnode_s** %oldnode, align 8
  %11 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %11, i32 0, i32 2
  %12 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %12, %struct.hashnode_s** %node, align 8
  %13 = load %struct.hashnode_s** %oldnode, align 8
  %14 = bitcast %struct.hashnode_s* %13 to i8*
  call void @free(i8* %14) nounwind
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %15 = load i64* %n, align 8
  %inc = add i64 %15, 1
  store i64 %inc, i64* %n, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes1 = getelementptr inbounds %struct.hashtbl* %16, i32 0, i32 1
  %17 = load %struct.hashnode_s*** %nodes1, align 8
  %18 = bitcast %struct.hashnode_s** %17 to i8*
  call void @free(i8* %18) nounwind
  %19 = load %struct.hashtbl** %hashtbl.addr, align 8
  %20 = bitcast %struct.hashtbl* %19 to i8*
  call void @free(i8* %20) nounwind
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
  %0 = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %0, i32 0, i32 2
  %1 = load i64 (i8*)** %hashfunc, align 8
  %2 = load i8** %key.addr, align 8
  %call = call i64 %1(i8* %2)
  %3 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %3, i32 0, i32 0
  %4 = load i64* %size, align 8
  %rem = urem i64 %call, %4
  store i64 %rem, i64* %hash, align 8
  %5 = load i64* %hash, align 8
  %6 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %6, i32 0, i32 1
  %7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %7, i64 %5
  %8 = load %struct.hashnode_s** %arrayidx, align 8
  store %struct.hashnode_s* %8, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %9 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load %struct.hashnode_s** %node, align 8
  %key1 = getelementptr inbounds %struct.hashnode_s* %10, i32 0, i32 0
  %11 = load i8** %key1, align 8
  %12 = load i8** %key.addr, align 8
  %call2 = call i32 @strcmp(i8* %11, i8* %12) nounwind readonly
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %13 = load i8** %data.addr, align 8
  %14 = load %struct.hashnode_s** %node, align 8
  %data4 = getelementptr inbounds %struct.hashnode_s* %14, i32 0, i32 1
  store i8* %13, i8** %data4, align 8
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %while.body
  %15 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %15, i32 0, i32 2
  %16 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %16, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call5 = call noalias i8* @malloc(i64 24) nounwind
  %17 = bitcast i8* %call5 to %struct.hashnode_s*
  store %struct.hashnode_s* %17, %struct.hashnode_s** %node, align 8
  %tobool6 = icmp ne %struct.hashnode_s* %17, null
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %while.end
  store i32 -1, i32* %retval
  br label %return

if.end8:                                          ; preds = %while.end
  %18 = load i8** %key.addr, align 8
  %call9 = call i8* @mystrdup(i8* %18)
  %19 = load %struct.hashnode_s** %node, align 8
  %key10 = getelementptr inbounds %struct.hashnode_s* %19, i32 0, i32 0
  store i8* %call9, i8** %key10, align 8
  %tobool11 = icmp ne i8* %call9, null
  br i1 %tobool11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end8
  %20 = load %struct.hashnode_s** %node, align 8
  %21 = bitcast %struct.hashnode_s* %20 to i8*
  call void @free(i8* %21) nounwind
  store i32 -1, i32* %retval
  br label %return

if.end13:                                         ; preds = %if.end8
  %22 = load i8** %data.addr, align 8
  %23 = load %struct.hashnode_s** %node, align 8
  %data14 = getelementptr inbounds %struct.hashnode_s* %23, i32 0, i32 1
  store i8* %22, i8** %data14, align 8
  %24 = load i64* %hash, align 8
  %25 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes15 = getelementptr inbounds %struct.hashtbl* %25, i32 0, i32 1
  %26 = load %struct.hashnode_s*** %nodes15, align 8
  %arrayidx16 = getelementptr inbounds %struct.hashnode_s** %26, i64 %24
  %27 = load %struct.hashnode_s** %arrayidx16, align 8
  %28 = load %struct.hashnode_s** %node, align 8
  %next17 = getelementptr inbounds %struct.hashnode_s* %28, i32 0, i32 2
  store %struct.hashnode_s* %27, %struct.hashnode_s** %next17, align 8
  %29 = load %struct.hashnode_s** %node, align 8
  %30 = load i64* %hash, align 8
  %31 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes18 = getelementptr inbounds %struct.hashtbl* %31, i32 0, i32 1
  %32 = load %struct.hashnode_s*** %nodes18, align 8
  %arrayidx19 = getelementptr inbounds %struct.hashnode_s** %32, i64 %30
  store %struct.hashnode_s* %29, %struct.hashnode_s** %arrayidx19, align 8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end13, %if.then12, %if.then7, %if.then
  %33 = load i32* %retval
  ret i32 %33
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

define internal i8* @mystrdup(i8* %s) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %0 = load i8** %s.addr, align 8
  %call = call i64 @strlen(i8* %0) nounwind readonly
  %add = add i64 %call, 1
  %call1 = call noalias i8* @malloc(i64 %add) nounwind
  store i8* %call1, i8** %b, align 8
  %tobool = icmp ne i8* %call1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8** %b, align 8
  %2 = load i8** %s.addr, align 8
  %call2 = call i8* @strcpy(i8* %1, i8* %2) nounwind
  %3 = load i8** %b, align 8
  store i8* %3, i8** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i8** %retval
  ret i8* %4
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
  %0 = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %0, i32 0, i32 2
  %1 = load i64 (i8*)** %hashfunc, align 8
  %2 = load i8** %key.addr, align 8
  %call = call i64 %1(i8* %2)
  %3 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %3, i32 0, i32 0
  %4 = load i64* %size, align 8
  %rem = urem i64 %call, %4
  store i64 %rem, i64* %hash, align 8
  %5 = load i64* %hash, align 8
  %6 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %6, i32 0, i32 1
  %7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %7, i64 %5
  %8 = load %struct.hashnode_s** %arrayidx, align 8
  store %struct.hashnode_s* %8, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end11, %entry
  %9 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load %struct.hashnode_s** %node, align 8
  %key1 = getelementptr inbounds %struct.hashnode_s* %10, i32 0, i32 0
  %11 = load i8** %key1, align 8
  %12 = load i8** %key.addr, align 8
  %call2 = call i32 @strcmp(i8* %11, i8* %12) nounwind readonly
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.end11, label %if.then

if.then:                                          ; preds = %while.body
  %13 = load %struct.hashnode_s** %node, align 8
  %key4 = getelementptr inbounds %struct.hashnode_s* %13, i32 0, i32 0
  %14 = load i8** %key4, align 8
  call void @free(i8* %14) nounwind
  %15 = load %struct.hashnode_s** %prevnode, align 8
  %tobool5 = icmp ne %struct.hashnode_s* %15, null
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %16 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %16, i32 0, i32 2
  %17 = load %struct.hashnode_s** %next, align 8
  %18 = load %struct.hashnode_s** %prevnode, align 8
  %next7 = getelementptr inbounds %struct.hashnode_s* %18, i32 0, i32 2
  store %struct.hashnode_s* %17, %struct.hashnode_s** %next7, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %19 = load %struct.hashnode_s** %node, align 8
  %next8 = getelementptr inbounds %struct.hashnode_s* %19, i32 0, i32 2
  %20 = load %struct.hashnode_s** %next8, align 8
  %21 = load i64* %hash, align 8
  %22 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes9 = getelementptr inbounds %struct.hashtbl* %22, i32 0, i32 1
  %23 = load %struct.hashnode_s*** %nodes9, align 8
  %arrayidx10 = getelementptr inbounds %struct.hashnode_s** %23, i64 %21
  store %struct.hashnode_s* %20, %struct.hashnode_s** %arrayidx10, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  %24 = load %struct.hashnode_s** %node, align 8
  %25 = bitcast %struct.hashnode_s* %24 to i8*
  call void @free(i8* %25) nounwind
  store i32 0, i32* %retval
  br label %return

if.end11:                                         ; preds = %while.body
  %26 = load %struct.hashnode_s** %node, align 8
  store %struct.hashnode_s* %26, %struct.hashnode_s** %prevnode, align 8
  %27 = load %struct.hashnode_s** %node, align 8
  %next12 = getelementptr inbounds %struct.hashnode_s* %27, i32 0, i32 2
  %28 = load %struct.hashnode_s** %next12, align 8
  store %struct.hashnode_s* %28, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.end
  %29 = load i32* %retval
  ret i32 %29
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
  %0 = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %0, i32 0, i32 2
  %1 = load i64 (i8*)** %hashfunc, align 8
  %2 = load i8** %key.addr, align 8
  %call = call i64 %1(i8* %2)
  %3 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size = getelementptr inbounds %struct.hashtbl* %3, i32 0, i32 0
  %4 = load i64* %size, align 8
  %rem = urem i64 %call, %4
  store i64 %rem, i64* %hash, align 8
  %5 = load i64* %hash, align 8
  %6 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes = getelementptr inbounds %struct.hashtbl* %6, i32 0, i32 1
  %7 = load %struct.hashnode_s*** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %7, i64 %5
  %8 = load %struct.hashnode_s** %arrayidx, align 8
  store %struct.hashnode_s* %8, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %9 = load %struct.hashnode_s** %node, align 8
  %tobool = icmp ne %struct.hashnode_s* %9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load %struct.hashnode_s** %node, align 8
  %key1 = getelementptr inbounds %struct.hashnode_s* %10, i32 0, i32 0
  %11 = load i8** %key1, align 8
  %12 = load i8** %key.addr, align 8
  %call2 = call i32 @strcmp(i8* %11, i8* %12) nounwind readonly
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %13 = load %struct.hashnode_s** %node, align 8
  %data = getelementptr inbounds %struct.hashnode_s* %13, i32 0, i32 1
  %14 = load i8** %data, align 8
  store i8* %14, i8** %retval
  br label %return

if.end:                                           ; preds = %while.body
  %15 = load %struct.hashnode_s** %node, align 8
  %next = getelementptr inbounds %struct.hashnode_s* %15, i32 0, i32 2
  %16 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %16, %struct.hashnode_s** %node, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i8* null, i8** %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %17 = load i8** %retval
  ret i8* %17
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
  %0 = load i64* %size.addr, align 8
  %size1 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 0
  store i64 %0, i64* %size1, align 8
  %1 = load %struct.hashtbl** %hashtbl.addr, align 8
  %hashfunc = getelementptr inbounds %struct.hashtbl* %1, i32 0, i32 2
  %2 = load i64 (i8*)** %hashfunc, align 8
  %hashfunc2 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 2
  store i64 (i8*)* %2, i64 (i8*)** %hashfunc2, align 8
  %3 = load i64* %size.addr, align 8
  %call = call noalias i8* @calloc(i64 %3, i64 8) nounwind
  %4 = bitcast i8* %call to %struct.hashnode_s**
  %nodes = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  store %struct.hashnode_s** %4, %struct.hashnode_s*** %nodes, align 8
  %tobool = icmp ne %struct.hashnode_s** %4, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32* %i, align 4
  %conv = sext i32 %5 to i64
  %6 = load i64* %size.addr, align 8
  %cmp = icmp ult i64 %conv, %6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %nodes4 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  %8 = load %struct.hashnode_s*** %nodes4, align 8
  %arrayidx = getelementptr inbounds %struct.hashnode_s** %8, i64 %idxprom
  store %struct.hashnode_s* null, %struct.hashnode_s** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i64 0, i64* %n, align 8
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc21, %for.end
  %10 = load i64* %n, align 8
  %11 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size6 = getelementptr inbounds %struct.hashtbl* %11, i32 0, i32 0
  %12 = load i64* %size6, align 8
  %cmp7 = icmp ult i64 %10, %12
  br i1 %cmp7, label %for.body9, label %for.end23

for.body9:                                        ; preds = %for.cond5
  %13 = load i64* %n, align 8
  %14 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes10 = getelementptr inbounds %struct.hashtbl* %14, i32 0, i32 1
  %15 = load %struct.hashnode_s*** %nodes10, align 8
  %arrayidx11 = getelementptr inbounds %struct.hashnode_s** %15, i64 %13
  %16 = load %struct.hashnode_s** %arrayidx11, align 8
  store %struct.hashnode_s* %16, %struct.hashnode_s** %node, align 8
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc19, %for.body9
  %17 = load %struct.hashnode_s** %node, align 8
  %tobool13 = icmp ne %struct.hashnode_s* %17, null
  br i1 %tobool13, label %for.body14, label %for.end20

for.body14:                                       ; preds = %for.cond12
  %18 = load %struct.hashnode_s** %node, align 8
  %next15 = getelementptr inbounds %struct.hashnode_s* %18, i32 0, i32 2
  %19 = load %struct.hashnode_s** %next15, align 8
  store %struct.hashnode_s* %19, %struct.hashnode_s** %next, align 8
  %20 = load %struct.hashnode_s** %node, align 8
  %key = getelementptr inbounds %struct.hashnode_s* %20, i32 0, i32 0
  %21 = load i8** %key, align 8
  %22 = load %struct.hashnode_s** %node, align 8
  %data = getelementptr inbounds %struct.hashnode_s* %22, i32 0, i32 1
  %23 = load i8** %data, align 8
  %call16 = call i32 @hashtbl_insert(%struct.hashtbl* %newtbl, i8* %21, i8* %23)
  %24 = load %struct.hashtbl** %hashtbl.addr, align 8
  %25 = load %struct.hashnode_s** %node, align 8
  %key17 = getelementptr inbounds %struct.hashnode_s* %25, i32 0, i32 0
  %26 = load i8** %key17, align 8
  %call18 = call i32 @hashtbl_remove(%struct.hashtbl* %24, i8* %26)
  br label %for.inc19

for.inc19:                                        ; preds = %for.body14
  %27 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %27, %struct.hashnode_s** %node, align 8
  br label %for.cond12

for.end20:                                        ; preds = %for.cond12
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %28 = load i64* %n, align 8
  %inc22 = add i64 %28, 1
  store i64 %inc22, i64* %n, align 8
  br label %for.cond5

for.end23:                                        ; preds = %for.cond5
  %29 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes24 = getelementptr inbounds %struct.hashtbl* %29, i32 0, i32 1
  %30 = load %struct.hashnode_s*** %nodes24, align 8
  %31 = bitcast %struct.hashnode_s** %30 to i8*
  call void @free(i8* %31) nounwind
  %size25 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 0
  %32 = load i64* %size25, align 8
  %33 = load %struct.hashtbl** %hashtbl.addr, align 8
  %size26 = getelementptr inbounds %struct.hashtbl* %33, i32 0, i32 0
  store i64 %32, i64* %size26, align 8
  %nodes27 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  %34 = load %struct.hashnode_s*** %nodes27, align 8
  %35 = load %struct.hashtbl** %hashtbl.addr, align 8
  %nodes28 = getelementptr inbounds %struct.hashtbl* %35, i32 0, i32 1
  store %struct.hashnode_s** %34, %struct.hashnode_s*** %nodes28, align 8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end23, %if.then
  %36 = load i32* %retval
  ret i32 %36
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
  %0 = load %struct.hashtbl** %hashtbl, align 8
  %call2 = call i32 @hashtbl_insert(%struct.hashtbl* %0, i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  %1 = load %struct.hashtbl** %hashtbl, align 8
  %call3 = call i32 @hashtbl_insert(%struct.hashtbl* %1, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str4, i32 0, i32 0))
  %2 = load %struct.hashtbl** %hashtbl, align 8
  %call4 = call i32 @hashtbl_insert(%struct.hashtbl* %2, i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0))
  %3 = load %struct.hashtbl** %hashtbl, align 8
  %call5 = call i32 @hashtbl_insert(%struct.hashtbl* %3, i8* getelementptr inbounds ([8 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str8, i32 0, i32 0))
  %4 = load %struct.hashtbl** %hashtbl, align 8
  %call6 = call i32 @hashtbl_insert(%struct.hashtbl* %4, i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0))
  %5 = load %struct.hashtbl** %hashtbl, align 8
  %call7 = call i32 @hashtbl_insert(%struct.hashtbl* %5, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0))
  %6 = load %struct.hashtbl** %hashtbl, align 8
  %call8 = call i32 @hashtbl_insert(%struct.hashtbl* %6, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  %7 = load %struct.hashtbl** %hashtbl, align 8
  %call9 = call i32 @hashtbl_insert(%struct.hashtbl* %7, i8* getelementptr inbounds ([8 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str16, i32 0, i32 0))
  %8 = load %struct.hashtbl** %hashtbl, align 8
  %call10 = call i32 @hashtbl_insert(%struct.hashtbl* %8, i8* getelementptr inbounds ([12 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str18, i32 0, i32 0))
  %9 = load %struct.hashtbl** %hashtbl, align 8
  %call11 = call i32 @hashtbl_insert(%struct.hashtbl* %9, i8* getelementptr inbounds ([8 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str20, i32 0, i32 0))
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str21, i32 0, i32 0))
  %10 = load %struct.hashtbl** %hashtbl, align 8
  %call13 = call i8* @hashtbl_get(%struct.hashtbl* %10, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0))
  store i8* %call13, i8** %italy, align 8
  %11 = load i8** %italy, align 8
  %tobool14 = icmp ne i8* %11, null
  br i1 %tobool14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %12 = load i8** %italy, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %12, %cond.true ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false ]
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i32 0, i32 0), i8* %cond)
  %13 = load %struct.hashtbl** %hashtbl, align 8
  %call16 = call i8* @hashtbl_get(%struct.hashtbl* %13, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  store i8* %call16, i8** %spain, align 8
  %14 = load i8** %spain, align 8
  %tobool17 = icmp ne i8* %14, null
  br i1 %tobool17, label %cond.true18, label %cond.false19

cond.true18:                                      ; preds = %cond.end
  %15 = load i8** %spain, align 8
  br label %cond.end20

cond.false19:                                     ; preds = %cond.end
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true18
  %cond21 = phi i8* [ %15, %cond.true18 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false19 ]
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* %cond21)
  %16 = load %struct.hashtbl** %hashtbl, align 8
  %call23 = call i32 @hashtbl_remove(%struct.hashtbl* %16, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str25, i32 0, i32 0))
  %17 = load %struct.hashtbl** %hashtbl, align 8
  %call25 = call i8* @hashtbl_get(%struct.hashtbl* %17, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  store i8* %call25, i8** %spain, align 8
  %18 = load i8** %spain, align 8
  %tobool26 = icmp ne i8* %18, null
  br i1 %tobool26, label %cond.true27, label %cond.false28

cond.true27:                                      ; preds = %cond.end20
  %19 = load i8** %spain, align 8
  br label %cond.end29

cond.false28:                                     ; preds = %cond.end20
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false28, %cond.true27
  %cond30 = phi i8* [ %19, %cond.true27 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false28 ]
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* %cond30)
  %20 = load %struct.hashtbl** %hashtbl, align 8
  %call32 = call i32 @hashtbl_resize(%struct.hashtbl* %20, i64 8)
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str26, i32 0, i32 0))
  %21 = load %struct.hashtbl** %hashtbl, align 8
  %call34 = call i8* @hashtbl_get(%struct.hashtbl* %21, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0))
  store i8* %call34, i8** %italy, align 8
  %22 = load i8** %italy, align 8
  %tobool35 = icmp ne i8* %22, null
  br i1 %tobool35, label %cond.true36, label %cond.false37

cond.true36:                                      ; preds = %cond.end29
  %23 = load i8** %italy, align 8
  br label %cond.end38

cond.false37:                                     ; preds = %cond.end29
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false37, %cond.true36
  %cond39 = phi i8* [ %23, %cond.true36 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %cond.false37 ]
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i32 0, i32 0), i8* %cond39)
  %24 = load %struct.hashtbl** %hashtbl, align 8
  call void @hashtbl_destroy(%struct.hashtbl* %24)
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn nounwind

declare i64 @strlen(i8*) nounwind readonly

declare i8* @strcpy(i8*, i8*) nounwind
