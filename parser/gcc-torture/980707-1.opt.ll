; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/980707-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@buildargv.arglist = internal global [256 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" a b\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i8** @buildargv(i8* %input) nounwind uwtable {
entry:
  br label %while.cond1.outer

while.cond1.outer:                                ; preds = %if.end34, %entry
  %indvar18 = phi i64 [ %tmp21, %if.end34 ], [ 0, %entry ]
  %incdec.ptr362.ph = phi i8* [ %incdec.ptr36, %if.end34 ], [ %input, %entry ]
  %arrayidx = getelementptr [256 x i8*]* @buildargv.arglist, i64 0, i64 %indvar18
  %tmp21 = add i64 %indvar18, 1
  br label %while.cond1

while.cond1:                                      ; preds = %while.cond1.outer, %while.body4
  %0 = phi i64 [ 0, %while.cond1.outer ], [ %indvar.next14, %while.body4 ]
  %incdec.ptr362 = getelementptr i8* %incdec.ptr362.ph, i64 %0
  %tmp2 = load i8* %incdec.ptr362, align 1
  switch i8 %tmp2, label %if.end [
    i8 32, label %while.body4
    i8 0, label %while.end37
  ]

while.body4:                                      ; preds = %while.cond1
  %indvar.next14 = add i64 %0, 1
  br label %while.cond1

if.end:                                           ; preds = %while.cond1
  store i8* %incdec.ptr362, i8** %arrayidx, align 8
  br label %while.cond13

while.cond13:                                     ; preds = %while.body24, %if.end
  %indvar = phi i64 [ %indvar.next, %while.body24 ], [ 0, %if.end ]
  %tmp = add i64 %0, %indvar
  %incdec.ptr361 = getelementptr i8* %incdec.ptr362.ph, i64 %tmp
  %tmp15 = load i8* %incdec.ptr361, align 1
  switch i8 %tmp15, label %while.body24 [
    i8 32, label %if.end34
    i8 0, label %while.end37
  ]

while.body24:                                     ; preds = %while.cond13
  %indvar.next = add i64 %indvar, 1
  br label %while.cond13

if.end34:                                         ; preds = %while.cond13
  %incdec.ptr361.sum = add i64 %tmp, 1
  %incdec.ptr36 = getelementptr inbounds i8* %incdec.ptr362.ph, i64 %incdec.ptr361.sum
  store i8 0, i8* %incdec.ptr361, align 1
  br label %while.cond1.outer

while.end37:                                      ; preds = %while.cond13, %while.cond1
  %tmp383.in = phi i64 [ %indvar18, %while.cond1 ], [ %tmp21, %while.cond13 ]
  %sext = shl i64 %tmp383.in, 32
  %idxprom39 = ashr exact i64 %sext, 32
  %arrayidx40 = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i64 0, i64 %idxprom39
  store i8* null, i8** %arrayidx40, align 8
  ret i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 0)
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %input = alloca [256 x i8], align 16
  %arraydecay = getelementptr inbounds [256 x i8]* %input, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i64 5, i32 1, i1 false)
  br label %while.cond1.outer.i

while.cond1.outer.i:                              ; preds = %if.end34.i, %entry
  %0 = phi i64 [ %tmp21.i, %if.end34.i ], [ 0, %entry ]
  %incdec.ptr362.ph.i = phi i8* [ %incdec.ptr36.i, %if.end34.i ], [ %arraydecay, %entry ]
  %tmp21.i = add i64 %0, 1
  %arrayidx.i = getelementptr [256 x i8*]* @buildargv.arglist, i64 0, i64 %0
  br label %while.cond1.i

while.cond1.i:                                    ; preds = %while.body4.i, %while.cond1.outer.i
  %1 = phi i64 [ 0, %while.cond1.outer.i ], [ %indvar.next14.i, %while.body4.i ]
  %incdec.ptr362.i = getelementptr i8* %incdec.ptr362.ph.i, i64 %1
  %tmp2.i = load i8* %incdec.ptr362.i, align 1
  switch i8 %tmp2.i, label %if.end.i [
    i8 32, label %while.body4.i
    i8 0, label %buildargv.exit
  ]

while.body4.i:                                    ; preds = %while.cond1.i
  %indvar.next14.i = add i64 %1, 1
  br label %while.cond1.i

if.end.i:                                         ; preds = %while.cond1.i
  store i8* %incdec.ptr362.i, i8** %arrayidx.i, align 8
  br label %while.cond13.i

while.cond13.i:                                   ; preds = %while.body24.i, %if.end.i
  %indvar.i = phi i64 [ %indvar.next.i, %while.body24.i ], [ 0, %if.end.i ]
  %tmp.i = add i64 %1, %indvar.i
  %incdec.ptr361.i = getelementptr i8* %incdec.ptr362.ph.i, i64 %tmp.i
  %tmp15.i = load i8* %incdec.ptr361.i, align 1
  switch i8 %tmp15.i, label %while.body24.i [
    i8 32, label %if.end34.i
    i8 0, label %buildargv.exit
  ]

while.body24.i:                                   ; preds = %while.cond13.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %while.cond13.i

if.end34.i:                                       ; preds = %while.cond13.i
  %incdec.ptr361.sum.i = add i64 %tmp.i, 1
  %incdec.ptr36.i = getelementptr inbounds i8* %incdec.ptr362.ph.i, i64 %incdec.ptr361.sum.i
  store i8 0, i8* %incdec.ptr361.i, align 1
  br label %while.cond1.outer.i

buildargv.exit:                                   ; preds = %while.cond13.i, %while.cond1.i
  %tmp383.in.i = phi i64 [ %0, %while.cond1.i ], [ %tmp21.i, %while.cond13.i ]
  %sext.i = shl i64 %tmp383.in.i, 32
  %idxprom39.i = ashr exact i64 %sext.i, 32
  %arrayidx40.i = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i64 0, i64 %idxprom39.i
  store i8* null, i8** %arrayidx40.i, align 8
  %tmp3 = load i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 0), align 16
  %call4 = call i32 @strcmp(i8* %tmp3, i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0)) nounwind readonly
  %tobool = icmp eq i32 %call4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %buildargv.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %buildargv.exit
  %tmp7 = load i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 1), align 8
  %call8 = call i32 @strcmp(i8* %tmp7, i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0)) nounwind readonly
  %tobool9 = icmp eq i32 %call8, 0
  br i1 %tobool9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end
  %tmp14 = load i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 2), align 16
  %cmp = icmp eq i8* %tmp14, null
  br i1 %cmp, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end11
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
