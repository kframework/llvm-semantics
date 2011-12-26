; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/schorr-waite.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.struct_node = type <{ i8, [7 x i8], %struct.struct_node*, %struct.struct_node*, i32, [4 x i8] }>

@counter = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"creating new node %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Setting left child of %d to %d\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"Setting right child of %d to %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"%d:m=%d:l=%d:r=%d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"Now running Schorr-Waite...\0A\00", align 1

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

define void @schorr_waite(%struct.struct_node* %root) nounwind uwtable {
entry:
  %root.addr = alloca %struct.struct_node*, align 8
  %t = alloca %struct.struct_node*, align 8
  %p = alloca %struct.struct_node*, align 8
  %q = alloca %struct.struct_node*, align 8
  %q24 = alloca %struct.struct_node*, align 8
  %q39 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %root, %struct.struct_node** %root.addr, align 8
  %tmp = load %struct.struct_node** %root.addr, align 8
  store %struct.struct_node* %tmp, %struct.struct_node** %t, align 8
  store %struct.struct_node* null, %struct.struct_node** %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end50, %entry
  %tmp2 = load %struct.struct_node** %p, align 8
  %cmp = icmp ne %struct.struct_node* %tmp2, null
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %tmp3 = load %struct.struct_node** %t, align 8
  %cmp4 = icmp ne %struct.struct_node* %tmp3, null
  br i1 %cmp4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %tmp5 = load %struct.struct_node** %t, align 8
  %0 = bitcast %struct.struct_node* %tmp5 to i32*
  %1 = load i32* %0, align 8
  %bf.clear = and i32 %1, 1
  %tobool = icmp ne i32 %bf.clear, 0
  %lnot = xor i1 %tobool, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %2 = phi i1 [ false, %lor.rhs ], [ %lnot, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %while.cond
  %3 = phi i1 [ true, %while.cond ], [ %2, %land.end ]
  br i1 %3, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %tmp6 = load %struct.struct_node** %t, align 8
  %cmp7 = icmp eq %struct.struct_node* %tmp6, null
  br i1 %cmp7, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %tmp8 = load %struct.struct_node** %t, align 8
  %4 = bitcast %struct.struct_node* %tmp8 to i32*
  %5 = load i32* %4, align 8
  %bf.clear9 = and i32 %5, 1
  %tobool10 = icmp ne i32 %bf.clear9, 0
  br i1 %tobool10, label %if.then, label %if.else37

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %tmp11 = load %struct.struct_node** %p, align 8
  %6 = bitcast %struct.struct_node* %tmp11 to i32*
  %7 = load i32* %6, align 8
  %8 = lshr i32 %7, 1
  %bf.clear12 = and i32 %8, 1
  %tobool13 = icmp ne i32 %bf.clear12, 0
  br i1 %tobool13, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.then
  %tmp16 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %tmp16, %struct.struct_node** %q, align 8
  %tmp17 = load %struct.struct_node** %p, align 8
  store %struct.struct_node* %tmp17, %struct.struct_node** %t, align 8
  %tmp18 = load %struct.struct_node** %p, align 8
  %r = getelementptr inbounds %struct.struct_node* %tmp18, i32 0, i32 3
  %tmp19 = load %struct.struct_node** %r, align 8
  store %struct.struct_node* %tmp19, %struct.struct_node** %p, align 8
  %tmp20 = load %struct.struct_node** %q, align 8
  %tmp21 = load %struct.struct_node** %t, align 8
  %r22 = getelementptr inbounds %struct.struct_node* %tmp21, i32 0, i32 3
  store %struct.struct_node* %tmp20, %struct.struct_node** %r22, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %tmp25 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %tmp25, %struct.struct_node** %q24, align 8
  %tmp26 = load %struct.struct_node** %p, align 8
  %r27 = getelementptr inbounds %struct.struct_node* %tmp26, i32 0, i32 3
  %tmp28 = load %struct.struct_node** %r27, align 8
  store %struct.struct_node* %tmp28, %struct.struct_node** %t, align 8
  %tmp29 = load %struct.struct_node** %p, align 8
  %l = getelementptr inbounds %struct.struct_node* %tmp29, i32 0, i32 2
  %tmp30 = load %struct.struct_node** %l, align 8
  %tmp31 = load %struct.struct_node** %p, align 8
  %r32 = getelementptr inbounds %struct.struct_node* %tmp31, i32 0, i32 3
  store %struct.struct_node* %tmp30, %struct.struct_node** %r32, align 8
  %tmp33 = load %struct.struct_node** %q24, align 8
  %tmp34 = load %struct.struct_node** %p, align 8
  %l35 = getelementptr inbounds %struct.struct_node* %tmp34, i32 0, i32 2
  store %struct.struct_node* %tmp33, %struct.struct_node** %l35, align 8
  %tmp36 = load %struct.struct_node** %p, align 8
  %9 = bitcast %struct.struct_node* %tmp36 to i32*
  %10 = load i32* %9, align 8
  %11 = and i32 %10, -3
  %12 = or i32 %11, 2
  store i32 %12, i32* %9, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then14
  br label %if.end50

if.else37:                                        ; preds = %lor.lhs.false
  %tmp40 = load %struct.struct_node** %p, align 8
  store %struct.struct_node* %tmp40, %struct.struct_node** %q39, align 8
  %tmp41 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %tmp41, %struct.struct_node** %p, align 8
  %tmp42 = load %struct.struct_node** %t, align 8
  %l43 = getelementptr inbounds %struct.struct_node* %tmp42, i32 0, i32 2
  %tmp44 = load %struct.struct_node** %l43, align 8
  store %struct.struct_node* %tmp44, %struct.struct_node** %t, align 8
  %tmp45 = load %struct.struct_node** %q39, align 8
  %tmp46 = load %struct.struct_node** %p, align 8
  %l47 = getelementptr inbounds %struct.struct_node* %tmp46, i32 0, i32 2
  store %struct.struct_node* %tmp45, %struct.struct_node** %l47, align 8
  %tmp48 = load %struct.struct_node** %p, align 8
  %13 = bitcast %struct.struct_node* %tmp48 to i32*
  %14 = load i32* %13, align 8
  %15 = and i32 %14, -2
  %16 = or i32 %15, 1
  store i32 %16, i32* %13, align 8
  %tmp49 = load %struct.struct_node** %p, align 8
  %17 = bitcast %struct.struct_node* %tmp49 to i32*
  %18 = load i32* %17, align 8
  %19 = and i32 %18, -3
  store i32 %19, i32* %17, align 8
  br label %if.end50

if.end50:                                         ; preds = %if.else37, %if.end
  br label %while.cond

while.end:                                        ; preds = %lor.end
  ret void
}

define %struct.struct_node* @createNode() nounwind uwtable {
entry:
  %newNode = alloca %struct.struct_node*, align 8
  %tmp = load i32* @counter, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %call2 = call noalias i8* @malloc(i64 32) nounwind
  %0 = bitcast i8* %call2 to %struct.struct_node*
  store %struct.struct_node* %0, %struct.struct_node** %newNode, align 8
  %tmp3 = load %struct.struct_node** %newNode, align 8
  %1 = bitcast %struct.struct_node* %tmp3 to i32*
  %2 = load i32* %1, align 8
  %3 = and i32 %2, -3
  store i32 %3, i32* %1, align 8
  %tmp4 = load %struct.struct_node** %newNode, align 8
  %4 = bitcast %struct.struct_node* %tmp4 to i32*
  %5 = load i32* %4, align 8
  %6 = and i32 %5, -2
  store i32 %6, i32* %4, align 8
  %tmp5 = load %struct.struct_node** %newNode, align 8
  %7 = bitcast %struct.struct_node* %tmp5 to i32*
  %8 = load i32* %7, align 8
  %9 = and i32 %8, -5
  store i32 %9, i32* %7, align 8
  %tmp6 = load %struct.struct_node** %newNode, align 8
  %l = getelementptr inbounds %struct.struct_node* %tmp6, i32 0, i32 2
  store %struct.struct_node* null, %struct.struct_node** %l, align 8
  %tmp7 = load %struct.struct_node** %newNode, align 8
  %r = getelementptr inbounds %struct.struct_node* %tmp7, i32 0, i32 3
  store %struct.struct_node* null, %struct.struct_node** %r, align 8
  %tmp8 = load i32* @counter, align 4
  %tmp9 = load %struct.struct_node** %newNode, align 8
  %value = getelementptr inbounds %struct.struct_node* %tmp9, i32 0, i32 4
  store i32 %tmp8, i32* %value, align 4
  %tmp10 = load %struct.struct_node** %newNode, align 8
  %10 = bitcast %struct.struct_node* %tmp10 to i32*
  %11 = load i32* %10, align 8
  %12 = and i32 %11, -97
  store i32 %12, i32* %10, align 8
  %tmp11 = load %struct.struct_node** %newNode, align 8
  %13 = bitcast %struct.struct_node* %tmp11 to i32*
  %14 = load i32* %13, align 8
  %15 = and i32 %14, -97
  %16 = or i32 %15, 32
  store i32 %16, i32* %13, align 8
  %tmp12 = load i32* @counter, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* @counter, align 4
  %tmp13 = load %struct.struct_node** %newNode, align 8
  ret %struct.struct_node* %tmp13
}

declare i32 @printf(i8*, ...)

declare noalias i8* @malloc(i64) nounwind

define %struct.struct_node* @setLeft(%struct.struct_node* %curr, %struct.struct_node* %left) nounwind uwtable {
entry:
  %curr.addr = alloca %struct.struct_node*, align 8
  %left.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %curr, %struct.struct_node** %curr.addr, align 8
  store %struct.struct_node* %left, %struct.struct_node** %left.addr, align 8
  %tmp = load %struct.struct_node** %curr.addr, align 8
  %value = getelementptr inbounds %struct.struct_node* %tmp, i32 0, i32 4
  %tmp1 = load i32* %value, align 4
  %tmp2 = load %struct.struct_node** %left.addr, align 8
  %value3 = getelementptr inbounds %struct.struct_node* %tmp2, i32 0, i32 4
  %tmp4 = load i32* %value3, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %tmp1, i32 %tmp4)
  %tmp5 = load %struct.struct_node** %left.addr, align 8
  %tmp6 = load %struct.struct_node** %curr.addr, align 8
  %l = getelementptr inbounds %struct.struct_node* %tmp6, i32 0, i32 2
  store %struct.struct_node* %tmp5, %struct.struct_node** %l, align 8
  %tmp7 = load %struct.struct_node** %left.addr, align 8
  ret %struct.struct_node* %tmp7
}

define %struct.struct_node* @setRight(%struct.struct_node* %curr, %struct.struct_node* %right) nounwind uwtable {
entry:
  %curr.addr = alloca %struct.struct_node*, align 8
  %right.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %curr, %struct.struct_node** %curr.addr, align 8
  store %struct.struct_node* %right, %struct.struct_node** %right.addr, align 8
  %tmp = load %struct.struct_node** %curr.addr, align 8
  %value = getelementptr inbounds %struct.struct_node* %tmp, i32 0, i32 4
  %tmp1 = load i32* %value, align 4
  %tmp2 = load %struct.struct_node** %right.addr, align 8
  %value3 = getelementptr inbounds %struct.struct_node* %tmp2, i32 0, i32 4
  %tmp4 = load i32* %value3, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0), i32 %tmp1, i32 %tmp4)
  %tmp5 = load %struct.struct_node** %right.addr, align 8
  %tmp6 = load %struct.struct_node** %curr.addr, align 8
  %r = getelementptr inbounds %struct.struct_node* %tmp6, i32 0, i32 3
  store %struct.struct_node* %tmp5, %struct.struct_node** %r, align 8
  %tmp7 = load %struct.struct_node** %right.addr, align 8
  ret %struct.struct_node* %tmp7
}

define void @showGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  %this.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %this, %struct.struct_node** %this.addr, align 8
  %tmp = load %struct.struct_node** %this.addr, align 8
  %cmp = icmp eq %struct.struct_node* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %tmp1 = load %struct.struct_node** %this.addr, align 8
  %0 = bitcast %struct.struct_node* %tmp1 to i32*
  %1 = load i32* %0, align 8
  %2 = lshr i32 %1, 2
  %bf.clear = and i32 %2, 1
  %tobool = icmp ne i32 %bf.clear, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %return

if.end3:                                          ; preds = %if.end
  %tmp4 = load %struct.struct_node** %this.addr, align 8
  %value = getelementptr inbounds %struct.struct_node* %tmp4, i32 0, i32 4
  %tmp5 = load i32* %value, align 4
  %tmp6 = load %struct.struct_node** %this.addr, align 8
  %3 = bitcast %struct.struct_node* %tmp6 to i32*
  %4 = load i32* %3, align 8
  %bf.clear7 = and i32 %4, 1
  %tmp8 = load %struct.struct_node** %this.addr, align 8
  %l = getelementptr inbounds %struct.struct_node* %tmp8, i32 0, i32 2
  %tmp9 = load %struct.struct_node** %l, align 8
  %value10 = getelementptr inbounds %struct.struct_node* %tmp9, i32 0, i32 4
  %tmp11 = load i32* %value10, align 4
  %tmp12 = load %struct.struct_node** %this.addr, align 8
  %r = getelementptr inbounds %struct.struct_node* %tmp12, i32 0, i32 3
  %tmp13 = load %struct.struct_node** %r, align 8
  %value14 = getelementptr inbounds %struct.struct_node* %tmp13, i32 0, i32 4
  %tmp15 = load i32* %value14, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %tmp5, i32 %bf.clear7, i32 %tmp11, i32 %tmp15)
  %tmp16 = load %struct.struct_node** %this.addr, align 8
  %5 = bitcast %struct.struct_node* %tmp16 to i32*
  %6 = load i32* %5, align 8
  %7 = and i32 %6, -5
  %8 = or i32 %7, 4
  store i32 %8, i32* %5, align 8
  %tmp17 = load %struct.struct_node** %this.addr, align 8
  %l18 = getelementptr inbounds %struct.struct_node* %tmp17, i32 0, i32 2
  %tmp19 = load %struct.struct_node** %l18, align 8
  call void @showGraph(%struct.struct_node* %tmp19)
  %tmp20 = load %struct.struct_node** %this.addr, align 8
  %r21 = getelementptr inbounds %struct.struct_node* %tmp20, i32 0, i32 3
  %tmp22 = load %struct.struct_node** %r21, align 8
  call void @showGraph(%struct.struct_node* %tmp22)
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  ret void
}

define void @cleanGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  %this.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %this, %struct.struct_node** %this.addr, align 8
  %tmp = load %struct.struct_node** %this.addr, align 8
  %cmp = icmp eq %struct.struct_node* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end10

if.end:                                           ; preds = %entry
  %tmp1 = load %struct.struct_node** %this.addr, align 8
  %0 = bitcast %struct.struct_node* %tmp1 to i32*
  %1 = load i32* %0, align 8
  %2 = lshr i32 %1, 2
  %bf.clear = and i32 %2, 1
  %tobool = icmp ne i32 %bf.clear, 0
  br i1 %tobool, label %if.then2, label %if.end10

if.then2:                                         ; preds = %if.end
  %tmp3 = load %struct.struct_node** %this.addr, align 8
  %3 = bitcast %struct.struct_node* %tmp3 to i32*
  %4 = load i32* %3, align 8
  %5 = and i32 %4, -5
  store i32 %5, i32* %3, align 8
  %tmp4 = load %struct.struct_node** %this.addr, align 8
  %6 = bitcast %struct.struct_node* %tmp4 to i32*
  %7 = load i32* %6, align 8
  %8 = and i32 %7, -2
  store i32 %8, i32* %6, align 8
  %tmp5 = load %struct.struct_node** %this.addr, align 8
  %9 = bitcast %struct.struct_node* %tmp5 to i32*
  %10 = load i32* %9, align 8
  %11 = and i32 %10, -3
  store i32 %11, i32* %9, align 8
  %tmp6 = load %struct.struct_node** %this.addr, align 8
  %l = getelementptr inbounds %struct.struct_node* %tmp6, i32 0, i32 2
  %tmp7 = load %struct.struct_node** %l, align 8
  call void @cleanGraph(%struct.struct_node* %tmp7)
  %tmp8 = load %struct.struct_node** %this.addr, align 8
  %r = getelementptr inbounds %struct.struct_node* %tmp8, i32 0, i32 3
  %tmp9 = load %struct.struct_node** %r, align 8
  call void @cleanGraph(%struct.struct_node* %tmp9)
  br label %if.end10

if.end10:                                         ; preds = %if.then, %if.then2, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.struct_node*, align 8
  %b = alloca %struct.struct_node*, align 8
  %c = alloca %struct.struct_node*, align 8
  %d = alloca %struct.struct_node*, align 8
  %e = alloca %struct.struct_node*, align 8
  %root = alloca %struct.struct_node*, align 8
  store i32 0, i32* %retval
  %call = call %struct.struct_node* @createNode()
  store %struct.struct_node* %call, %struct.struct_node** %a, align 8
  %call1 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %call1, %struct.struct_node** %b, align 8
  %call2 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %call2, %struct.struct_node** %c, align 8
  %call3 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %call3, %struct.struct_node** %d, align 8
  %call4 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %call4, %struct.struct_node** %e, align 8
  %tmp = load %struct.struct_node** %a, align 8
  %tmp5 = load %struct.struct_node** %b, align 8
  %call6 = call %struct.struct_node* @setLeft(%struct.struct_node* %tmp, %struct.struct_node* %tmp5)
  %tmp7 = load %struct.struct_node** %a, align 8
  %tmp8 = load %struct.struct_node** %c, align 8
  %call9 = call %struct.struct_node* @setRight(%struct.struct_node* %tmp7, %struct.struct_node* %tmp8)
  %tmp10 = load %struct.struct_node** %b, align 8
  %tmp11 = load %struct.struct_node** %d, align 8
  %call12 = call %struct.struct_node* @setLeft(%struct.struct_node* %tmp10, %struct.struct_node* %tmp11)
  %tmp13 = load %struct.struct_node** %b, align 8
  %tmp14 = load %struct.struct_node** %d, align 8
  %call15 = call %struct.struct_node* @setRight(%struct.struct_node* %tmp13, %struct.struct_node* %tmp14)
  %tmp16 = load %struct.struct_node** %c, align 8
  %tmp17 = load %struct.struct_node** %b, align 8
  %call18 = call %struct.struct_node* @setLeft(%struct.struct_node* %tmp16, %struct.struct_node* %tmp17)
  %tmp19 = load %struct.struct_node** %c, align 8
  %tmp20 = load %struct.struct_node** %a, align 8
  %call21 = call %struct.struct_node* @setRight(%struct.struct_node* %tmp19, %struct.struct_node* %tmp20)
  %tmp22 = load %struct.struct_node** %d, align 8
  %tmp23 = load %struct.struct_node** %c, align 8
  %call24 = call %struct.struct_node* @setLeft(%struct.struct_node* %tmp22, %struct.struct_node* %tmp23)
  %tmp25 = load %struct.struct_node** %d, align 8
  %tmp26 = load %struct.struct_node** %e, align 8
  %call27 = call %struct.struct_node* @setRight(%struct.struct_node* %tmp25, %struct.struct_node* %tmp26)
  %tmp28 = load %struct.struct_node** %e, align 8
  %tmp29 = load %struct.struct_node** %e, align 8
  %call30 = call %struct.struct_node* @setLeft(%struct.struct_node* %tmp28, %struct.struct_node* %tmp29)
  %tmp31 = load %struct.struct_node** %e, align 8
  %tmp32 = load %struct.struct_node** %a, align 8
  %call33 = call %struct.struct_node* @setRight(%struct.struct_node* %tmp31, %struct.struct_node* %tmp32)
  %tmp35 = load %struct.struct_node** %a, align 8
  store %struct.struct_node* %tmp35, %struct.struct_node** %root, align 8
  %tmp36 = load %struct.struct_node** %root, align 8
  call void @showGraph(%struct.struct_node* %tmp36)
  %tmp37 = load %struct.struct_node** %root, align 8
  call void @cleanGraph(%struct.struct_node* %tmp37)
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0))
  %tmp39 = load %struct.struct_node** %root, align 8
  call void @schorr_waite(%struct.struct_node* %tmp39)
  %tmp40 = load %struct.struct_node** %root, align 8
  call void @showGraph(%struct.struct_node* %tmp40)
  ret i32 0
}
