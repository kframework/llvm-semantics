; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/isSquare.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  switch i32 %and, label %if.then18 [
    i32 8, label %return
    i32 7, label %return
    i32 6, label %return
    i32 5, label %return
    i32 3, label %return
    i32 2, label %return
  ]

if.then18:                                        ; preds = %if.end
  %conv = sitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %add = fadd double %call, 5.000000e-01
  %call21 = tail call double @floor(double %add) nounwind readnone
  %conv22 = fptosi double %call21 to i32
  %mul = mul nsw i32 %conv22, %conv22
  %cmp26 = icmp eq i32 %mul, %n
  %conv27 = zext i1 %cmp26 to i32
  br label %return

return:                                           ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %entry, %if.then18
  %0 = phi i32 [ %conv27, %if.then18 ], [ 0, %entry ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ]
  ret i32 %0
}

declare double @floor(double) nounwind readnone

declare double @sqrt(double) nounwind readnone

define i32 @main() nounwind uwtable {
PerfectSquare.exit1:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), i32 0) nounwind
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0), i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
