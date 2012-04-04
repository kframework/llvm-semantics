; ModuleID = '/home/david/src/c-semantics/tests/unitTests/goto.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"local=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"The count is %d.  \0AThis is \00", align 1
@.str17 = private unnamed_addr constant [24 x i8] c"The test number is %d.\0A\00", align 1
@.str18 = private unnamed_addr constant [22 x i8] c"%d is an odd number.\0A\00", align 1
@.str19 = private unnamed_addr constant [15 x i8] c"gotowhile: %d\0A\00", align 1
@.str20 = private unnamed_addr constant [14 x i8] c"gotoloop: %d\0A\00", align 1
@.str21 = private unnamed_addr constant [12 x i8] c"sneaky: %d\0A\00", align 1
@.str22 = private unnamed_addr constant [14 x i8] c"myswitch: %d\0A\00", align 1
@.str23 = private unnamed_addr constant [13 x i8] c"another: %d\0A\00", align 1
@.str24 = private unnamed_addr constant [10 x i8] c"last: %d\0A\00", align 1
@str = private unnamed_addr constant [6 x i8] c"Done!\00"
@str25 = private unnamed_addr constant [7 x i8] c"sneaky\00"
@str26 = private unnamed_addr constant [8 x i8] c"a pair.\00"
@str27 = private unnamed_addr constant [18 x i8] c"jumping into case\00"
@str28 = private unnamed_addr constant [26 x i8] c"jumping into weird case 1\00"
@str29 = private unnamed_addr constant [30 x i8] c"inside switch, going to break\00"
@str30 = private unnamed_addr constant [6 x i8] c"Broke\00"
@str31 = private unnamed_addr constant [26 x i8] c"jumping into weird case 2\00"
@str32 = private unnamed_addr constant [42 x i8] c"inside switch, going to goto another case\00"

define i32 @gotowhile() nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @gotoloop() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 10) nounwind
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 9) nounwind
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 8) nounwind
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 7) nounwind
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 6) nounwind
  %call.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 5) nounwind
  %call.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 4) nounwind
  %call.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 3) nounwind
  %call.8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call.9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str, i64 0, i64 0))
  ret i32 0
}

define i32 @sneaky() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str25, i64 0, i64 0))
  ret i32 0
}

define i32 @last() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 3) nounwind
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 4) nounwind
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 5) nounwind
  ret i32 0
}

define i32 @another() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 5) nounwind
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 4) nounwind
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 3) nounwind
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  %putchar = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

define i32 @myswitch() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), i32 2) nounwind
  br label %insideTwo

insideTwo:                                        ; preds = %if.then, %if.then20, %entry
  %thrice.0 = phi i32 [ 0, %entry ], [ 1, %if.then ], [ 3, %if.then20 ]
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str26, i64 0, i64 0))
  br label %next

next:                                             ; preds = %if.then16, %insideTwo
  %thrice.3 = phi i32 [ %thrice.0, %insideTwo ], [ 2, %if.then16 ]
  switch i32 %thrice.3, label %if.end23 [
    i32 0, label %if.then
    i32 1, label %if.then16
    i32 2, label %if.then20
  ]

if.then:                                          ; preds = %next
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str27, i64 0, i64 0))
  br label %insideTwo

if.then16:                                        ; preds = %next
  %puts31 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str28, i64 0, i64 0))
  %puts32 = tail call i32 @puts(i8* getelementptr inbounds ([30 x i8]* @str29, i64 0, i64 0))
  %puts33 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str30, i64 0, i64 0))
  br label %next

if.then20:                                        ; preds = %next
  %puts34 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str31, i64 0, i64 0))
  %puts35 = tail call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @str32, i64 0, i64 0))
  br label %insideTwo

if.end23:                                         ; preds = %next
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str17, i64 0, i64 0), i32 4) nounwind
  br label %while.cond

while.cond:                                       ; preds = %if.end28, %if.end23
  %x.0 = phi i32 [ 4, %if.end23 ], [ %inc, %if.end28 ]
  %cmp25 = icmp ult i32 %x.0, 10
  br i1 %cmp25, label %while.body, label %repeatedLabel

while.body:                                       ; preds = %while.cond
  %inc = add i32 %x.0, 1
  %rem = and i32 %inc, 1
  %cmp26 = icmp eq i32 %rem, 0
  br i1 %cmp26, label %repeatedLabel, label %if.end28

if.end28:                                         ; preds = %while.body
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str18, i64 0, i64 0), i32 %inc) nounwind
  br label %while.cond

repeatedLabel:                                    ; preds = %while.body, %while.cond
  ret i32 1
}

define i32 @main() nounwind uwtable {
entry:
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str19, i64 0, i64 0), i32 0) nounwind
  %call2 = tail call i32 @gotoloop()
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str20, i64 0, i64 0), i32 0) nounwind
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str25, i64 0, i64 0)) nounwind
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str21, i64 0, i64 0), i32 0) nounwind
  %call6 = tail call i32 @myswitch()
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i32 1) nounwind
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 5) nounwind
  %call.1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 4) nounwind
  %call.2.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 3) nounwind
  %call.3.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call.4.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  %putchar.i = tail call i32 @putchar(i32 10) nounwind
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str23, i64 0, i64 0), i32 0) nounwind
  %call.i12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  %call.1.i13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call.2.i14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 3) nounwind
  %call.3.i15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 4) nounwind
  %call.4.i16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 5) nounwind
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str24, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)
