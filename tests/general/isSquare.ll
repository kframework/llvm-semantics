; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/isSquare.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* %n.addr, align 4
  %and = and i32 %tmp, 15
  store i32 %and, i32* %h, align 4
  %tmp1 = load i32* %h, align 4
  %cmp = icmp sgt i32 %tmp1, 9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp2 = load i32* %h, align 4
  %cmp3 = icmp ne i32 %tmp2, 2
  br i1 %cmp3, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %if.end
  %tmp4 = load i32* %h, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %land.lhs.true6, label %if.end28

land.lhs.true6:                                   ; preds = %land.lhs.true
  %tmp7 = load i32* %h, align 4
  %cmp8 = icmp ne i32 %tmp7, 5
  br i1 %cmp8, label %land.lhs.true9, label %if.end28

land.lhs.true9:                                   ; preds = %land.lhs.true6
  %tmp10 = load i32* %h, align 4
  %cmp11 = icmp ne i32 %tmp10, 6
  br i1 %cmp11, label %land.lhs.true12, label %if.end28

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %h, align 4
  %cmp14 = icmp ne i32 %tmp13, 7
  br i1 %cmp14, label %land.lhs.true15, label %if.end28

land.lhs.true15:                                  ; preds = %land.lhs.true12
  %tmp16 = load i32* %h, align 4
  %cmp17 = icmp ne i32 %tmp16, 8
  br i1 %cmp17, label %if.then18, label %if.end28

if.then18:                                        ; preds = %land.lhs.true15
  %tmp20 = load i32* %n.addr, align 4
  %conv = sitofp i32 %tmp20 to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %add = fadd double %call, 5.000000e-01
  %call21 = call double @floor(double %add) nounwind readnone
  %conv22 = fptosi double %call21 to i32
  store i32 %conv22, i32* %t, align 4
  %tmp23 = load i32* %t, align 4
  %tmp24 = load i32* %t, align 4
  %mul = mul nsw i32 %tmp23, %tmp24
  %tmp25 = load i32* %n.addr, align 4
  %cmp26 = icmp eq i32 %mul, %tmp25
  %conv27 = zext i1 %cmp26 to i32
  store i32 %conv27, i32* %retval
  br label %return

if.end28:                                         ; preds = %land.lhs.true15, %land.lhs.true12, %land.lhs.true9, %land.lhs.true6, %land.lhs.true, %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end28, %if.then18, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
