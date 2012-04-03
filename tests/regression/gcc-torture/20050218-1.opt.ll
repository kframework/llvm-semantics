; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050218-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@a = global [16 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], align 16
@.str4 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1

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

define i32 @foo(i8* %x, i8* %y, i64 %n) nounwind uwtable readonly {
entry:
  %tobool = icmp eq i8* %y, null
  br i1 %tobool, label %for.cond.us, label %for.cond

for.cond.us:                                      ; preds = %entry, %for.inc.us
  %add212.us = phi i64 [ %add.us, %for.inc.us ], [ 0, %entry ]
  %0 = phi i64 [ %inc.us, %for.inc.us ], [ 0, %entry ]
  %cmp.us = icmp ult i64 %0, %n
  br i1 %cmp.us, label %for.body.us, label %return

for.inc.us:                                       ; preds = %for.body.us
  %add.us = add i64 %call.us, %add212.us
  %inc.us = add i64 %0, 1
  br label %for.cond.us

for.body.us:                                      ; preds = %for.cond.us
  %arrayidx.us = getelementptr [16 x i8*]* @a, i64 0, i64 %0
  %add.ptr.us = getelementptr inbounds i8* %x, i64 %add212.us
  %tmp5.us = load i8** %arrayidx.us, align 8
  %call.us = tail call i64 @strlen(i8* %tmp5.us) nounwind
  %call9.us = tail call i32 @strncmp(i8* %add.ptr.us, i8* %tmp5.us, i64 %call.us) nounwind
  %cmp10.us = icmp eq i32 %call9.us, 0
  br i1 %cmp10.us, label %for.inc.us, label %return

for.cond:                                         ; preds = %entry, %for.inc
  %add212 = phi i64 [ %add21, %for.inc ], [ 0, %entry ]
  %1 = phi i64 [ %inc, %for.inc ], [ 0, %entry ]
  %cmp = icmp ult i64 %1, %n
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [16 x i8*]* @a, i64 0, i64 %1
  %add.ptr = getelementptr inbounds i8* %x, i64 %add212
  %tmp5 = load i8** %arrayidx, align 8
  %call = tail call i64 @strlen(i8* %tmp5) nounwind
  %call9 = tail call i32 @strncmp(i8* %add.ptr, i8* %tmp5, i64 %call) nounwind
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %add = add i64 %call, %add212
  %call19 = tail call i64 @strlen(i8* %y) nounwind
  %add21 = add i64 %call19, %add
  %inc = add i64 %1, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body, %for.cond.us, %for.body.us
  %storemerge1 = phi i32 [ 0, %for.cond.us ], [ 2, %for.body.us ], [ 0, %for.cond ], [ 2, %for.body ]
  ret i32 %storemerge1
}

declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare i64 @strlen(i8* nocapture) nounwind readonly

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @foo(i8* getelementptr inbounds ([6 x i8]* @.str4, i64 0, i64 0), i8* null, i64 3)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
