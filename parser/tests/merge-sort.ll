; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/merge-sort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %head = alloca i32*, align 8
  %curr = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32* null, i32** %head, align 8
  %tmp = load i32** %head, align 8
  %call = call i32* @listCons(i32* %tmp, i32 20)
  store i32* %call, i32** %head, align 8
  %tmp1 = load i32** %head, align 8
  %call2 = call i32* @listCons(i32* %tmp1, i32 25)
  store i32* %call2, i32** %head, align 8
  %tmp3 = load i32** %head, align 8
  %call4 = call i32* @listCons(i32* %tmp3, i32 15)
  store i32* %call4, i32** %head, align 8
  %tmp5 = load i32** %head, align 8
  %call6 = call i32* @listCons(i32* %tmp5, i32 30)
  store i32* %call6, i32** %head, align 8
  %tmp7 = load i32** %head, align 8
  %call8 = call i32* @listCons(i32* %tmp7, i32 10)
  store i32* %call8, i32** %head, align 8
  %tmp9 = load i32** %head, align 8
  %call10 = call i32* @listCons(i32* %tmp9, i32 35)
  store i32* %call10, i32** %head, align 8
  %tmp11 = load i32** %head, align 8
  %call12 = call i32* @fsl_mergesort(i32* %tmp11)
  store i32* %call12, i32** %head, align 8
  %tmp14 = load i32** %head, align 8
  store i32* %tmp14, i32** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp15 = load i32** %curr, align 8
  %cmp = icmp ne i32* %tmp15, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp16 = load i32** %curr, align 8
  %tmp17 = load i32* %tmp16
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp17)
  %tmp19 = load i32** %curr, align 8
  %add.ptr = getelementptr inbounds i32* %tmp19, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp20 = load i32** %0
  store i32* %tmp20, i32** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

define i32* @listCons(i32* %p, i32 %n) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %next = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %call = call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %next, align 8
  %tmp = load i32* %n.addr, align 4
  %tmp1 = load i32** %next, align 8
  store i32 %tmp, i32* %tmp1
  %tmp2 = load i32** %p.addr, align 8
  %tmp3 = load i32** %next, align 8
  %add.ptr = getelementptr inbounds i32* %tmp3, i64 1
  %1 = bitcast i32* %add.ptr to i32**
  store i32* %tmp2, i32** %1
  %tmp4 = load i32** %next, align 8
  ret i32* %tmp4
}

define i32* @fsl_mergesort(i32* %l) nounwind uwtable {
entry:
  %l.addr = alloca i32*, align 8
  %a = alloca i32*, align 8
  %b = alloca i32*, align 8
  %e = alloca i32*, align 8
  %t = alloca i32*, align 8
  %h = alloca i32*, align 8
  store i32* %l, i32** %l.addr, align 8
  %tmp = load i32** %l.addr, align 8
  %cmp = icmp ne i32* %tmp, null
  br i1 %cmp, label %land.lhs.true, label %if.end78

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32** %l.addr, align 8
  %add.ptr = getelementptr inbounds i32* %tmp1, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %tmp2 = load i32** %0
  %tobool = icmp ne i32* %tmp2, null
  br i1 %tobool, label %if.then, label %if.end78

if.then:                                          ; preds = %land.lhs.true
  store i32* null, i32** %a, align 8
  store i32* null, i32** %b, align 8
  %tmp3 = load i32** %l.addr, align 8
  %add.ptr4 = getelementptr inbounds i32* %tmp3, i64 1
  %1 = bitcast i32* %add.ptr4 to i32**
  %tmp5 = load i32** %1
  %tmp6 = load i32* %tmp5
  %tmp7 = load i32** %l.addr, align 8
  %add.ptr8 = getelementptr inbounds i32* %tmp7, i64 1
  %2 = bitcast i32* %add.ptr8 to i32**
  %tmp9 = load i32** %2
  store i32 %tmp6, i32* %tmp9
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then
  %tmp10 = load i32** %l.addr, align 8
  %cmp11 = icmp ne i32* %tmp10, null
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp12 = load i32** %l.addr, align 8
  store i32* %tmp12, i32** %e, align 8
  %tmp13 = load i32** %e, align 8
  %add.ptr14 = getelementptr inbounds i32* %tmp13, i64 1
  %3 = bitcast i32* %add.ptr14 to i32**
  %tmp15 = load i32** %3
  store i32* %tmp15, i32** %l.addr, align 8
  %tmp16 = load i32** %a, align 8
  %tmp17 = load i32** %e, align 8
  %add.ptr18 = getelementptr inbounds i32* %tmp17, i64 1
  %4 = bitcast i32* %add.ptr18 to i32**
  store i32* %tmp16, i32** %4
  %tmp19 = load i32** %e, align 8
  store i32* %tmp19, i32** %a, align 8
  %tmp20 = load i32** %l.addr, align 8
  %cmp21 = icmp ne i32* %tmp20, null
  br i1 %cmp21, label %if.then22, label %if.end

if.then22:                                        ; preds = %while.body
  %tmp23 = load i32** %l.addr, align 8
  store i32* %tmp23, i32** %e, align 8
  %tmp24 = load i32** %e, align 8
  %add.ptr25 = getelementptr inbounds i32* %tmp24, i64 1
  %5 = bitcast i32* %add.ptr25 to i32**
  %tmp26 = load i32** %5
  store i32* %tmp26, i32** %l.addr, align 8
  %tmp27 = load i32** %b, align 8
  %tmp28 = load i32** %e, align 8
  %add.ptr29 = getelementptr inbounds i32* %tmp28, i64 1
  %6 = bitcast i32* %add.ptr29 to i32**
  store i32* %tmp27, i32** %6
  %tmp30 = load i32** %e, align 8
  store i32* %tmp30, i32** %b, align 8
  br label %if.end

if.end:                                           ; preds = %if.then22, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp31 = load i32** %a, align 8
  %call = call i32* @fsl_mergesort(i32* %tmp31)
  store i32* %call, i32** %a, align 8
  %tmp32 = load i32** %b, align 8
  %call33 = call i32* @fsl_mergesort(i32* %tmp32)
  store i32* %call33, i32** %b, align 8
  store i32* null, i32** %h, align 8
  store i32* null, i32** %t, align 8
  br label %while.cond34

while.cond34:                                     ; preds = %if.end63, %while.end
  %tmp35 = load i32** %a, align 8
  %cmp36 = icmp ne i32* %tmp35, null
  br i1 %cmp36, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond34
  %tmp37 = load i32** %b, align 8
  %cmp38 = icmp ne i32* %tmp37, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond34
  %7 = phi i1 [ false, %while.cond34 ], [ %cmp38, %land.rhs ]
  br i1 %7, label %while.body39, label %while.end65

while.body39:                                     ; preds = %land.end
  %tmp40 = load i32** %b, align 8
  %tmp41 = load i32* %tmp40
  %tmp42 = load i32** %a, align 8
  %tmp43 = load i32* %tmp42
  %cmp44 = icmp sgt i32 %tmp41, %tmp43
  br i1 %cmp44, label %if.then45, label %if.else

if.then45:                                        ; preds = %while.body39
  %tmp46 = load i32** %a, align 8
  store i32* %tmp46, i32** %e, align 8
  %tmp47 = load i32** %a, align 8
  %add.ptr48 = getelementptr inbounds i32* %tmp47, i64 1
  %8 = bitcast i32* %add.ptr48 to i32**
  %tmp49 = load i32** %8
  store i32* %tmp49, i32** %a, align 8
  br label %if.end54

if.else:                                          ; preds = %while.body39
  %tmp50 = load i32** %b, align 8
  store i32* %tmp50, i32** %e, align 8
  %tmp51 = load i32** %b, align 8
  %add.ptr52 = getelementptr inbounds i32* %tmp51, i64 1
  %9 = bitcast i32* %add.ptr52 to i32**
  %tmp53 = load i32** %9
  store i32* %tmp53, i32** %b, align 8
  br label %if.end54

if.end54:                                         ; preds = %if.else, %if.then45
  %tmp55 = load i32** %h, align 8
  %cmp56 = icmp ne i32* %tmp55, null
  br i1 %cmp56, label %if.then57, label %if.else61

if.then57:                                        ; preds = %if.end54
  %tmp58 = load i32** %e, align 8
  %tmp59 = load i32** %t, align 8
  %add.ptr60 = getelementptr inbounds i32* %tmp59, i64 1
  %10 = bitcast i32* %add.ptr60 to i32**
  store i32* %tmp58, i32** %10
  br label %if.end63

if.else61:                                        ; preds = %if.end54
  %tmp62 = load i32** %e, align 8
  store i32* %tmp62, i32** %h, align 8
  br label %if.end63

if.end63:                                         ; preds = %if.else61, %if.then57
  %tmp64 = load i32** %e, align 8
  store i32* %tmp64, i32** %t, align 8
  br label %while.cond34

while.end65:                                      ; preds = %land.end
  %tmp66 = load i32** %a, align 8
  %cmp67 = icmp ne i32* %tmp66, null
  br i1 %cmp67, label %if.then68, label %if.else72

if.then68:                                        ; preds = %while.end65
  %tmp69 = load i32** %a, align 8
  %tmp70 = load i32** %t, align 8
  %add.ptr71 = getelementptr inbounds i32* %tmp70, i64 1
  %11 = bitcast i32* %add.ptr71 to i32**
  store i32* %tmp69, i32** %11
  br label %if.end76

if.else72:                                        ; preds = %while.end65
  %tmp73 = load i32** %b, align 8
  %tmp74 = load i32** %t, align 8
  %add.ptr75 = getelementptr inbounds i32* %tmp74, i64 1
  %12 = bitcast i32* %add.ptr75 to i32**
  store i32* %tmp73, i32** %12
  br label %if.end76

if.end76:                                         ; preds = %if.else72, %if.then68
  %tmp77 = load i32** %h, align 8
  store i32* %tmp77, i32** %l.addr, align 8
  br label %if.end78

if.end78:                                         ; preds = %if.end76, %land.lhs.true, %entry
  %tmp79 = load i32** %l.addr, align 8
  ret i32* %tmp79
}

declare i32 @printf(i8*, ...)

declare noalias i8* @malloc(i64) nounwind
