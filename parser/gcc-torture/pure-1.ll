; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pure-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@i = global i32 2, align 4

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
  %i = alloca [10 x i32], align 16
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [10 x i32]* %i, i32 0, i64 0
  store i32 0, i32* %arrayidx, align 4
  %call = call i32 @func0(i32 0) readonly
  store i32 %call, i32* %r, align 4
  %arrayidx1 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 0
  %tmp = load i32* %arrayidx1, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error0()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arrayidx2 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 1
  store i32 0, i32* %arrayidx2, align 4
  %call3 = call i32 @func1(i32 0) readnone
  store i32 %call3, i32* %r, align 4
  %arrayidx4 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 1
  %tmp5 = load i32* %arrayidx4, align 4
  %tobool6 = icmp ne i32 %tmp5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @link_error1()
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end
  %arrayidx9 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 2
  store i32 0, i32* %arrayidx9, align 4
  %call10 = call i32 @func2(i32 0)
  store i32 %call10, i32* %r, align 4
  %arrayidx11 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 2
  %tmp12 = load i32* %arrayidx11, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end8
  call void @link_error2()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end8
  %arrayidx16 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 3
  store i32 0, i32* %arrayidx16, align 4
  %call17 = call i32 @func3(i32 0)
  store i32 %call17, i32* %r, align 4
  %arrayidx18 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 3
  %tmp19 = load i32* %arrayidx18, align 4
  %tobool20 = icmp ne i32 %tmp19, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @link_error3()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end15
  %arrayidx23 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 4
  store i32 0, i32* %arrayidx23, align 4
  %call24 = call i32 @func4(i32 0)
  store i32 %call24, i32* %r, align 4
  %arrayidx25 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 4
  %tmp26 = load i32* %arrayidx25, align 4
  %tobool27 = icmp ne i32 %tmp26, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end22
  call void @link_error4()
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end22
  %arrayidx30 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 5
  store i32 0, i32* %arrayidx30, align 4
  %call31 = call i32 @func5(i32 0)
  store i32 %call31, i32* %r, align 4
  %arrayidx32 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 5
  %tmp33 = load i32* %arrayidx32, align 4
  %tobool34 = icmp ne i32 %tmp33, 0
  br i1 %tobool34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end29
  call void @link_error5()
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.end29
  %arrayidx37 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 6
  store i32 0, i32* %arrayidx37, align 4
  %call38 = call i32 @func6(i32 0)
  store i32 %call38, i32* %r, align 4
  %arrayidx39 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 6
  %tmp40 = load i32* %arrayidx39, align 4
  %tobool41 = icmp ne i32 %tmp40, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end36
  call void @link_error6()
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %if.end36
  %arrayidx44 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 7
  store i32 0, i32* %arrayidx44, align 4
  %call45 = call i32 @func7(i32 0)
  store i32 %call45, i32* %r, align 4
  %arrayidx46 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 7
  %tmp47 = load i32* %arrayidx46, align 4
  %tobool48 = icmp ne i32 %tmp47, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end43
  call void @link_error7()
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %if.end43
  %tmp51 = load i32* %r, align 4
  ret i32 %tmp51
}

define i32 @func0(i32 %a) nounwind uwtable readonly {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* @i, align 4
  %sub = sub nsw i32 %tmp, %tmp1
  ret i32 %sub
}

define void @link_error0() nounwind uwtable {
entry:
  ret void
}

define i32 @func1(i32 %a) nounwind uwtable readnone {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* %a.addr, align 4
  %sub = sub nsw i32 %tmp, %tmp1
  ret i32 %sub
}

define void @link_error1() nounwind uwtable {
entry:
  ret void
}

define internal i32 @func2(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* @i, align 4
  %tmp1 = load i32* %a.addr, align 4
  %add = add nsw i32 %tmp, %tmp1
  ret i32 %add
}

define void @link_error2() nounwind uwtable {
entry:
  ret void
}

define internal i32 @func3(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %mul = mul nsw i32 %tmp, 3
  ret i32 %mul
}

define void @link_error3() nounwind uwtable {
entry:
  ret void
}

define internal i32 @func4(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %call = call i32 @func0(i32 %tmp) readonly
  %tmp1 = load i32* %a.addr, align 4
  %add = add nsw i32 %call, %tmp1
  ret i32 %add
}

define void @link_error4() nounwind uwtable {
entry:
  ret void
}

define internal i32 @func5(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* %a.addr, align 4
  %call = call i32 @func1(i32 %tmp1) readnone
  %add = add nsw i32 %tmp, %call
  ret i32 %add
}

define void @link_error5() nounwind uwtable {
entry:
  ret void
}

define internal i32 @func6(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %call = call i32 @func2(i32 %tmp)
  %tmp1 = load i32* %a.addr, align 4
  %add = add nsw i32 %call, %tmp1
  ret i32 %add
}

define void @link_error6() nounwind uwtable {
entry:
  ret void
}

define internal i32 @func7(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* %a.addr, align 4
  %call = call i32 @func3(i32 %tmp1)
  %add = add nsw i32 %tmp, %call
  ret i32 %add
}

define void @link_error7() nounwind uwtable {
entry:
  ret void
}
