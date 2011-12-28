; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/goto.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* %flag, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %target

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %target, %if.end
  br i1 false, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %local, align 4
  %tmp2 = load i32* %local, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  br label %target

target:                                           ; preds = %while.body, %if.then
  store i32 0, i32* %local, align 4
  %tmp3 = load i32* %local, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %tmp3)
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
  %tmp = load i32* %n, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %tmp)
  %tmp1 = load i32* %n, align 4
  %dec = add nsw i32 %tmp1, -1
  store i32 %dec, i32* %n, align 4
  %tmp2 = load i32* %n, align 4
  %cmp = icmp sgt i32 %tmp2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loop
  br label %loop

if.end:                                           ; preds = %loop
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0))
  ret i32 0
}

define i32 @sneaky() nounwind uwtable {
entry:
  %loopGuard = alloca i32, align 4
  store i32 0, i32* %loopGuard, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp = load i32* %loopGuard, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %sneaky
                                                  ; No predecessors!
  %tmp1 = load i32* %loopGuard, align 4
  %cmp2 = icmp ne i32 %tmp1, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %0
  br label %sneaky

sneaky:                                           ; preds = %if.then, %while.body
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  store i32 1, i32* %loopGuard, align 4
  br label %if.end

if.else:                                          ; preds = %0
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

start:                                            ; preds = %last3, %entry
  br label %while.cond

while.cond:                                       ; preds = %start
  %tmp = load i32* %last, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp1 = load i32* %last, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %last, align 4
  %tmp2 = load i32* %last, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  br label %last3

while.end:                                        ; preds = %while.cond
  br label %end

last3:                                            ; preds = %while.body
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
  %tmp = load i32* %another, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %insideLoop

insideLoop:                                       ; preds = %while.body, %entry
  %tmp1 = load i32* %another, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %tmp1)
  %tmp2 = load i32* %another, align 4
  %dec = add nsw i32 %tmp2, -1
  store i32 %dec, i32* %another, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
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
  %tmp = load i32* %count, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %tmp)
  %tmp1 = load i32* %count, align 4
  switch i32 %tmp1, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb5
    i32 3, label %sw.bb7
    i32 4, label %sw.bb9
    i32 5, label %sw.bb11
  ]

sw.bb:                                            ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0))
  br label %next

sw.bb3:                                           ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0))
  br label %next

sw.bb5:                                           ; preds = %entry
  br label %insideTwo

insideTwo:                                        ; preds = %if.then, %insideFive, %sw.bb5
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %next

sw.bb7:                                           ; preds = %entry
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0))
  br label %next

sw.bb9:                                           ; preds = %entry
  br label %insideFour

insideFour:                                       ; preds = %if.then19, %sw.bb9
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0))
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  br label %insideFive

insideFive:                                       ; preds = %if.then24, %sw.bb11
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str11, i32 0, i32 0))
  br label %insideTwo

sw.default:                                       ; preds = %entry
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0))
  br label %next

sw.epilog:                                        ; preds = %insideFour
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str13, i32 0, i32 0))
  br label %next

next:                                             ; preds = %sw.epilog, %sw.default, %sw.bb7, %insideTwo, %sw.bb3, %sw.bb
  %tmp15 = load i32* %thrice, align 4
  %cmp = icmp eq i32 %tmp15, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %next
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i32 0, i32 0))
  store i32 1, i32* %thrice, align 4
  br label %insideTwo

if.else:                                          ; preds = %next
  %tmp17 = load i32* %thrice, align 4
  %cmp18 = icmp eq i32 %tmp17, 1
  br i1 %cmp18, label %if.then19, label %if.else21

if.then19:                                        ; preds = %if.else
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str15, i32 0, i32 0))
  store i32 2, i32* %thrice, align 4
  br label %insideFour

if.else21:                                        ; preds = %if.else
  %tmp22 = load i32* %thrice, align 4
  %cmp23 = icmp eq i32 %tmp22, 2
  br i1 %cmp23, label %if.then24, label %if.end

if.then24:                                        ; preds = %if.else21
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str16, i32 0, i32 0))
  store i32 3, i32* %thrice, align 4
  br label %insideFive

if.end:                                           ; preds = %if.else21
  br label %if.end26

if.end26:                                         ; preds = %if.end
  br label %if.end27

if.end27:                                         ; preds = %if.end26
  store i32 4, i32* %x, align 4
  %tmp29 = load i32* %x, align 4
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str17, i32 0, i32 0), i32 %tmp29)
  br label %while.cond

while.cond:                                       ; preds = %if.end37, %if.end27
  %tmp31 = load i32* %x, align 4
  %cmp32 = icmp ult i32 %tmp31, 10
  br i1 %cmp32, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp33 = load i32* %x, align 4
  %inc = add i32 %tmp33, 1
  store i32 %inc, i32* %x, align 4
  %tmp34 = load i32* %x, align 4
  %rem = urem i32 %tmp34, 2
  %cmp35 = icmp eq i32 %rem, 0
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %while.body
  br label %done

if.end37:                                         ; preds = %while.body
  %tmp38 = load i32* %x, align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str18, i32 0, i32 0), i32 %tmp38)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %done

done:                                             ; preds = %while.end, %if.then36
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
