; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20601-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8*, [4096 x i8], i8** }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-u\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@g = global [4 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)], align 16
@c = common global i8** null, align 8
@b = common global i32 0, align 4
@.str4 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@t = common global %struct.T zeroinitializer, align 8
@a = common global [5 x i32] zeroinitializer, align 16
@d = common global i32 0, align 4
@e = common global i8** null, align 8
@f = common global [16 x i8*] zeroinitializer, align 16

define void @foo() noreturn nounwind uwtable {
entry:
  br label %while.body

while.body:                                       ; preds = %entry, %while.body
  br label %while.body

return:                                           ; No predecessors!
  ret void
}

define i8* @bar(i8* %x, i32 %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  ret i8* null
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i8** getelementptr inbounds ([4 x i8*]* @g, i32 0, i32 0), i8*** @c, align 8
  store i32 4, i32* @b, align 4
  %call = call i32 @setup2()
  store i32 %call, i32* %x, align 4
  store i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %tmp = load i32* %x, align 4
  %call1 = call i32 @setup1(i32 %tmp)
  %tmp2 = load i32* %x, align 4
  %and = and i32 %tmp2, 1024
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp3 = load i32* getelementptr inbounds ([5 x i32]* @a, i32 0, i64 4), align 4
  %tobool4 = icmp ne i32 %tmp3, 0
  br i1 %tobool4, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @setup2() nounwind uwtable inlinehint {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %tmp = load i8*** @c, align 8
  %add.ptr = getelementptr inbounds i8** %tmp, i64 1
  store i8** %add.ptr, i8*** @e, align 8
  %tmp1 = load i32* @b, align 4
  %sub = sub nsw i32 %tmp1, 1
  store i32 %sub, i32* @d, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %tmp2 = load i32* @d, align 4
  %cmp = icmp sgt i32 %tmp2, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp3 = load i8*** @e, align 8
  %arrayidx = getelementptr inbounds i8** %tmp3, i64 0
  %tmp4 = load i8** %arrayidx
  %arrayidx5 = getelementptr inbounds i8* %tmp4, i64 0
  %tmp6 = load i8* %arrayidx5
  %conv = sext i8 %tmp6 to i32
  %cmp7 = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp7, %land.rhs ]
  br i1 %0, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %tmp9 = load i8*** @e, align 8
  %arrayidx10 = getelementptr inbounds i8** %tmp9, i64 0
  %tmp11 = load i8** %arrayidx10
  %arrayidx12 = getelementptr inbounds i8* %tmp11, i64 1
  %tmp13 = load i8* %arrayidx12
  %conv14 = sext i8 %tmp13 to i32
  %cmp15 = icmp ne i32 %conv14, 0
  br i1 %cmp15, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %tmp17 = load i8*** @e, align 8
  %arrayidx18 = getelementptr inbounds i8** %tmp17, i64 0
  %tmp19 = load i8** %arrayidx18
  %arrayidx20 = getelementptr inbounds i8* %tmp19, i64 2
  %tmp21 = load i8* %arrayidx20
  %conv22 = sext i8 %tmp21 to i32
  %cmp23 = icmp ne i32 %conv22, 0
  br i1 %cmp23, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %land.lhs.true, %while.body
  %tmp25 = load i8*** @e, align 8
  %arrayidx26 = getelementptr inbounds i8** %tmp25, i64 0
  %tmp27 = load i8** %arrayidx26
  %arrayidx28 = getelementptr inbounds i8* %tmp27, i64 1
  %tmp29 = load i8* %arrayidx28
  %conv30 = sext i8 %tmp29 to i32
  switch i32 %conv30, label %sw.epilog [
    i32 117, label %sw.bb
    i32 80, label %sw.bb40
    i32 45, label %sw.bb42
  ]

sw.bb:                                            ; preds = %if.end
  %tmp31 = load i8*** @e, align 8
  %arrayidx32 = getelementptr inbounds i8** %tmp31, i64 1
  %tmp33 = load i8** %arrayidx32
  %tobool = icmp ne i8* %tmp33, null
  br i1 %tobool, label %if.end35, label %if.then34

if.then34:                                        ; preds = %sw.bb
  call void @abort() noreturn
  unreachable

if.end35:                                         ; preds = %sw.bb
  %tmp36 = load i8*** @e, align 8
  %arrayidx37 = getelementptr inbounds i8** %tmp36, i64 1
  store i8** %arrayidx37, i8*** getelementptr inbounds (%struct.T* @t, i32 0, i32 2), align 8
  %tmp38 = load i32* @d, align 4
  %dec = add nsw i32 %tmp38, -1
  store i32 %dec, i32* @d, align 4
  %tmp39 = load i8*** @e, align 8
  %incdec.ptr = getelementptr inbounds i8** %tmp39, i32 1
  store i8** %incdec.ptr, i8*** @e, align 8
  br label %sw.epilog

sw.bb40:                                          ; preds = %if.end
  %tmp41 = load i32* %j, align 4
  %or = or i32 %tmp41, 4096
  store i32 %or, i32* %j, align 4
  br label %sw.epilog

sw.bb42:                                          ; preds = %if.end
  %tmp43 = load i32* @d, align 4
  %dec44 = add nsw i32 %tmp43, -1
  store i32 %dec44, i32* @d, align 4
  %tmp45 = load i8*** @e, align 8
  %incdec.ptr46 = getelementptr inbounds i8** %tmp45, i32 1
  store i8** %incdec.ptr46, i8*** @e, align 8
  %tmp47 = load i32* %j, align 4
  %cmp48 = icmp eq i32 %tmp47, 1
  br i1 %cmp48, label %if.then50, label %if.end53

if.then50:                                        ; preds = %sw.bb42
  %tmp51 = load i32* %j, align 4
  %or52 = or i32 %tmp51, 1536
  store i32 %or52, i32* %j, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then50, %sw.bb42
  %tmp54 = load i32* %j, align 4
  store i32 %tmp54, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %if.end, %sw.bb40, %if.end35
  %tmp55 = load i32* @d, align 4
  %dec56 = add nsw i32 %tmp55, -1
  store i32 %dec56, i32* @d, align 4
  %tmp57 = load i8*** @e, align 8
  %incdec.ptr58 = getelementptr inbounds i8** %tmp57, i32 1
  store i8** %incdec.ptr58, i8*** @e, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %tmp59 = load i32* @d, align 4
  %cmp60 = icmp sgt i32 %tmp59, 0
  br i1 %cmp60, label %land.lhs.true62, label %if.end66

land.lhs.true62:                                  ; preds = %while.end
  %tmp63 = load i32* %j, align 4
  %and = and i32 %tmp63, 1
  %tobool64 = icmp ne i32 %and, 0
  br i1 %tobool64, label %if.end66, label %if.then65

if.then65:                                        ; preds = %land.lhs.true62
  call void @abort() noreturn
  unreachable

if.end66:                                         ; preds = %land.lhs.true62, %while.end
  %tmp67 = load i32* %j, align 4
  store i32 %tmp67, i32* %retval
  br label %return

return:                                           ; preds = %if.end66, %if.end53
  %1 = load i32* %retval
  ret i32 %1
}

define internal i32 @setup1(i32 %x) nounwind uwtable inlinehint {
entry:
  %x.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %rval = alloca i32, align 4
  %h = alloca i8**, align 8
  %i = alloca i8**, align 8
  store i32 %x, i32* %x.addr, align 4
  %call = call i8* @baz(i8* getelementptr inbounds (%struct.T* @t, i32 0, i32 1, i32 0), i32 4096)
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i8* @baz(i8* getelementptr inbounds (%struct.T* @t, i32 0, i32 1, i32 0), i32 4096)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp = load i32* %x.addr, align 4
  %and = and i32 %tmp, 512
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then3, label %if.end25

if.then3:                                         ; preds = %if.end
  %tmp6 = load i8*** @e, align 8
  store i8** %tmp6, i8*** %i, align 8
  %tmp7 = load i32* @d, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* @d, align 4
  store i8** getelementptr inbounds ([16 x i8*]* @f, i32 0, i32 0), i8*** @e, align 8
  %tmp8 = load i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %tobool9 = icmp ne i8* %tmp8, null
  br i1 %tobool9, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then3
  %tmp10 = load i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %tmp11 = load i8* %tmp10
  %conv = sext i8 %tmp11 to i32
  %tobool12 = icmp ne i32 %conv, 0
  br i1 %tobool12, label %if.then13, label %if.else

if.then13:                                        ; preds = %land.lhs.true
  %tmp14 = load i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %tmp15 = load i8*** @e, align 8
  %arrayidx = getelementptr inbounds i8** %tmp15, i64 0
  store i8* %tmp14, i8** %arrayidx
  br label %if.end16

if.else:                                          ; preds = %land.lhs.true, %if.then3
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %if.then13
  %tmp17 = load i8*** @e, align 8
  %add.ptr = getelementptr inbounds i8** %tmp17, i64 1
  store i8** %add.ptr, i8*** %h, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end16
  %tmp18 = load i8*** %i, align 8
  %tmp19 = load i8** %tmp18
  %tmp20 = load i8*** %h, align 8
  store i8* %tmp19, i8** %tmp20
  %tobool21 = icmp ne i8* %tmp19, null
  br i1 %tobool21, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp22 = load i8*** %i, align 8
  %incdec.ptr = getelementptr inbounds i8** %tmp22, i32 1
  store i8** %incdec.ptr, i8*** %i, align 8
  %tmp23 = load i8*** %h, align 8
  %incdec.ptr24 = getelementptr inbounds i8** %tmp23, i32 1
  store i8** %incdec.ptr24, i8*** %h, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end25

if.end25:                                         ; preds = %for.end, %if.end
  ret i32 1
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define internal i8* @baz(i8* %x, i32 %y) nounwind uwtable inlinehint {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %y.addr, align 4
  %conv = zext i32 %tmp to i64
  %cmp = icmp ugt i64 %conv, 4096
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @foo() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i8** %x.addr, align 8
  %tmp3 = load i32* %y.addr, align 4
  %call = call i8* @bar(i8* %tmp2, i32 %tmp3)
  ret i8* %call
}
