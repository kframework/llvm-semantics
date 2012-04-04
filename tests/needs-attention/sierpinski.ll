; ModuleID = '/home/david/src/c-semantics/tests/integration/sierpinski.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i8* @apply_rules(i8* %new_sl, i8* %sl, i64 %width) nounwind uwtable {
entry:
  %new_sl.addr = alloca i8*, align 8
  %sl.addr = alloca i8*, align 8
  %width.addr = alloca i64, align 8
  %i = alloca i32, align 4
  %t1 = alloca i8, align 1
  %t2 = alloca i8, align 1
  store i8* %new_sl, i8** %new_sl.addr, align 8
  store i8* %sl, i8** %sl.addr, align 8
  store i64 %width, i64* %width.addr, align 8
  %0 = load i8** %sl.addr, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 0
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i8** %sl.addr, align 8
  %arrayidx1 = getelementptr inbounds i8* %2, i64 1
  %3 = load i8* %arrayidx1, align 1
  %conv2 = sext i8 %3 to i32
  %tobool3 = icmp ne i32 %conv2, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %tobool3, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  %conv4 = trunc i32 %lor.ext to i8
  %5 = load i8** %new_sl.addr, align 8
  %arrayidx5 = getelementptr inbounds i8* %5, i64 0
  store i8 %conv4, i8* %arrayidx5, align 1
  %6 = load i64* %width.addr, align 8
  %sub = sub i64 %6, 2
  %7 = load i8** %sl.addr, align 8
  %arrayidx6 = getelementptr inbounds i8* %7, i64 %sub
  %8 = load i8* %arrayidx6, align 1
  %conv7 = sext i8 %8 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br i1 %tobool8, label %lor.end14, label %lor.rhs9

lor.rhs9:                                         ; preds = %lor.end
  %9 = load i64* %width.addr, align 8
  %sub10 = sub i64 %9, 1
  %10 = load i8** %sl.addr, align 8
  %arrayidx11 = getelementptr inbounds i8* %10, i64 %sub10
  %11 = load i8* %arrayidx11, align 1
  %conv12 = sext i8 %11 to i32
  %tobool13 = icmp ne i32 %conv12, 0
  br label %lor.end14

lor.end14:                                        ; preds = %lor.rhs9, %lor.end
  %12 = phi i1 [ true, %lor.end ], [ %tobool13, %lor.rhs9 ]
  %lor.ext15 = zext i1 %12 to i32
  %conv16 = trunc i32 %lor.ext15 to i8
  %13 = load i64* %width.addr, align 8
  %sub17 = sub i64 %13, 1
  %14 = load i8** %new_sl.addr, align 8
  %arrayidx18 = getelementptr inbounds i8* %14, i64 %sub17
  store i8 %conv16, i8* %arrayidx18, align 1
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lor.end14
  %15 = load i32* %i, align 4
  %conv19 = sext i32 %15 to i64
  %16 = load i64* %width.addr, align 8
  %sub20 = sub i64 %16, 1
  %cmp = icmp ult i64 %conv19, %sub20
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load i32* %i, align 4
  %sub22 = sub nsw i32 %17, 1
  %idxprom = sext i32 %sub22 to i64
  %18 = load i8** %sl.addr, align 8
  %arrayidx23 = getelementptr inbounds i8* %18, i64 %idxprom
  %19 = load i8* %arrayidx23, align 1
  %conv24 = sext i8 %19 to i32
  %tobool25 = icmp ne i32 %conv24, 0
  br i1 %tobool25, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.body
  %20 = load i32* %i, align 4
  %idxprom26 = sext i32 %20 to i64
  %21 = load i8** %sl.addr, align 8
  %arrayidx27 = getelementptr inbounds i8* %21, i64 %idxprom26
  %22 = load i8* %arrayidx27, align 1
  %conv28 = sext i8 %22 to i32
  %tobool29 = icmp ne i32 %conv28, 0
  br i1 %tobool29, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %23 = load i32* %i, align 4
  %add = add nsw i32 %23, 1
  %idxprom30 = sext i32 %add to i64
  %24 = load i8** %sl.addr, align 8
  %arrayidx31 = getelementptr inbounds i8* %24, i64 %idxprom30
  %25 = load i8* %arrayidx31, align 1
  %conv32 = sext i8 %25 to i32
  %tobool33 = icmp ne i32 %conv32, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.body
  %26 = phi i1 [ false, %land.lhs.true ], [ false, %for.body ], [ %tobool33, %land.rhs ]
  %land.ext = zext i1 %26 to i32
  %conv34 = trunc i32 %land.ext to i8
  store i8 %conv34, i8* %t1, align 1
  %27 = load i32* %i, align 4
  %sub35 = sub nsw i32 %27, 1
  %idxprom36 = sext i32 %sub35 to i64
  %28 = load i8** %sl.addr, align 8
  %arrayidx37 = getelementptr inbounds i8* %28, i64 %idxprom36
  %29 = load i8* %arrayidx37, align 1
  %tobool38 = icmp ne i8 %29, 0
  br i1 %tobool38, label %land.end48, label %land.lhs.true39

land.lhs.true39:                                  ; preds = %land.end
  %30 = load i32* %i, align 4
  %idxprom40 = sext i32 %30 to i64
  %31 = load i8** %sl.addr, align 8
  %arrayidx41 = getelementptr inbounds i8* %31, i64 %idxprom40
  %32 = load i8* %arrayidx41, align 1
  %tobool42 = icmp ne i8 %32, 0
  br i1 %tobool42, label %land.end48, label %land.rhs43

land.rhs43:                                       ; preds = %land.lhs.true39
  %33 = load i32* %i, align 4
  %add44 = add nsw i32 %33, 1
  %idxprom45 = sext i32 %add44 to i64
  %34 = load i8** %sl.addr, align 8
  %arrayidx46 = getelementptr inbounds i8* %34, i64 %idxprom45
  %35 = load i8* %arrayidx46, align 1
  %tobool47 = icmp ne i8 %35, 0
  %lnot = xor i1 %tobool47, true
  br label %land.end48

land.end48:                                       ; preds = %land.rhs43, %land.lhs.true39, %land.end
  %36 = phi i1 [ false, %land.lhs.true39 ], [ false, %land.end ], [ %lnot, %land.rhs43 ]
  %land.ext49 = zext i1 %36 to i32
  %conv50 = trunc i32 %land.ext49 to i8
  store i8 %conv50, i8* %t2, align 1
  %37 = load i8* %t1, align 1
  %conv51 = sext i8 %37 to i32
  %tobool52 = icmp ne i32 %conv51, 0
  br i1 %tobool52, label %lor.end56, label %lor.rhs53

lor.rhs53:                                        ; preds = %land.end48
  %38 = load i8* %t2, align 1
  %conv54 = sext i8 %38 to i32
  %tobool55 = icmp ne i32 %conv54, 0
  br label %lor.end56

lor.end56:                                        ; preds = %lor.rhs53, %land.end48
  %39 = phi i1 [ true, %land.end48 ], [ %tobool55, %lor.rhs53 ]
  %lnot58 = xor i1 %39, true
  %lnot.ext = zext i1 %lnot58 to i32
  %conv59 = trunc i32 %lnot.ext to i8
  %40 = load i32* %i, align 4
  %idxprom60 = sext i32 %40 to i64
  %41 = load i8** %new_sl.addr, align 8
  %arrayidx61 = getelementptr inbounds i8* %41, i64 %idxprom60
  store i8 %conv59, i8* %arrayidx61, align 1
  br label %for.inc

for.inc:                                          ; preds = %lor.end56
  %42 = load i32* %i, align 4
  %inc = add nsw i32 %42, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %43 = load i8** %new_sl.addr, align 8
  ret i8* %43
}

define void @print_statelist(i8* %sl, i64 %width) nounwind uwtable {
entry:
  %sl.addr = alloca i8*, align 8
  %width.addr = alloca i64, align 8
  %i = alloca i32, align 4
  store i8* %sl, i8** %sl.addr, align 8
  store i64 %width, i64* %width.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64* %width.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i8** %sl.addr, align 8
  %arrayidx = getelementptr inbounds i8* %3, i64 %idxprom
  %4 = load i8* %arrayidx, align 1
  %conv2 = sext i8 %4 to i32
  %tobool = icmp ne i32 %conv2, 0
  %cond = select i1 %tobool, i32 64, i32 32
  %call = call i32 @putchar(i32 %cond)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call3 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @putchar(i32)

define void @run_and_display(i64 %niters) nounwind uwtable {
entry:
  %niters.addr = alloca i64, align 8
  %statelist1 = alloca [80 x i8], align 16
  %statelist2 = alloca [80 x i8], align 16
  %statelist = alloca i8*, align 8
  %new_statelist = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64 %niters, i64* %niters.addr, align 8
  %arraydecay = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 0, i64 80, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i64 40
  store i8 1, i8* %arrayidx, align 1
  %arraydecay1 = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  store i8* %arraydecay1, i8** %statelist, align 8
  %arraydecay2 = getelementptr inbounds [80 x i8]* %statelist2, i32 0, i32 0
  store i8* %arraydecay2, i8** %new_statelist, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64* %niters.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8** %statelist, align 8
  call void @print_statelist(i8* %2, i64 80)
  %3 = load i8** %new_statelist, align 8
  %4 = load i8** %statelist, align 8
  %call = call i8* @apply_rules(i8* %3, i8* %4, i64 80)
  store i8* %call, i8** %statelist, align 8
  %arraydecay4 = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  %cmp5 = icmp eq i8* %call, %arraydecay4
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %arraydecay7 = getelementptr inbounds [80 x i8]* %statelist2, i32 0, i32 0
  store i8* %arraydecay7, i8** %new_statelist, align 8
  br label %if.end

if.else:                                          ; preds = %for.body
  %arraydecay8 = getelementptr inbounds [80 x i8]* %statelist1, i32 0, i32 0
  store i8* %arraydecay8, i8** %new_statelist, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @run_and_display(i64 2)
  ret i32 0
}
