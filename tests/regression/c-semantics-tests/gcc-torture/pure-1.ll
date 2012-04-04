; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pure-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = global i32 2, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca [10 x i32], align 16
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [10 x i32]* %i, i32 0, i64 0
  store i32 0, i32* %arrayidx, align 4
  %call = call i32 @func0(i32 0) nounwind readonly
  store i32 %call, i32* %r, align 4
  %arrayidx1 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 0
  %0 = load i32* %arrayidx1, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error0()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arrayidx2 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 1
  store i32 0, i32* %arrayidx2, align 4
  %call3 = call i32 @func1(i32 0) nounwind readnone
  store i32 %call3, i32* %r, align 4
  %arrayidx4 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 1
  %1 = load i32* %arrayidx4, align 4
  %tobool5 = icmp ne i32 %1, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @link_error1()
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %arrayidx8 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 2
  store i32 0, i32* %arrayidx8, align 4
  %call9 = call i32 @func2(i32 0)
  store i32 %call9, i32* %r, align 4
  %arrayidx10 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 2
  %2 = load i32* %arrayidx10, align 4
  %tobool11 = icmp ne i32 %2, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  call void @link_error2()
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end7
  %arrayidx14 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 3
  store i32 0, i32* %arrayidx14, align 4
  %call15 = call i32 @func3(i32 0)
  store i32 %call15, i32* %r, align 4
  %arrayidx16 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 3
  %3 = load i32* %arrayidx16, align 4
  %tobool17 = icmp ne i32 %3, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  call void @link_error3()
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end13
  %arrayidx20 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 4
  store i32 0, i32* %arrayidx20, align 4
  %call21 = call i32 @func4(i32 0)
  store i32 %call21, i32* %r, align 4
  %arrayidx22 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 4
  %4 = load i32* %arrayidx22, align 4
  %tobool23 = icmp ne i32 %4, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  call void @link_error4()
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end19
  %arrayidx26 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 5
  store i32 0, i32* %arrayidx26, align 4
  %call27 = call i32 @func5(i32 0)
  store i32 %call27, i32* %r, align 4
  %arrayidx28 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 5
  %5 = load i32* %arrayidx28, align 4
  %tobool29 = icmp ne i32 %5, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end25
  call void @link_error5()
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end25
  %arrayidx32 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 6
  store i32 0, i32* %arrayidx32, align 4
  %call33 = call i32 @func6(i32 0)
  store i32 %call33, i32* %r, align 4
  %arrayidx34 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 6
  %6 = load i32* %arrayidx34, align 4
  %tobool35 = icmp ne i32 %6, 0
  br i1 %tobool35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end31
  call void @link_error6()
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end31
  %arrayidx38 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 7
  store i32 0, i32* %arrayidx38, align 4
  %call39 = call i32 @func7(i32 0)
  store i32 %call39, i32* %r, align 4
  %arrayidx40 = getelementptr inbounds [10 x i32]* %i, i32 0, i64 7
  %7 = load i32* %arrayidx40, align 4
  %tobool41 = icmp ne i32 %7, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end37
  call void @link_error7()
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %if.end37
  %8 = load i32* %r, align 4
  ret i32 %8
}

define i32 @func0(i32 %a) nounwind uwtable readonly {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* @i, align 4
  %sub = sub nsw i32 %0, %1
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
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %a.addr, align 4
  %sub = sub nsw i32 %0, %1
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
  %0 = load i32* @i, align 4
  %1 = load i32* %a.addr, align 4
  %add = add nsw i32 %0, %1
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
  %0 = load i32* %a.addr, align 4
  %mul = mul nsw i32 %0, 3
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
  %0 = load i32* %a.addr, align 4
  %call = call i32 @func0(i32 %0) nounwind readonly
  %1 = load i32* %a.addr, align 4
  %add = add nsw i32 %call, %1
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
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %a.addr, align 4
  %call = call i32 @func1(i32 %1) nounwind readnone
  %add = add nsw i32 %0, %call
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
  %0 = load i32* %a.addr, align 4
  %call = call i32 @func2(i32 %0)
  %1 = load i32* %a.addr, align 4
  %add = add nsw i32 %call, %1
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
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %a.addr, align 4
  %call = call i32 @func3(i32 %1)
  %add = add nsw i32 %0, %call
  ret i32 %add
}

define void @link_error7() nounwind uwtable {
entry:
  ret void
}
