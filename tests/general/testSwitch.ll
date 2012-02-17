; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: You typed zero.\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"%d: is a perfect square.\0A\00", align 1
@.str2 = private unnamed_addr constant [24 x i8] c"%d: is an even number.\0A\00", align 1
@.str3 = private unnamed_addr constant [24 x i8] c"%d: is a prime number.\0A\00", align 1
@.str4 = private unnamed_addr constant [44 x i8] c"%d: Only single-digit numbers are allowed.\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"The count is %d.  \0AThis is \00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"none.\0A\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"only one.\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"a pair.\0A\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"three.\0A\00", align 1
@.str10 = private unnamed_addr constant [7 x i8] c"four.\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"inside switch, going to break\0A\00", align 1
@.str12 = private unnamed_addr constant [7 x i8] c"many.\0A\00", align 1
@.str13 = private unnamed_addr constant [7 x i8] c"Broke\0A\00", align 1

define void @doSwitch(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 9, label %sw.bb2
    i32 2, label %sw.bb5
    i32 3, label %sw.bb8
    i32 5, label %sw.bb8
    i32 7, label %sw.bb8
    i32 4, label %sw.bb11
    i32 6, label %sw.bb14
    i32 8, label %sw.bb14
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load i32* %n.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry, %entry
  %tmp3 = load i32* %n.addr, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp3)
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %tmp6 = load i32* %n.addr, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str2, i32 0, i32 0), i32 %tmp6)
  br label %sw.bb8

sw.bb8:                                           ; preds = %entry, %entry, %entry, %sw.bb5
  %tmp9 = load i32* %n.addr, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), i32 %tmp9)
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %tmp12 = load i32* %n.addr, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %tmp12)
  br label %sw.bb14

sw.bb14:                                          ; preds = %entry, %entry, %sw.bb11
  %tmp15 = load i32* %n.addr, align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str2, i32 0, i32 0), i32 %tmp15)
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %tmp17 = load i32* %n.addr, align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str4, i32 0, i32 0), i32 %tmp17)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb14, %sw.bb8, %sw.bb2, %sw.bb
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @myswitch(i32 %count) nounwind uwtable {
entry:
  %count.addr = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %tmp = load i32* %count.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %tmp)
  %tmp1 = load i32* %count.addr, align 4
  switch i32 %tmp1, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb5
    i32 3, label %sw.bb7
    i32 4, label %sw.bb9
  ]

sw.bb:                                            ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0))
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0))
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  br label %insideTwo

insideTwo:                                        ; preds = %sw.bb5
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0))
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  br label %insideFour

insideFour:                                       ; preds = %sw.bb9
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0))
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0))
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0))
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %insideFour, %sw.bb7, %insideTwo, %sw.bb3, %sw.bb
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str13, i32 0, i32 0))
  br label %next

next:                                             ; preds = %sw.epilog
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  call void @doSwitch(i32 %tmp1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i4, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc10, %for.end
  %tmp6 = load i32* %i4, align 4
  %cmp7 = icmp slt i32 %tmp6, 6
  br i1 %cmp7, label %for.body8, label %for.end13

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %i4, align 4
  %call = call i32 @myswitch(i32 %tmp9)
  br label %for.inc10

for.inc10:                                        ; preds = %for.body8
  %tmp11 = load i32* %i4, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i4, align 4
  br label %for.cond5

for.end13:                                        ; preds = %for.cond5
  ret i32 0
}
