; ModuleID = '/home/david/src/c-semantics/tests/unitTests/gcc-loop3c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [26 x i8] c"a[0x10] || a[0x08] == %d\0A\00", align 1

define void @f(i32 %m) nounwind uwtable {
entry:
  %m.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sh = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 256, i32* %sh, align 4
  %0 = load i32* %m.addr, align 4
  store i32 %0, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32* %i, align 4
  %shl = shl i32 %1, 3
  %idx.ext = zext i32 %shl to i64
  %add.ptr = getelementptr inbounds i8* bitcast ([255 x i8*]* @a to i8*), i64 %idx.ext
  %2 = load i32* %sh, align 4
  %shr = ashr i32 %2, 1
  store i32 %shr, i32* %sh, align 4
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [255 x i8*]* @a, i32 0, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx, align 8
  %3 = load i32* %i, align 4
  %add = add nsw i32 %3, 4
  store i32 %add, i32* %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %4 = load i32* %i, align 4
  %cmp = icmp slt i32 %4, 1073741840
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 1610612736)
  %0 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %1 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool1 = icmp ne i8* %1, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %2 = phi i1 [ true, %entry ], [ %tobool1, %lor.rhs ]
  %lor.ext = zext i1 %2 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %lor.ext)
  %3 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %lor.end
  %4 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool3 = icmp ne i8* %4, null
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %lor.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 1073741824)
  %5 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool4 = icmp ne i8* %5, null
  br i1 %tobool4, label %lor.end7, label %lor.rhs5

lor.rhs5:                                         ; preds = %if.end
  %6 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool6 = icmp ne i8* %6, null
  br label %lor.end7

lor.end7:                                         ; preds = %lor.rhs5, %if.end
  %7 = phi i1 [ true, %if.end ], [ %tobool6, %lor.rhs5 ]
  %lor.ext8 = zext i1 %7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %lor.ext8)
  %8 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %tobool10 = icmp ne i8* %8, null
  br i1 %tobool10, label %lor.lhs.false11, label %if.then13

lor.lhs.false11:                                  ; preds = %lor.end7
  %9 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %tobool12 = icmp ne i8* %9, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false11, %lor.end7
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %lor.lhs.false11
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare i32 @printf(i8*, ...)

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
