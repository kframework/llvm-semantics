; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/reverse.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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

define %struct.list_el* @listAppend(%struct.list_el* %p, i32 %n) nounwind uwtable {
entry:
  %p.addr = alloca %struct.list_el*, align 8
  %n.addr = alloca i32, align 4
  %x = alloca %struct.list_el*, align 8
  %next13 = alloca %struct.list_el*, align 8
  store %struct.list_el* %p, %struct.list_el** %p.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %tmp = load %struct.list_el** %p.addr, align 8
  %cmp = icmp eq %struct.list_el* %tmp, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.list_el*
  store %struct.list_el* %0, %struct.list_el** %p.addr, align 8
  %tmp1 = load i32* %n.addr, align 4
  %tmp2 = load %struct.list_el** %p.addr, align 8
  %val = getelementptr inbounds %struct.list_el* %tmp2, i32 0, i32 0
  store i32 %tmp1, i32* %val, align 4
  %tmp3 = load %struct.list_el** %p.addr, align 8
  %next = getelementptr inbounds %struct.list_el* %tmp3, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %next, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp4 = load %struct.list_el** %p.addr, align 8
  store %struct.list_el* %tmp4, %struct.list_el** %x, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else
  %tmp5 = load %struct.list_el** %x, align 8
  %next6 = getelementptr inbounds %struct.list_el* %tmp5, i32 0, i32 1
  %tmp7 = load %struct.list_el** %next6, align 8
  %cmp8 = icmp ne %struct.list_el* %tmp7, null
  br i1 %cmp8, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp9 = load %struct.list_el** %x, align 8
  %next10 = getelementptr inbounds %struct.list_el* %tmp9, i32 0, i32 1
  %tmp11 = load %struct.list_el** %next10, align 8
  store %struct.list_el* %tmp11, %struct.list_el** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call14 = call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call14 to %struct.list_el*
  store %struct.list_el* %1, %struct.list_el** %next13, align 8
  %tmp15 = load %struct.list_el** %next13, align 8
  %tmp16 = load %struct.list_el** %x, align 8
  %next17 = getelementptr inbounds %struct.list_el* %tmp16, i32 0, i32 1
  store %struct.list_el* %tmp15, %struct.list_el** %next17, align 8
  %tmp18 = load i32* %n.addr, align 4
  %tmp19 = load %struct.list_el** %next13, align 8
  %val20 = getelementptr inbounds %struct.list_el* %tmp19, i32 0, i32 0
  store i32 %tmp18, i32* %val20, align 4
  %tmp21 = load %struct.list_el** %next13, align 8
  %next22 = getelementptr inbounds %struct.list_el* %tmp21, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %next22, align 8
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  %tmp23 = load %struct.list_el** %p.addr, align 8
  ret %struct.list_el* %tmp23
}

declare noalias i8* @malloc(i64) nounwind

define %struct.list_el* @listReverse(%struct.list_el* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.list_el*, align 8
  %x = alloca %struct.list_el*, align 8
  %tmp9 = alloca %struct.list_el*, align 8
  store %struct.list_el* %p, %struct.list_el** %p.addr, align 8
  %tmp = load %struct.list_el** %p.addr, align 8
  %cmp = icmp ne %struct.list_el* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load %struct.list_el** %p.addr, align 8
  %next = getelementptr inbounds %struct.list_el* %tmp2, i32 0, i32 1
  %tmp3 = load %struct.list_el** %next, align 8
  store %struct.list_el* %tmp3, %struct.list_el** %x, align 8
  %tmp4 = load %struct.list_el** %p.addr, align 8
  %next5 = getelementptr inbounds %struct.list_el* %tmp4, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %next5, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %tmp6 = load %struct.list_el** %x, align 8
  %cmp7 = icmp ne %struct.list_el* %tmp6, null
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp10 = load %struct.list_el** %x, align 8
  %next11 = getelementptr inbounds %struct.list_el* %tmp10, i32 0, i32 1
  %tmp12 = load %struct.list_el** %next11, align 8
  store %struct.list_el* %tmp12, %struct.list_el** %tmp9, align 8
  %tmp13 = load %struct.list_el** %p.addr, align 8
  %tmp14 = load %struct.list_el** %x, align 8
  %next15 = getelementptr inbounds %struct.list_el* %tmp14, i32 0, i32 1
  store %struct.list_el* %tmp13, %struct.list_el** %next15, align 8
  %tmp16 = load %struct.list_el** %x, align 8
  store %struct.list_el* %tmp16, %struct.list_el** %p.addr, align 8
  %tmp17 = load %struct.list_el** %tmp9, align 8
  store %struct.list_el* %tmp17, %struct.list_el** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %tmp18 = load %struct.list_el** %p.addr, align 8
  ret %struct.list_el* %tmp18
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %head = alloca %struct.list_el*, align 8
  %curr = alloca %struct.list_el*, align 8
  %first = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call %struct.list_el* @listAppend(%struct.list_el* null, i32 20)
  store %struct.list_el* %call, %struct.list_el** %head, align 8
  %tmp = load %struct.list_el** %head, align 8
  %call1 = call %struct.list_el* @listAppend(%struct.list_el* %tmp, i32 25)
  %tmp2 = load %struct.list_el** %head, align 8
  %call3 = call %struct.list_el* @listAppend(%struct.list_el* %tmp2, i32 15)
  %tmp4 = load %struct.list_el** %head, align 8
  %call5 = call %struct.list_el* @listAppend(%struct.list_el* %tmp4, i32 30)
  %tmp6 = load %struct.list_el** %head, align 8
  %call7 = call %struct.list_el* @listAppend(%struct.list_el* %tmp6, i32 10)
  %tmp8 = load %struct.list_el** %head, align 8
  %call9 = call %struct.list_el* @listAppend(%struct.list_el* %tmp8, i32 35)
  %tmp11 = load %struct.list_el** %head, align 8
  store %struct.list_el* %tmp11, %struct.list_el** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp12 = load %struct.list_el** %curr, align 8
  %cmp = icmp ne %struct.list_el* %tmp12, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp13 = load %struct.list_el** %curr, align 8
  %val = getelementptr inbounds %struct.list_el* %tmp13, i32 0, i32 0
  %tmp14 = load i32* %val, align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load %struct.list_el** %curr, align 8
  %next = getelementptr inbounds %struct.list_el* %tmp16, i32 0, i32 1
  %tmp17 = load %struct.list_el** %next, align 8
  store %struct.list_el* %tmp17, %struct.list_el** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %tmp20 = load %struct.list_el** %head, align 8
  %val21 = getelementptr inbounds %struct.list_el* %tmp20, i32 0, i32 0
  %tmp22 = load i32* %val21, align 4
  store i32 %tmp22, i32* %first, align 4
  %tmp23 = load %struct.list_el** %head, align 8
  %call24 = call %struct.list_el* @listReverse(%struct.list_el* %tmp23)
  store %struct.list_el* %call24, %struct.list_el** %head, align 8
  %tmp25 = load %struct.list_el** %head, align 8
  store %struct.list_el* %tmp25, %struct.list_el** %curr, align 8
  br label %while.cond26

while.cond26:                                     ; preds = %while.body29, %while.end
  %tmp27 = load %struct.list_el** %curr, align 8
  %cmp28 = icmp ne %struct.list_el* %tmp27, null
  br i1 %cmp28, label %while.body29, label %while.end37

while.body29:                                     ; preds = %while.cond26
  %tmp30 = load %struct.list_el** %curr, align 8
  %val31 = getelementptr inbounds %struct.list_el* %tmp30, i32 0, i32 0
  %tmp32 = load i32* %val31, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load %struct.list_el** %curr, align 8
  %next35 = getelementptr inbounds %struct.list_el* %tmp34, i32 0, i32 1
  %tmp36 = load %struct.list_el** %next35, align 8
  store %struct.list_el* %tmp36, %struct.list_el** %curr, align 8
  br label %while.cond26

while.end37:                                      ; preds = %while.cond26
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
