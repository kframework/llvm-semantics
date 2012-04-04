; ModuleID = '/home/david/src/c-semantics/tests/integration/isSquare.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"5: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"8: %d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"16: %d\0A\00", align 1

define i32 @PerfectSquare(i32 %n) nounwind uwtable readnone {
entry:
  %and = and i32 %n, 15
  %cmp = icmp ugt i32 %and, 9
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %and.off = add i32 %and, -2
  %0 = icmp ugt i32 %and.off, 1
  %cmp4 = icmp ne i32 %and, 5
  %or.cond17 = and i1 %0, %cmp4
  %cmp6 = icmp ne i32 %and, 6
  %or.cond18 = and i1 %or.cond17, %cmp6
  %cmp8 = icmp ne i32 %and, 7
  %or.cond19 = and i1 %or.cond18, %cmp8
  %cmp10 = icmp ne i32 %and, 8
  %or.cond20 = and i1 %or.cond19, %cmp10
  br i1 %or.cond20, label %if.then11, label %return

if.then11:                                        ; preds = %if.end
  %conv = sitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %add = fadd double %call, 5.000000e-01
  %call12 = tail call double @floor(double %add) nounwind readnone
  %conv13 = fptosi double %call12 to i32
  %mul = mul nsw i32 %conv13, %conv13
  %cmp14 = icmp eq i32 %mul, %n
  %conv15 = zext i1 %cmp14 to i32
  br label %return

return:                                           ; preds = %if.end, %entry, %if.then11
  %retval.0 = phi i32 [ %conv15, %if.then11 ], [ 0, %entry ], [ 0, %if.end ]
  ret i32 %retval.0
}

declare double @floor(double) nounwind readnone

declare double @sqrt(double) nounwind readnone

define i32 @main() nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), i32 0) nounwind
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0), i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
