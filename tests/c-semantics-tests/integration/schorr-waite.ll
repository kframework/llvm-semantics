; ModuleID = '/home/david/src/c-semantics/tests/integration/schorr-waite.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.struct_node = type <{ i8, [7 x i8], %struct.struct_node*, %struct.struct_node*, i32, [4 x i8] }>

@counter = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"creating new node %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Setting left child of %d to %d\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"Setting right child of %d to %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"%d:m=%d:l=%d:r=%d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"Now running Schorr-Waite...\0A\00", align 1

define void @schorr_waite(%struct.struct_node* %root) nounwind uwtable {
entry:
  %root.addr = alloca %struct.struct_node*, align 8
  %t = alloca %struct.struct_node*, align 8
  %p = alloca %struct.struct_node*, align 8
  %q = alloca %struct.struct_node*, align 8
  %q9 = alloca %struct.struct_node*, align 8
  %q14 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %root, %struct.struct_node** %root.addr, align 8
  %0 = load %struct.struct_node** %root.addr, align 8
  store %struct.struct_node* %0, %struct.struct_node** %t, align 8
  store %struct.struct_node* null, %struct.struct_node** %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end17, %entry
  %1 = load %struct.struct_node** %p, align 8
  %cmp = icmp ne %struct.struct_node* %1, null
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %2 = load %struct.struct_node** %t, align 8
  %cmp1 = icmp ne %struct.struct_node* %2, null
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %3 = load %struct.struct_node** %t, align 8
  %4 = bitcast %struct.struct_node* %3 to i32*
  %5 = load i32* %4, align 8
  %bf.clear = and i32 %5, 1
  %tobool = icmp ne i32 %bf.clear, 0
  %lnot = xor i1 %tobool, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %6 = phi i1 [ false, %lor.rhs ], [ %lnot, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %while.cond
  %7 = phi i1 [ true, %while.cond ], [ %6, %land.end ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %8 = load %struct.struct_node** %t, align 8
  %cmp2 = icmp eq %struct.struct_node* %8, null
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %9 = load %struct.struct_node** %t, align 8
  %10 = bitcast %struct.struct_node* %9 to i32*
  %11 = load i32* %10, align 8
  %bf.clear3 = and i32 %11, 1
  %tobool4 = icmp ne i32 %bf.clear3, 0
  br i1 %tobool4, label %if.then, label %if.else13

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %12 = load %struct.struct_node** %p, align 8
  %13 = bitcast %struct.struct_node* %12 to i32*
  %14 = load i32* %13, align 8
  %15 = lshr i32 %14, 1
  %bf.clear5 = and i32 %15, 1
  %tobool6 = icmp ne i32 %bf.clear5, 0
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %16 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %16, %struct.struct_node** %q, align 8
  %17 = load %struct.struct_node** %p, align 8
  store %struct.struct_node* %17, %struct.struct_node** %t, align 8
  %18 = load %struct.struct_node** %p, align 8
  %r = getelementptr inbounds %struct.struct_node* %18, i32 0, i32 3
  %19 = load %struct.struct_node** %r, align 8
  store %struct.struct_node* %19, %struct.struct_node** %p, align 8
  %20 = load %struct.struct_node** %q, align 8
  %21 = load %struct.struct_node** %t, align 8
  %r8 = getelementptr inbounds %struct.struct_node* %21, i32 0, i32 3
  store %struct.struct_node* %20, %struct.struct_node** %r8, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %22 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %22, %struct.struct_node** %q9, align 8
  %23 = load %struct.struct_node** %p, align 8
  %r10 = getelementptr inbounds %struct.struct_node* %23, i32 0, i32 3
  %24 = load %struct.struct_node** %r10, align 8
  store %struct.struct_node* %24, %struct.struct_node** %t, align 8
  %25 = load %struct.struct_node** %p, align 8
  %l = getelementptr inbounds %struct.struct_node* %25, i32 0, i32 2
  %26 = load %struct.struct_node** %l, align 8
  %27 = load %struct.struct_node** %p, align 8
  %r11 = getelementptr inbounds %struct.struct_node* %27, i32 0, i32 3
  store %struct.struct_node* %26, %struct.struct_node** %r11, align 8
  %28 = load %struct.struct_node** %q9, align 8
  %29 = load %struct.struct_node** %p, align 8
  %l12 = getelementptr inbounds %struct.struct_node* %29, i32 0, i32 2
  store %struct.struct_node* %28, %struct.struct_node** %l12, align 8
  %30 = load %struct.struct_node** %p, align 8
  %31 = bitcast %struct.struct_node* %30 to i32*
  %32 = load i32* %31, align 8
  %33 = and i32 %32, -3
  %34 = or i32 %33, 2
  store i32 %34, i32* %31, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end17

if.else13:                                        ; preds = %lor.lhs.false
  %35 = load %struct.struct_node** %p, align 8
  store %struct.struct_node* %35, %struct.struct_node** %q14, align 8
  %36 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %36, %struct.struct_node** %p, align 8
  %37 = load %struct.struct_node** %t, align 8
  %l15 = getelementptr inbounds %struct.struct_node* %37, i32 0, i32 2
  %38 = load %struct.struct_node** %l15, align 8
  store %struct.struct_node* %38, %struct.struct_node** %t, align 8
  %39 = load %struct.struct_node** %q14, align 8
  %40 = load %struct.struct_node** %p, align 8
  %l16 = getelementptr inbounds %struct.struct_node* %40, i32 0, i32 2
  store %struct.struct_node* %39, %struct.struct_node** %l16, align 8
  %41 = load %struct.struct_node** %p, align 8
  %42 = bitcast %struct.struct_node* %41 to i32*
  %43 = load i32* %42, align 8
  %44 = and i32 %43, -2
  %45 = or i32 %44, 1
  store i32 %45, i32* %42, align 8
  %46 = load %struct.struct_node** %p, align 8
  %47 = bitcast %struct.struct_node* %46 to i32*
  %48 = load i32* %47, align 8
  %49 = and i32 %48, -3
  store i32 %49, i32* %47, align 8
  br label %if.end17

if.end17:                                         ; preds = %if.else13, %if.end
  br label %while.cond

while.end:                                        ; preds = %lor.end
  ret void
}

define %struct.struct_node* @createNode() nounwind uwtable {
entry:
  %newNode = alloca %struct.struct_node*, align 8
  %0 = load i32* @counter, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %0)
  %call1 = call noalias i8* @malloc(i64 32) nounwind
  %1 = bitcast i8* %call1 to %struct.struct_node*
  store %struct.struct_node* %1, %struct.struct_node** %newNode, align 8
  %2 = load %struct.struct_node** %newNode, align 8
  %3 = bitcast %struct.struct_node* %2 to i32*
  %4 = load i32* %3, align 8
  %5 = and i32 %4, -3
  store i32 %5, i32* %3, align 8
  %6 = load %struct.struct_node** %newNode, align 8
  %7 = bitcast %struct.struct_node* %6 to i32*
  %8 = load i32* %7, align 8
  %9 = and i32 %8, -2
  store i32 %9, i32* %7, align 8
  %10 = load %struct.struct_node** %newNode, align 8
  %11 = bitcast %struct.struct_node* %10 to i32*
  %12 = load i32* %11, align 8
  %13 = and i32 %12, -5
  store i32 %13, i32* %11, align 8
  %14 = load %struct.struct_node** %newNode, align 8
  %l = getelementptr inbounds %struct.struct_node* %14, i32 0, i32 2
  store %struct.struct_node* null, %struct.struct_node** %l, align 8
  %15 = load %struct.struct_node** %newNode, align 8
  %r = getelementptr inbounds %struct.struct_node* %15, i32 0, i32 3
  store %struct.struct_node* null, %struct.struct_node** %r, align 8
  %16 = load i32* @counter, align 4
  %17 = load %struct.struct_node** %newNode, align 8
  %value = getelementptr inbounds %struct.struct_node* %17, i32 0, i32 4
  store i32 %16, i32* %value, align 4
  %18 = load %struct.struct_node** %newNode, align 8
  %19 = bitcast %struct.struct_node* %18 to i32*
  %20 = load i32* %19, align 8
  %21 = and i32 %20, -97
  store i32 %21, i32* %19, align 8
  %22 = load %struct.struct_node** %newNode, align 8
  %23 = bitcast %struct.struct_node* %22 to i32*
  %24 = load i32* %23, align 8
  %25 = and i32 %24, -97
  %26 = or i32 %25, 32
  store i32 %26, i32* %23, align 8
  %27 = load i32* @counter, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* @counter, align 4
  %28 = load %struct.struct_node** %newNode, align 8
  ret %struct.struct_node* %28
}

declare i32 @printf(i8*, ...)

declare noalias i8* @malloc(i64) nounwind

define %struct.struct_node* @setLeft(%struct.struct_node* %curr, %struct.struct_node* %left) nounwind uwtable {
entry:
  %curr.addr = alloca %struct.struct_node*, align 8
  %left.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %curr, %struct.struct_node** %curr.addr, align 8
  store %struct.struct_node* %left, %struct.struct_node** %left.addr, align 8
  %0 = load %struct.struct_node** %curr.addr, align 8
  %value = getelementptr inbounds %struct.struct_node* %0, i32 0, i32 4
  %1 = load i32* %value, align 4
  %2 = load %struct.struct_node** %left.addr, align 8
  %value1 = getelementptr inbounds %struct.struct_node* %2, i32 0, i32 4
  %3 = load i32* %value1, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %1, i32 %3)
  %4 = load %struct.struct_node** %left.addr, align 8
  %5 = load %struct.struct_node** %curr.addr, align 8
  %l = getelementptr inbounds %struct.struct_node* %5, i32 0, i32 2
  store %struct.struct_node* %4, %struct.struct_node** %l, align 8
  %6 = load %struct.struct_node** %left.addr, align 8
  ret %struct.struct_node* %6
}

define %struct.struct_node* @setRight(%struct.struct_node* %curr, %struct.struct_node* %right) nounwind uwtable {
entry:
  %curr.addr = alloca %struct.struct_node*, align 8
  %right.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %curr, %struct.struct_node** %curr.addr, align 8
  store %struct.struct_node* %right, %struct.struct_node** %right.addr, align 8
  %0 = load %struct.struct_node** %curr.addr, align 8
  %value = getelementptr inbounds %struct.struct_node* %0, i32 0, i32 4
  %1 = load i32* %value, align 4
  %2 = load %struct.struct_node** %right.addr, align 8
  %value1 = getelementptr inbounds %struct.struct_node* %2, i32 0, i32 4
  %3 = load i32* %value1, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0), i32 %1, i32 %3)
  %4 = load %struct.struct_node** %right.addr, align 8
  %5 = load %struct.struct_node** %curr.addr, align 8
  %r = getelementptr inbounds %struct.struct_node* %5, i32 0, i32 3
  store %struct.struct_node* %4, %struct.struct_node** %r, align 8
  %6 = load %struct.struct_node** %right.addr, align 8
  ret %struct.struct_node* %6
}

define void @showGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  %this.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %this, %struct.struct_node** %this.addr, align 8
  %0 = load %struct.struct_node** %this.addr, align 8
  %cmp = icmp eq %struct.struct_node* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.struct_node** %this.addr, align 8
  %2 = bitcast %struct.struct_node* %1 to i32*
  %3 = load i32* %2, align 8
  %4 = lshr i32 %3, 2
  %bf.clear = and i32 %4, 1
  %tobool = icmp ne i32 %bf.clear, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  br label %return

if.end2:                                          ; preds = %if.end
  %5 = load %struct.struct_node** %this.addr, align 8
  %value = getelementptr inbounds %struct.struct_node* %5, i32 0, i32 4
  %6 = load i32* %value, align 4
  %7 = load %struct.struct_node** %this.addr, align 8
  %8 = bitcast %struct.struct_node* %7 to i32*
  %9 = load i32* %8, align 8
  %bf.clear3 = and i32 %9, 1
  %10 = load %struct.struct_node** %this.addr, align 8
  %l = getelementptr inbounds %struct.struct_node* %10, i32 0, i32 2
  %11 = load %struct.struct_node** %l, align 8
  %value4 = getelementptr inbounds %struct.struct_node* %11, i32 0, i32 4
  %12 = load i32* %value4, align 4
  %13 = load %struct.struct_node** %this.addr, align 8
  %r = getelementptr inbounds %struct.struct_node* %13, i32 0, i32 3
  %14 = load %struct.struct_node** %r, align 8
  %value5 = getelementptr inbounds %struct.struct_node* %14, i32 0, i32 4
  %15 = load i32* %value5, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %6, i32 %bf.clear3, i32 %12, i32 %15)
  %16 = load %struct.struct_node** %this.addr, align 8
  %17 = bitcast %struct.struct_node* %16 to i32*
  %18 = load i32* %17, align 8
  %19 = and i32 %18, -5
  %20 = or i32 %19, 4
  store i32 %20, i32* %17, align 8
  %21 = load %struct.struct_node** %this.addr, align 8
  %l6 = getelementptr inbounds %struct.struct_node* %21, i32 0, i32 2
  %22 = load %struct.struct_node** %l6, align 8
  call void @showGraph(%struct.struct_node* %22)
  %23 = load %struct.struct_node** %this.addr, align 8
  %r7 = getelementptr inbounds %struct.struct_node* %23, i32 0, i32 3
  %24 = load %struct.struct_node** %r7, align 8
  call void @showGraph(%struct.struct_node* %24)
  br label %return

return:                                           ; preds = %if.end2, %if.then1, %if.then
  ret void
}

define void @cleanGraph(%struct.struct_node* %this) nounwind uwtable {
entry:
  %this.addr = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %this, %struct.struct_node** %this.addr, align 8
  %0 = load %struct.struct_node** %this.addr, align 8
  %cmp = icmp eq %struct.struct_node* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end2

if.end:                                           ; preds = %entry
  %1 = load %struct.struct_node** %this.addr, align 8
  %2 = bitcast %struct.struct_node* %1 to i32*
  %3 = load i32* %2, align 8
  %4 = lshr i32 %3, 2
  %bf.clear = and i32 %4, 1
  %tobool = icmp ne i32 %bf.clear, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %5 = load %struct.struct_node** %this.addr, align 8
  %6 = bitcast %struct.struct_node* %5 to i32*
  %7 = load i32* %6, align 8
  %8 = and i32 %7, -5
  store i32 %8, i32* %6, align 8
  %9 = load %struct.struct_node** %this.addr, align 8
  %10 = bitcast %struct.struct_node* %9 to i32*
  %11 = load i32* %10, align 8
  %12 = and i32 %11, -2
  store i32 %12, i32* %10, align 8
  %13 = load %struct.struct_node** %this.addr, align 8
  %14 = bitcast %struct.struct_node* %13 to i32*
  %15 = load i32* %14, align 8
  %16 = and i32 %15, -3
  store i32 %16, i32* %14, align 8
  %17 = load %struct.struct_node** %this.addr, align 8
  %l = getelementptr inbounds %struct.struct_node* %17, i32 0, i32 2
  %18 = load %struct.struct_node** %l, align 8
  call void @cleanGraph(%struct.struct_node* %18)
  %19 = load %struct.struct_node** %this.addr, align 8
  %r = getelementptr inbounds %struct.struct_node* %19, i32 0, i32 3
  %20 = load %struct.struct_node** %r, align 8
  call void @cleanGraph(%struct.struct_node* %20)
  br label %if.end2

if.end2:                                          ; preds = %if.then, %if.then1, %if.end
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
  %0 = load %struct.struct_node** %a, align 8
  %1 = load %struct.struct_node** %b, align 8
  %call5 = call %struct.struct_node* @setLeft(%struct.struct_node* %0, %struct.struct_node* %1)
  %2 = load %struct.struct_node** %a, align 8
  %3 = load %struct.struct_node** %c, align 8
  %call6 = call %struct.struct_node* @setRight(%struct.struct_node* %2, %struct.struct_node* %3)
  %4 = load %struct.struct_node** %b, align 8
  %5 = load %struct.struct_node** %d, align 8
  %call7 = call %struct.struct_node* @setLeft(%struct.struct_node* %4, %struct.struct_node* %5)
  %6 = load %struct.struct_node** %b, align 8
  %7 = load %struct.struct_node** %d, align 8
  %call8 = call %struct.struct_node* @setRight(%struct.struct_node* %6, %struct.struct_node* %7)
  %8 = load %struct.struct_node** %c, align 8
  %9 = load %struct.struct_node** %b, align 8
  %call9 = call %struct.struct_node* @setLeft(%struct.struct_node* %8, %struct.struct_node* %9)
  %10 = load %struct.struct_node** %c, align 8
  %11 = load %struct.struct_node** %a, align 8
  %call10 = call %struct.struct_node* @setRight(%struct.struct_node* %10, %struct.struct_node* %11)
  %12 = load %struct.struct_node** %d, align 8
  %13 = load %struct.struct_node** %c, align 8
  %call11 = call %struct.struct_node* @setLeft(%struct.struct_node* %12, %struct.struct_node* %13)
  %14 = load %struct.struct_node** %d, align 8
  %15 = load %struct.struct_node** %e, align 8
  %call12 = call %struct.struct_node* @setRight(%struct.struct_node* %14, %struct.struct_node* %15)
  %16 = load %struct.struct_node** %e, align 8
  %17 = load %struct.struct_node** %e, align 8
  %call13 = call %struct.struct_node* @setLeft(%struct.struct_node* %16, %struct.struct_node* %17)
  %18 = load %struct.struct_node** %e, align 8
  %19 = load %struct.struct_node** %a, align 8
  %call14 = call %struct.struct_node* @setRight(%struct.struct_node* %18, %struct.struct_node* %19)
  %20 = load %struct.struct_node** %a, align 8
  store %struct.struct_node* %20, %struct.struct_node** %root, align 8
  %21 = load %struct.struct_node** %root, align 8
  call void @showGraph(%struct.struct_node* %21)
  %22 = load %struct.struct_node** %root, align 8
  call void @cleanGraph(%struct.struct_node* %22)
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0))
  %23 = load %struct.struct_node** %root, align 8
  call void @schorr_waite(%struct.struct_node* %23)
  %24 = load %struct.struct_node** %root, align 8
  call void @showGraph(%struct.struct_node* %24)
  ret i32 0
}
