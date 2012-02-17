; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-2-4-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"1i = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"2i = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"3i = %d\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @f1() nounwind uwtable {
entry:
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* null, i32** %p, align 8
  br label %label

label:                                            ; preds = %if.end7, %entry
  %tmp = load i32** %p, align 8
  %tobool = icmp ne i32* %tmp, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %tmp1 = load i32** %p, align 8
  %tmp2 = load i32* %tmp1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  br label %end

if.end:                                           ; preds = %label
  %tmp4 = load i32** %p, align 8
  %tobool5 = icmp ne i32* %tmp4, null
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  store i32 16, i32* %i, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
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

label:                                            ; preds = %if.end12, %entry
  %tmp = load i32** %p, align 8
  %tobool = icmp ne i32* %tmp, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %tmp1 = load i32** %p, align 8
  %tmp2 = load i32* %tmp1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  br label %if.end

if.end:                                           ; preds = %if.then, %label
  %tmp4 = load i32* %count, align 4
  %cmp = icmp slt i32 %tmp4, 3
  br i1 %cmp, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  %tmp6 = load i32* %count, align 4
  store i32 %tmp6, i32* %i, align 4
  %tmp7 = load i32* %count, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %count, align 4
  br label %if.end8

if.else:                                          ; preds = %if.end
  br label %end

if.end8:                                          ; preds = %if.then5
  %tmp9 = load i32** %p, align 8
  %cmp10 = icmp eq i32* %tmp9, null
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  store i32* %i, i32** %p, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end8
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

label:                                            ; preds = %if.end10, %entry
  %tmp = load i32** %p, align 8
  %tobool = icmp ne i32* %tmp, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %tmp1 = load i32** %p, align 8
  %tmp2 = load i32* %tmp1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %tmp2)
  br label %if.end

if.end:                                           ; preds = %if.then, %label
  store i32 5, i32* %i, align 4
  %tmp4 = load i32* %count, align 4
  %cmp = icmp slt i32 %tmp4, 3
  br i1 %cmp, label %if.then5, label %if.end11

if.then5:                                         ; preds = %if.end
  %tmp6 = load i32* %count, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %count, align 4
  %tmp7 = load i32** %p, align 8
  %cmp8 = icmp eq i32* %tmp7, null
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then5
  store i32* %i, i32** %p, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then5
  br label %label

if.end11:                                         ; preds = %if.end
  ret i32 0
}

define i32 @f4() nounwind uwtable {
entry:
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %count, align 4
  br label %label

label:                                            ; preds = %if.then, %entry
  %tmp = load i32* %count, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %tmp1 = load i32* %count, align 4
  %inc = add nsw i32 %tmp1, 1
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
