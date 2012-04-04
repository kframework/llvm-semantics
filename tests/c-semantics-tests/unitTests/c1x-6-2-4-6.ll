; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x-6-2-4-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"1i = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"2i = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"3i = %d\0A\00", align 1

define i32 @f1() nounwind uwtable {
entry:
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* null, i32** %p, align 8
  br label %label

label:                                            ; preds = %if.end3, %entry
  %0 = load i32** %p, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %1 = load i32** %p, align 8
  %2 = load i32* %1, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %2)
  br label %end

if.end:                                           ; preds = %label
  %3 = load i32** %p, align 8
  %tobool1 = icmp ne i32* %3, null
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i32 16, i32* %i, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  store i32* %i, i32** %p, align 8
  br label %label

end:                                              ; preds = %if.then
  ret i32 0
}

declare i32 @printf(i8*, ...)

define i32 @f2() nounwind uwtable {
entry:
  %count = alloca i32, align 4
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  store i32* null, i32** %p, align 8
  br label %label

label:                                            ; preds = %if.end5, %entry
  %0 = load i32** %p, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %1 = load i32** %p, align 8
  %2 = load i32* %1, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %label
  %3 = load i32* %count, align 4
  %cmp = icmp slt i32 %3, 3
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %4 = load i32* %count, align 4
  store i32 %4, i32* %i, align 4
  %5 = load i32* %count, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %count, align 4
  br label %if.end2

if.else:                                          ; preds = %if.end
  br label %end

if.end2:                                          ; preds = %if.then1
  %6 = load i32** %p, align 8
  %cmp3 = icmp eq i32* %6, null
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  store i32* %i, i32** %p, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end2
  br label %label

end:                                              ; preds = %if.else
  ret i32 0
}

define i32 @f3() nounwind uwtable {
entry:
  %count = alloca i32, align 4
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  store i32* null, i32** %p, align 8
  br label %label

label:                                            ; preds = %if.end4, %entry
  %0 = load i32** %p, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %1 = load i32** %p, align 8
  %2 = load i32* %1, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %label
  store i32 5, i32* %i, align 4
  %3 = load i32* %count, align 4
  %cmp = icmp slt i32 %3, 3
  br i1 %cmp, label %if.then1, label %if.end5

if.then1:                                         ; preds = %if.end
  %4 = load i32* %count, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %count, align 4
  %5 = load i32** %p, align 8
  %cmp2 = icmp eq i32* %5, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.then1
  store i32* %i, i32** %p, align 8
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.then1
  br label %label

if.end5:                                          ; preds = %if.end
  ret i32 0
}

define i32 @f4() nounwind uwtable {
entry:
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  br label %label

label:                                            ; preds = %if.then, %entry
  %0 = load i32* %count, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %1 = load i32* %count, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %count, align 4
  br label %label

if.end:                                           ; preds = %label
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f1()
  %call1 = call i32 @f2()
  %call2 = call i32 @f3()
  %call3 = call i32 @f4()
  ret i32 0
}
