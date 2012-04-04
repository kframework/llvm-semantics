; ModuleID = '/home/david/src/c-semantics/tests/unitTests/goto.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"local=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"Done!\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"sneaky\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"The count is %d.  \0AThis is \00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"none.\0A\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"only one.\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"a pair.\0A\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"three.\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"inside switch, going to break\0A\00", align 1
@.str11 = private unnamed_addr constant [43 x i8] c"inside switch, going to goto another case\0A\00", align 1
@.str12 = private unnamed_addr constant [7 x i8] c"many.\0A\00", align 1
@.str13 = private unnamed_addr constant [7 x i8] c"Broke\0A\00", align 1
@.str14 = private unnamed_addr constant [19 x i8] c"jumping into case\0A\00", align 1
@.str15 = private unnamed_addr constant [27 x i8] c"jumping into weird case 1\0A\00", align 1
@.str16 = private unnamed_addr constant [27 x i8] c"jumping into weird case 2\0A\00", align 1
@.str17 = private unnamed_addr constant [24 x i8] c"The test number is %d.\0A\00", align 1
@.str18 = private unnamed_addr constant [22 x i8] c"%d is an odd number.\0A\00", align 1
@.str19 = private unnamed_addr constant [15 x i8] c"gotowhile: %d\0A\00", align 1
@.str20 = private unnamed_addr constant [14 x i8] c"gotoloop: %d\0A\00", align 1
@.str21 = private unnamed_addr constant [12 x i8] c"sneaky: %d\0A\00", align 1
@.str22 = private unnamed_addr constant [14 x i8] c"myswitch: %d\0A\00", align 1
@.str23 = private unnamed_addr constant [13 x i8] c"another: %d\0A\00", align 1
@.str24 = private unnamed_addr constant [10 x i8] c"last: %d\0A\00", align 1

define i32 @gotowhile() nounwind uwtable {
entry:
  %flag = alloca i32, align 4
  %local = alloca i32, align 4
  store i32 1, i32* %flag, align 4
  %0 = load i32* %flag, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %target

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %target, %if.end
  br i1 false, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %local, align 4
  %1 = load i32* %local, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %1)
  br label %target

target:                                           ; preds = %while.body, %if.then
  store i32 0, i32* %local, align 4
  %2 = load i32* %local, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %2)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare i32 @printf(i8*, ...)

define i32 @gotoloop() nounwind uwtable {
entry:
  %n = alloca i32, align 4
  store i32 10, i32* %n, align 4
  br label %loop

loop:                                             ; preds = %if.then, %entry
  %0 = load i32* %n, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %0)
  %1 = load i32* %n, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %n, align 4
  %2 = load i32* %n, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loop
  br label %loop

if.end:                                           ; preds = %loop
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0))
  ret i32 0
}

define i32 @sneaky() nounwind uwtable {
entry:
  %loopGuard = alloca i32, align 4
  store i32 0, i32* %loopGuard, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32* %loopGuard, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %sneaky
                                                  ; No predecessors!
  %2 = load i32* %loopGuard, align 4
  %cmp1 = icmp ne i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %1
  br label %sneaky

sneaky:                                           ; preds = %if.then, %while.body
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  store i32 1, i32* %loopGuard, align 4
  br label %if.end

if.else:                                          ; preds = %1
  store i32 0, i32* %loopGuard, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %sneaky
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

define i32 @last() nounwind uwtable {
entry:
  %last = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %last, align 4
  store i32 5, i32* %x, align 4
  br label %start

start:                                            ; preds = %last1, %entry
  br label %while.cond

while.cond:                                       ; preds = %start
  %0 = load i32* %last, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32* %last, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %last, align 4
  %2 = load i32* %last, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %2)
  br label %last1

while.end:                                        ; preds = %while.cond
  br label %end

last1:                                            ; preds = %while.body
  br label %start

end:                                              ; preds = %while.end
  ret i32 0
}

define i32 @another() nounwind uwtable {
entry:
  %another = alloca i32, align 4
  store i32 5, i32* %another, align 4
  br label %insideLoop
                                                  ; No predecessors!
  br label %while.cond

while.cond:                                       ; preds = %insideLoop, %0
  %1 = load i32* %another, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %insideLoop

insideLoop:                                       ; preds = %while.body, %entry
  %2 = load i32* %another, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %2)
  %3 = load i32* %another, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %another, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %repeatedLabel

repeatedLabel:                                    ; preds = %while.end
  ret i32 0
}

define i32 @myswitch() nounwind uwtable {
entry:
  %count = alloca i32, align 4
  %thrice = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %thrice, align 4
  store i32 2, i32* %count, align 4
  %0 = load i32* %count, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %0)
  %1 = load i32* %count, align 4
  switch i32 %1, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb4
    i32 3, label %sw.bb6
    i32 4, label %sw.bb8
    i32 5, label %sw.bb10
  ]

sw.bb:                                            ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0))
  br label %next

sw.bb2:                                           ; preds = %entry
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0))
  br label %next

sw.bb4:                                           ; preds = %entry
  br label %insideTwo

insideTwo:                                        ; preds = %if.then, %insideFive, %sw.bb4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %next

sw.bb6:                                           ; preds = %entry
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0))
  br label %next

sw.bb8:                                           ; preds = %entry
  br label %insideFour

insideFour:                                       ; preds = %if.then16, %sw.bb8
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0))
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  br label %insideFive

insideFive:                                       ; preds = %if.then20, %sw.bb10
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str11, i32 0, i32 0))
  br label %insideTwo

sw.default:                                       ; preds = %entry
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0))
  br label %next

sw.epilog:                                        ; preds = %insideFour
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str13, i32 0, i32 0))
  br label %next

next:                                             ; preds = %sw.epilog, %sw.default, %sw.bb6, %insideTwo, %sw.bb2, %sw.bb
  %2 = load i32* %thrice, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %next
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i32 0, i32 0))
  store i32 1, i32* %thrice, align 4
  br label %insideTwo

if.else:                                          ; preds = %next
  %3 = load i32* %thrice, align 4
  %cmp15 = icmp eq i32 %3, 1
  br i1 %cmp15, label %if.then16, label %if.else18

if.then16:                                        ; preds = %if.else
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str15, i32 0, i32 0))
  store i32 2, i32* %thrice, align 4
  br label %insideFour

if.else18:                                        ; preds = %if.else
  %4 = load i32* %thrice, align 4
  %cmp19 = icmp eq i32 %4, 2
  br i1 %cmp19, label %if.then20, label %if.end

if.then20:                                        ; preds = %if.else18
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str16, i32 0, i32 0))
  store i32 3, i32* %thrice, align 4
  br label %insideFive

if.end:                                           ; preds = %if.else18
  br label %if.end22

if.end22:                                         ; preds = %if.end
  br label %if.end23

if.end23:                                         ; preds = %if.end22
  store i32 4, i32* %x, align 4
  %5 = load i32* %x, align 4
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str17, i32 0, i32 0), i32 %5)
  br label %while.cond

while.cond:                                       ; preds = %if.end28, %if.end23
  %6 = load i32* %x, align 4
  %cmp25 = icmp ult i32 %6, 10
  br i1 %cmp25, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32* %x, align 4
  %inc = add i32 %7, 1
  store i32 %inc, i32* %x, align 4
  %8 = load i32* %x, align 4
  %rem = urem i32 %8, 2
  %cmp26 = icmp eq i32 %rem, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %while.body
  br label %done

if.end28:                                         ; preds = %while.body
  %9 = load i32* %x, align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str18, i32 0, i32 0), i32 %9)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %done

done:                                             ; preds = %while.end, %if.then27
  br label %repeatedLabel

repeatedLabel:                                    ; preds = %done
  ret i32 1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @gotowhile()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %call)
  %call2 = call i32 @gotoloop()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str20, i32 0, i32 0), i32 %call2)
  %call4 = call i32 @sneaky()
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str21, i32 0, i32 0), i32 %call4)
  %call6 = call i32 @myswitch()
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str22, i32 0, i32 0), i32 %call6)
  %call8 = call i32 @another()
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str23, i32 0, i32 0), i32 %call8)
  %call10 = call i32 @last()
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str24, i32 0, i32 0), i32 %call10)
  ret i32 0
}
