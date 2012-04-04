; ModuleID = '/home/david/src/c-semantics/tests/integration/isSquare.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"5: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"8: %d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"16: %d\0A\00", align 1

define i32 @PerfectSquare(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %h = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %and = and i32 %0, 15
  store i32 %and, i32* %h, align 4
  %1 = load i32* %h, align 4
  %cmp = icmp sgt i32 %1, 9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32* %h, align 4
  %cmp1 = icmp ne i32 %2, 2
  br i1 %cmp1, label %land.lhs.true, label %if.end16

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32* %h, align 4
  %cmp2 = icmp ne i32 %3, 3
  br i1 %cmp2, label %land.lhs.true3, label %if.end16

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i32* %h, align 4
  %cmp4 = icmp ne i32 %4, 5
  br i1 %cmp4, label %land.lhs.true5, label %if.end16

land.lhs.true5:                                   ; preds = %land.lhs.true3
  %5 = load i32* %h, align 4
  %cmp6 = icmp ne i32 %5, 6
  br i1 %cmp6, label %land.lhs.true7, label %if.end16

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %6 = load i32* %h, align 4
  %cmp8 = icmp ne i32 %6, 7
  br i1 %cmp8, label %land.lhs.true9, label %if.end16

land.lhs.true9:                                   ; preds = %land.lhs.true7
  %7 = load i32* %h, align 4
  %cmp10 = icmp ne i32 %7, 8
  br i1 %cmp10, label %if.then11, label %if.end16

if.then11:                                        ; preds = %land.lhs.true9
  %8 = load i32* %n.addr, align 4
  %conv = sitofp i32 %8 to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %add = fadd double %call, 5.000000e-01
  %call12 = call double @floor(double %add) nounwind readnone
  %conv13 = fptosi double %call12 to i32
  store i32 %conv13, i32* %t, align 4
  %9 = load i32* %t, align 4
  %10 = load i32* %t, align 4
  %mul = mul nsw i32 %9, %10
  %11 = load i32* %n.addr, align 4
  %cmp14 = icmp eq i32 %mul, %11
  %conv15 = zext i1 %cmp14 to i32
  store i32 %conv15, i32* %retval
  br label %return

if.end16:                                         ; preds = %land.lhs.true9, %land.lhs.true7, %land.lhs.true5, %land.lhs.true3, %land.lhs.true, %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end16, %if.then11, %if.then
  %12 = load i32* %retval
  ret i32 %12
}

declare double @floor(double) nounwind readnone

declare double @sqrt(double) nounwind readnone

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @PerfectSquare(i32 5)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %call)
  %call2 = call i32 @PerfectSquare(i32 8)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i32 %call2)
  %call4 = call i32 @PerfectSquare(i32 16)
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 %call4)
  ret i32 0
}

declare i32 @printf(i8*, ...)
